import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_aliplayer/flutter_aliplayer.dart';
import 'package:flutter_aliplayer/flutter_aliplayer_factory.dart';
import 'package:flutter_app/bean/note_info_bean.dart';
import 'package:flutter_app/video/formatter_util.dart';
import 'package:flutter_app/video/media_info.dart';
import 'package:flutter_app/video/video_config.dart';

import '../widget/filletImage.dart';
import '../widget/nativeImageProvider.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class VideoPlayerView extends StatefulWidget {
  VideoPlayerView({Key key, this.mediaInfo, this.noteInfo}) : super(key: key);
  final MediaInfo mediaInfo;
  final NoteInfo noteInfo;

  @override
  VideoPlayerViewState createState() => VideoPlayerViewState();
}

class VideoPlayerViewState extends State<VideoPlayerView> {
  FlutterAliplayer player;

  /// 播放模式
  ModeType _playMode;

  /// 不同模式传入不同数据
  var _dataSourceMap;

  /// 播放状态
  bool _playing = true;

  /// 是否显示状态栏+菜单栏
  bool isPlayShowCont = true;

  /// 总时长
  int _videoDuration = 1;

  /// 已播放时长
  int _currentPosition = 0;

  /// 上一次播放时长
  int _lastPosition = 0;

  ///定时器
  Timer _timer;

  /// 进度条当前进度
  double sliderValue = 0.0;

  ///倍速
  double mSpeedGroupValue = 1.0;

  ///倍速选项
  int mSpeedGroupValueIndex = 0;

  ///清晰度和倍速选项是否显示
  bool isConfigShowCont = false;

  ///选中的是倍速按钮
  bool isSpeedClicked = true;

  ///当前清晰度
  int currentTrackIndex = 0;

  ///显示第一帧图片
  bool showFirstImg = true;

  ///清晰度数组
  var tracks;

  ///倍速数组
  var speeds = [
    '2.0',
    '1.25',
    '1.0',
    '0.75',
  ];

  Map trackName = {
    "OD": "原画",
    "FD": "流畅",
    "LD": "标清",
    "SD": "高清",
    "HD": "超清",
    "2K": "2K",
    "4K": "4K"
  };

  _loadInitData() async {
    // double speedMode = await player.getRate();
    mSpeedGroupValue = /*speedMode ??*/ 1.0;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _loadInitData();
    if (widget.mediaInfo != null) {
      _playMode = widget.mediaInfo.videoInfo.videoId.length > 0
          ? ModeType.STS
          : ModeType.URL;
      if (widget.mediaInfo.videoInfo.videoUrl.length > 0) {
        _dataSourceMap = {
          DataSourceRelated.URL_KEY: widget.mediaInfo.videoInfo?.videoUrl
        };
      } else {
        _dataSourceMap = {
          DataSourceRelated.VID_KEY: widget.mediaInfo.videoInfo.videoId,
          DataSourceRelated.ACCESSKEYID_KEY:
              widget.mediaInfo.ossToken.accessKeyId,
          DataSourceRelated.ACCESSKEYSECRET_KEY:
              widget.mediaInfo.ossToken.accessKeySecret,
          DataSourceRelated.SECURITYTOKEN_KEY:
              widget.mediaInfo.ossToken.securityToken,
          DataSourceRelated.REGION_KEY: '',
          DataSourceRelated.PREVIEWTIME_KEY: '',
          DataSourceRelated.DEFINITION_LIST: ''
        };
      }
    }
    _videoDuration = int.parse(widget.noteInfo.audioLen);
    player = FlutterAliPlayerFactory.createAliPlayer(playerId: "player");
    _initListener();
    player.setAutoPlay(true);
    player.setLoop(true);
  }

  @override
  Widget build(BuildContext context) {
    var x = 0.0;
    var y = 0.0;
    Orientation orientation = MediaQuery.of(context).orientation;
    var width = MediaQuery.of(context).size.width;

    var barHeight = MediaQueryData.fromWindow(window).padding.top;
    var height;
    if (orientation == Orientation.portrait) {
      var videoH = width /
          (int.parse(widget.noteInfo.video_width) /
              int.parse(widget.noteInfo.video_height));
      if (videoH > MediaQuery.of(context).size.height / 2) {
        videoH = MediaQuery.of(context).size.height / 2;
      }
      height = videoH > 0 ? videoH : width * 9.0 / 15.0 - 5.0;
    } else {
      height = MediaQuery.of(context).size.height;
    }
    AliPlayerView aliPlayerView = AliPlayerView(
        onCreated: onViewPlayerCreated,
        x: x,
        y: y,
        width: width,
        height: height);
    Rect rect = Rect.fromLTRB(x, y, width, height);

    return GestureDetector(
      //单击
      onTap: () {
        setState(() {
          /// 显示 、隐藏  进度条+标题栏
          isPlayShowCont = !isPlayShowCont;
          isConfigShowCont = false;

          /// 如果显示了  , 3秒后 隐藏进度条+标题栏
          if (isPlayShowCont) {
            if (_timer != null) _timer.cancel();
            _timer = Timer(Duration(seconds: 3), () => isPlayShowCont = false);
          }
        });
      },
      //双击屏幕
      onDoubleTap: () {
        setState(() {
          _playing ? player.pause() : player.play();
          if (!_playing) {
            _lastPosition = sliderValue.toInt();
          }
          _playing = !_playing;
        });
      },
      /*横向拖动的开始状态*/
      onHorizontalDragStart: (startDetails) {
        print(startDetails.globalPosition);
        // Fluttertoast.showToast(msg: startDetails.toString());
        // player.pause();
      },
      onHorizontalDragUpdate: (DragUpdateDetails values) {
        setState(() {
          var sx = (values.delta.dx / 5 * 1000) + this.sliderValue;
          if (sx < 0.0) {
            sx = 0.0;
          } else if (sx > _videoDuration.toDouble()) {
            sx = _videoDuration.toDouble();
          }
          this.sliderValue = sx;
          player.seekTo(this.sliderValue.ceil(), FlutterAvpdef.INACCURATE);
        });

        // Fluttertoast.showToast(msg: values.delta.dx.toString());
      },
      /*横向拖动的结束状态*/
      onHorizontalDragEnd: (endDetails) {
        // Fluttertoast.showToast(msg: endDetails.toString());
        if (_playing) {
          _lastPosition = sliderValue.toInt();
        }
      },
      child: _getChildWidget(width, height, rect, orientation, aliPlayerView),
    );
  }

  _getChildWidget(var width, var height, Rect rect, Orientation orientation,
      AliPlayerView aliPlayerView) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          color: Colors.black,
          child: aliPlayerView,
        ),
        Positioned.fromRect(
          rect: rect,
          child: Container(
            color: Color.fromRGBO(0, 0, 0, 0),
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                /// 标题栏
                !isPlayShowCont
                    ? SizedBox()
                    : Container(
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                        height: 50,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Offstage(
                              offstage: MediaQuery.of(context).orientation ==
                                  Orientation.portrait,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: IconButton(
                                    icon: Icon(
                                      Icons.chevron_left,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      // NavigatorUtil.rota(true);
                                      SystemChrome.setPreferredOrientations([
                                        DeviceOrientation.portraitUp,
                                        DeviceOrientation.portraitDown
                                      ]);
                                    }),
                              ),
                            )
                          ],
                        ),
                      ),

                !isPlayShowCont ? SizedBox() : _getBigPlayBtn(),

                /// 控制条
                !isPlayShowCont
                    ? SizedBox()
                    : Container(
                        alignment: Alignment.center,
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                                width: orientation == Orientation.portrait
                                    ? 0
                                    : 20),
                            IconButton(
                                icon: Icon(
                                  _playing ? Icons.pause : Icons.play_arrow,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _playing ? player.pause() : player.play();
                                    if (!_playing) {
                                      _lastPosition = sliderValue.toInt();
                                    }
                                    _playing = !_playing;
                                  });
                                }),

                            Text(
                              "${FormatterUtils.getTimeformatByMs(_currentPosition)}",
                              style: TextStyle(color: Colors.white),
                            ),

                            /// 进度条 使用Slider滑动组件实现
                            SizedBox(width: 10),
                            _getSlider(),
                            // Spacer(flex: 1),
                            SizedBox(width: 10),
                            Text(
                              "${FormatterUtils.getTimeformatByMs(_videoDuration)}",
                              style: TextStyle(color: Colors.white),
                            ),
                            //全屏
                            SizedBox(width: 10),
                            _getFullBtn(orientation),

                            // _test(),
                            // _buildSpeed(),
                            _getSpeedButton('倍速'),
                            SizedBox(width: 5),
                            _getTrackButton('流畅'),
                            // _buildTrack(),
                            SizedBox(
                                width: orientation == Orientation.portrait
                                    ? 0
                                    : 20),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
        _showConfigWidget(isSpeedClicked ? speeds : tracks),
        // _showFirstImg(width, height),
      ],
    );
  }

  //播放暂停大按钮
  _getBigPlayBtn() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _playing ? player.pause() : player.play();
          if (!_playing) {
            _lastPosition = sliderValue.toInt();
          }
          _playing = !_playing;
        });
      },
      child: Icon(
        !_playing ? Icons.play_circle_fill : Icons.pause_circle_filled,
        color: Colors.white,
        size: 52,
      ),
    );
  }

  //全屏按钮
  _getFullBtn(Orientation orientation) {
    return Offstage(
        offstage: orientation == Orientation.landscape,
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (orientation == Orientation.portrait) {
                // NavigatorUtil.rota(false);
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.landscapeLeft,
                  DeviceOrientation.landscapeRight
                ]);
              } else {
                // NavigatorUtil.rota(true);
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitUp,
                  DeviceOrientation.portraitDown
                ]);
              }
            });
          },
          child: Icon(
            Icons.fullscreen,
            color: Colors.white,
            size: 24,
          ),
        ));
  }

  ///显示视频第一帧图片
  _showFirstImg(var width, var height) {
    return Offstage(
      offstage: !showFirstImg,
      child: FilletImage(
        widget.noteInfo.headImg != null && widget.noteInfo.headImg.length > 0
            ? widget.noteInfo.headImg
            : widget.noteInfo.audio_image,
        corner: 0,
        width: width,
        height: height,
      ),
    );
  }

  ///倍速按钮
  _getSpeedButton(String title) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Offstage(
        offstage:
            orientation == Orientation.portrait || _playMode == ModeType.URL,
        child: Container(
          child: TextButton(
            onPressed: () {
              isSpeedClicked = true;
              isConfigShowCont = !isConfigShowCont;
              setState(() {});
            },
            child: Text(title, style: TextStyle(color: Colors.white)),
          ),
        ));
  }

  ///清晰度按钮
  _getTrackButton(String title) {
    AVPTrackInfo info = tracks != null
        ? AVPTrackInfo.fromJson(tracks[currentTrackIndex])
        : null;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Offstage(
        offstage:
            orientation == Orientation.portrait || _playMode == ModeType.URL,
        child: Container(
            child: TextButton(
          onPressed: () {
            isSpeedClicked = false;
            isConfigShowCont = !isConfigShowCont;
            setState(() {});
          },
          child: Text(
            info != null ? trackName[info.trackDefinition] ?? "" : title,
            style: TextStyle(color: Colors.white),
          ),
        )));
  }

  _showConfigWidget(var titles) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return titles != null
        ? Offstage(
            offstage: !isConfigShowCont,
            child: Container(
              margin: EdgeInsets.only(top: 0, left: width - 200, bottom: 0),
              width: 200,
              height: height,
              color: Colors.black54,
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    height: 40,
                    child: Text(
                      isSpeedClicked ? '倍速' : '清晰度',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                      height: height - 50 - 30 - 40,
                      padding: EdgeInsets.only(right: 40),
                      child: ListView.builder(
                        itemCount: titles.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (isSpeedClicked) {
                                    String titleValue = titles[index];
                                    mSpeedGroupValue = double.parse(titleValue);
                                    player.setRate(mSpeedGroupValue);
                                  } else {
                                    int trackIndex =
                                        titles[index]['trackIndex'];
                                    player.selectTrack(trackIndex);
                                    currentTrackIndex = trackIndex;
                                  }
                                });
                                isConfigShowCont = !isConfigShowCont;
                              },
                              child: Container(
                                height: 40,
                                child: Text(
                                  isSpeedClicked
                                      ? '${titles[index]}X'
                                      : '${trackName[titles[index]['trackDefinition'].toString()]}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: isSpeedClicked
                                          ? mSpeedGroupValue ==
                                                  double.parse(titles[index])
                                              ? Colors.green[800]
                                              : Colors.white
                                          : currentTrackIndex == index
                                              ? Colors.green[800]
                                              : Colors.white),
                                ),
                              ));
                        },
                      )),
                ],
              ),
            ),
          )
        : Container();
  }

  ///视频进度条
  _getSlider() {
    return Flexible(
        child: SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 2,
        //trackHeight：滑轨的高度

        thumbShape: RoundSliderThumbShape(
          //可继承SliderComponentShape自定义形状
          disabledThumbRadius: 0, //禁用时滑块大小
          enabledThumbRadius: 4, //滑块大小
        ),
        overlayShape: RoundSliderOverlayShape(
          //可继承SliderComponentShape自定义形状
          overlayRadius: 0, //滑块外圈大小
        ),

        //已拖动的颜色
        activeTrackColor: Colors.white,
        //未拖动的颜色
        inactiveTrackColor: Colors.grey[400],
        //滑块中心的颜色
        thumbColor: Colors.white,
        //滑块边缘的颜色
        overlayColor: Colors.white,
      ),
      child: Slider(
        value: this.sliderValue,
        min: 0.0,
        max: _videoDuration.toDouble(),
        onChanged: (val) {
          ///转化成double
          setState(() {
            this.sliderValue = val.floorToDouble();
          });
          player.seekTo(val.ceil(), FlutterAvpdef.INACCURATE);

          /// 设置进度
          // player.seekTo(this.sliderValue.toInt());
//                            print(this.sliderValue);
        },
        onChangeStart: (value) {},
        onChangeEnd: (value) {
          setState(() {
            this.sliderValue = value;
            _lastPosition = sliderValue.toInt();
          });
        },
      ),
    ));
  }

  ///视频事件监听
  _initListener() {
    player.setOnPrepared((playerId) {
      // Fluttertoast.showToast(msg: "OnPrepared ");
      showFirstImg = false;
      player.getPlayerName().then((value) => print("getPlayerName==${value}"));
      player.getMediaInfo().then((value) {
        setState(() {
          tracks = value['tracks'];
          _videoDuration = value['duration'];

          AVPTrackInfo info = AVPTrackInfo.fromJson(tracks[0]);
          currentTrackIndex = info.trackIndex;
          // Fluttertoast.showToast(msg: '222222 ' + currentTrackIndex.toString());

          // Fluttertoast.showToast(
          //     msg:
          //         '${tracks[0]['trackDefinition'].toString()}  ${tracks[1]['trackDefinition'].toString()}    ${tracks[2]['trackDefinition'].toString()}');
        });
      });
    });

    player.setOnRenderingStart((playerId) {
      // Fluttertoast.showToast(msg: " OnFirstFrameShow ");
    });
    // player.setOnVideoSizeChanged((width, height, playerId) {});
    player.setOnStateChanged((newState, playerId) {
      //播放器状态改变事件
      print("aliyun : onStateChanged $newState");
      switch (newState) {
        case FlutterAvpdef.AVPStatus_AVPStatusPrepared:
          // /** @brief 准备完成 当前是自动播放，准备完成后直接上报*/
          break;
        case FlutterAvpdef.AVPStatus_AVPStatusStarted:
          _playing = true;
          break;
        case FlutterAvpdef.AVPStatus_AVPStatusPaused:
          _playing = false;

          break;

        default:
      }
    });
    player.setOnLoadingStatusListener(loadingBegin: (playerId) {
      setState(() {
        // _loadingPercent = 0;
      });
    }, loadingProgress: (percent, netSpeed, playerId) {
      // _loadingPercent = percent;
      if (percent == 100) {}
      setState(() {});
    }, loadingEnd: (playerId) {
      setState(() {});
    });
    player.setOnSeekComplete((playerId) {
      // Fluttertoast.showToast(msg: 'seek干啥');
      // _inSeek = false;
    });
    player.setOnInfo((infoCode, extraValue, extraMsg, playerId) {
      //其他信息的事件，type包括了：循环播放开始，缓冲位置，当前播放位置，自动播放开始等
      if (infoCode == FlutterAvpdef.CURRENTPOSITION) {
        if (_videoDuration != 0 && extraValue <= _videoDuration) {
          // _currentPosition = extraValue;
          setState(() {
            _currentPosition = extraValue;
            sliderValue = extraValue.toDouble();
          });
        }
        // if (!_inSeek) {

        // }
      } else if (infoCode == FlutterAvpdef.BUFFEREDPOSITION) {
        // _bufferPosition = extraValue;
        if (mounted) {
          setState(() {});
        }
      } else if (infoCode == FlutterAvpdef.AUTOPLAYSTART) {
        // Fluttertoast.showToast(msg: "AutoPlay");
      } else if (infoCode == FlutterAvpdef.CACHESUCCESS) {
        // Fluttertoast.showToast(msg: "Cache Success");
      } else if (infoCode == FlutterAvpdef.CACHEERROR) {
        // Fluttertoast.showToast(msg: "Cache Error $extraMsg");
      } else if (infoCode == FlutterAvpdef.LOOPINGSTART) {
        // Fluttertoast.showToast(msg: "Looping Start");
      } else if (infoCode == FlutterAvpdef.SWITCHTOSOFTWAREVIDEODECODER) {
        // Fluttertoast.showToast(msg: "change to soft ware decoder");
        // mOptionsFragment.switchHardwareDecoder();
      }
    });
    player.setOnCompletion((playerId) {
      //播放完成事件
      setState(() {
        // _currentPosition = _videoDuration;
        this.sliderValue = 0;
        _currentPosition = 0;
        // _playing = false;
        player.prepare();
        _lastPosition = 0;
      });
    });
    player.setOnTrackReady((playerId) {
      player.getMediaInfo().then((value) {
        setState(() {});
        List thumbnails = value['thumbnails'];
        // Fluttertoast.showToast(msg: thumbnails.toString());

        if (thumbnails != null && thumbnails.isNotEmpty) {
          player.createThumbnailHelper(thumbnails[0]['url']);
        } else {
          // _thumbnailSuccess = false;
        }
      });
      // trackFragmentKey.currentState.loadData();
      setState(() {});
    });

    player.setOnSnapShot((path, playerId) {
      //截图事件
      print("aliyun : snapShotPath = $path");
      // Fluttertoast.showToast(msg: "SnapShot Save : $path");
    });
    player.setOnError((errorCode, errorExtra, errorMsg, playerId) {
      //出错事件

      setState(() {});
    });

    player.setOnTrackChanged((value, playerId) {
      //切换清晰度
      AVPTrackInfo info = AVPTrackInfo.fromJson(value);
      if (info != null && info.trackDefinition.length > 0) {
        // trackFragmentKey.currentState.onTrackChanged(info);
        // Fluttertoast.showToast(msg: "${info.trackDefinition}切换成功");
      }
    });

    player.setOnThumbnailPreparedListener(preparedSuccess: (playerId) {
      // _thumbnailSuccess = true; 是否有缩略图
    }, preparedFail: (playerId) {
      // _thumbnailSuccess = false;
    });

    player.setOnThumbnailGetListener(
        onThumbnailGetSuccess: (bitmap, range, playerId) {
          // _thumbnailBitmap = bitmap;
          var provider = MemoryImage(bitmap);
          precacheImage(provider, context).then((_) {
            setState(() {
              // _imageProvider = provider; 缩略图
            });
          });
        },
        onThumbnailGetFail: (playerId) {});
  }

  ///播放模式
  void onViewPlayerCreated(viewId) async {
    this.player.setPlayerView(viewId);
    this.player.setUrl("http://feed.youshu.cc/pack_video/99/1491901391505.mp4");
    this.player.prepare();
    /*switch (_playMode) {
      case ModeType.URL:
        this.player.setUrl(_dataSourceMap[DataSourceRelated.URL_KEY]);
        this.player.prepare();
        break;
      case ModeType.STS:
        this.player.setVidSts(
              vid: _dataSourceMap[DataSourceRelated.VID_KEY],
              region: _dataSourceMap[DataSourceRelated.REGION_KEY],
              accessKeyId: _dataSourceMap[DataSourceRelated.ACCESSKEYID_KEY],
              accessKeySecret:
                  _dataSourceMap[DataSourceRelated.ACCESSKEYSECRET_KEY],
              securityToken:
                  _dataSourceMap[DataSourceRelated.SECURITYTOKEN_KEY],
              // definitionList: _dataSourceMap[DataSourceRelated.DEFINITION_LIST],
              // previewTime: _dataSourceMap[DataSourceRelated.PREVIEWTIME_KEY],
            );
        this.player.prepare();
        break;
      case ModeType.AUTH:
        this.player.setVidAuth(
            vid: _dataSourceMap[DataSourceRelated.VID_KEY],
            region: _dataSourceMap[DataSourceRelated.REGION_KEY],
            playAuth: _dataSourceMap[DataSourceRelated.PLAYAUTH_KEY],
            definitionList: _dataSourceMap[DataSourceRelated.DEFINITION_LIST],
            previewTime: _dataSourceMap[DataSourceRelated.PREVIEWTIME_KEY]);
        break;
      case ModeType.MPS:
        this.player.setVidMps(_dataSourceMap);
        break;
      default:
    }*/
  }

  void pause() {
    if (player != null && _playing) {
      print("<<<<<<<<<<<< player.pause()>>>>>>>>>>>>");
      player.pause();
      _playing = false;
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    player.stop();
    player.destroy();
    print("<<<<<<<<<<<<video dispose()>>>>>>>>>>>>");
  }
}
