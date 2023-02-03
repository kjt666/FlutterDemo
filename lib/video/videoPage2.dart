
import 'package:flutter/material.dart';
import 'package:flutter_aliplayer/flutter_aliplayer.dart';
import 'package:flutter_aliplayer/flutter_aliplayer_factory.dart';

class VideoPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VideoPageState2();
  }
}

class VideoPageState2 extends State<VideoPage2> {
  FlutterAliplayer fAliplayer;

  @override
  void initState() {
    super.initState();
    fAliplayer = FlutterAliPlayerFactory.createAliPlayer(playerId: "playerId2");
    fAliplayer.setAutoPlay(true);
    fAliplayer.setLoop(true);
    //准备成功
    fAliplayer.setOnPrepared((playerId) {
    });
//首帧显示
    fAliplayer.setOnRenderingStart((playerId) {});
//视频宽高变化
//     fAliplayer.setOnVideoSizeChanged((width, height, playerId) {});
//播放器状态变化
    fAliplayer.setOnStateChanged((newState, playerId) {});
//加载状态
    fAliplayer.setOnLoadingStatusListener(
        loadingBegin: (playerId) {},
        loadingProgress: (percent, netSpeed, playerId) {},
        loadingEnd: (playerId) {});
//拖动完成
    fAliplayer.setOnSeekComplete((playerId) {});
//播放器事件信息回调，包括buffer、当前播放进度等等信息，根据infoCode来判断，对应FlutterAvpdef.infoCode
    fAliplayer.setOnInfo((infoCode, extraValue, extraMsg, playerId) {});
//播放完成
    fAliplayer.setOnCompletion((playerId) {});
//设置流准备完成
    fAliplayer.setOnTrackReady((playerId) {});
//截图结果
    fAliplayer.setOnSnapShot((path, playerId) {});
//错误结果
    fAliplayer.setOnError((errorCode, errorExtra, errorMsg, playerId) {});
//切换流变化
    fAliplayer.setOnTrackChanged((value, playerId) {});
  }

  @override
  Widget build(BuildContext context) {
    var x = 0.0;
    var y = 0.0;
    Orientation orientation = MediaQuery.of(context).orientation;
    var width = MediaQuery.of(context).size.width;

    var height;
    if (orientation == Orientation.portrait) {
      height = width * 9.0 / 16.0;
    } else {
      height = MediaQuery.of(context).size.height;
    }
    AliPlayerView aliPlayerView = AliPlayerView(
        onCreated: (viewId) {
          fAliplayer.setPlayerView(viewId);
          fAliplayer.setUrl("http://feed.youshu.cc/pack_video/99/1491901391505.mp4");
          // fAliplayer.setVidSts(
          //   vid: "c22b0038e4a945989ad18dfafedadaa5",
          //   region: "",
          //   accessKeyId: "STS.NTgzWAHu6RRBay6DKfeEZdTEz",
          //   accessKeySecret:
          //   "2NhyH7VdiTiuqduNrT3z6e6zcAMgLbVhoJ2mUKCNzxdw",
          //   securityToken:
          //   "CAIS6gF1q6Ft5B2yfSjIr5fSMe31paoX5ZCpY1+HoEszacp2i5HumDz2IHhJenhhAuwZtfU0lG9Y7\/YYlqJ4T55IQ1Dza8J148y5acBr19KT1fau5Jko1beHewHKeTOZsebWZ+LmNqC\/Ht6md1HDkAJq3LL+bk\/Mdle5MJqP+\/UFB5ZtKWveVzddA8pMLQZPsdITMWCrVcygKRn3mGHdfiEK00he5zoktPnvk\/fxsESO0AfIrcYOvJn0L5SeaM1hAYxySd\/d3pYtLvefgX8Lt0cRpfwm0\/wdqW3d2cuUBkNc6hmBNe7F6NprIR+0rcgagAGVq21ZKnqCCWRIsInnCXNtIOmMWoUBCPxuqpvRgwlnsBCsCLUgY0\/zmBDuq+ZnzYmk6vijkcDt+Bk0HOTO2d6A6UxcVho9CPImbRPCrAuxjZJ436co4lxJTSgUCqCijFQwbpXq6PoEJm0tR64A+JM5VZ9Tabe\/TM1myGcSEUpBHw==",
          //   // definitionList: _dataSourceMap[DataSourceRelated.DEFINITION_LIST],
          //   // previewTime: _dataSourceMap[DataSourceRelated.PREVIEWTIME_KEY],
          // );
          fAliplayer.prepare();
        },
        x: x,
        y: y,
        width: width,
        height: height);
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                  color: Colors.black,
                  child: aliPlayerView,
                  width: width,
                  height: height),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    fAliplayer.stop();
    fAliplayer.destroy();
  }

// ///头部视频布局
// Widget _getVideo() {
//   Orientation orientation = MediaQuery.of(context).orientation;
//   var barHeight = MediaQueryData.fromWindow(window).padding.top;
//
//   var width = MediaQuery.of(context).size.width;
//   var height;
//   if (orientation == Orientation.portrait) {
//     var videoH = width /
//         (int.parse(noteInfo.video_width) / int.parse(noteInfo.video_height));
//     if (videoH > MediaQuery.of(context).size.height / 2) {
//       videoH = MediaQuery.of(context).size.height / 2;
//     }
//     height = videoH > 0 ? videoH : width * 9.0 / 15.0 - 5.0;
//   } else {
//     height = MediaQuery.of(context).size.height;
//   }
//   return Container(
//     width: width,
//     height: height,
//     color: Colors.black,
//   );
// }
}
