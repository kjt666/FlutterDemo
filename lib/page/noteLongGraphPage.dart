import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/util/methodChannelUtil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../custom_widget/circleImage.dart';
import '../custom_widget/nativeImageProvider.dart';
import '../custom_widget/relatedBook.dart';
import '../eum_noscroll_behavior.dart';

class NoteLongGraphPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NoteLongGraphPageState();
  }
}

class _NoteLongGraphPageState extends State<NoteLongGraphPage> {
  late ScrollController _scrollController;
  GlobalKey _repaintWidgetKey = GlobalKey(); // 绘图key值
  var _hideLoading = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: Color(0xffE6E6E6),
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: ScrollConfiguration(
                  behavior: EUMNoScrollBehavior(),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        RepaintBoundary(
                            key: _repaintWidgetKey,
                            child: Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 31, right: 31, top: 60),
                                  color: Color(0xffffffff),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _getHeader(),
                                      _getImage(),
                                      _getTitle(),
                                      _getContent(),
                                      _getMiddleBook(),
                                      _getMiddleTopic(),
                                      _getIntro(),
                                      _getFooter(),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left: 31,
                                  right: 31,
                                  top: 35,
                                  child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: 20,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return getWaterMarkItem(index);
                                      }),
                                ),
                              ],
                            )),
                        Container(
                          height: 20,
                          color: Color(0xffE6E6E6),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              _getShareLayout(),
            ],
          ),
        ),
        Positioned(
            child: Offstage(
          offstage: _hideLoading,
          child: Container(
            alignment: Alignment.center,
            color: Color(0x80000000),
            child: Platform.isAndroid
                ? CircularProgressIndicator(strokeWidth: 2)
                : CupertinoActivityIndicator(),
          ),
        ))
      ],
    ));
  }

  Widget getWaterMarkItem(int index) {
    return Opacity(
      opacity: 0.03,
      child: Container(
        height: 60,
        alignment: Alignment.center,
        child: index.isOdd
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image(
                    image: NativeImageProvider("ys_logo_watermark2"),
                    width: 40,
                    height: 40,
                  ),
                  Image(
                    image: NativeImageProvider("ys_logo_watermark2"),
                    width: 40,
                    height: 40,
                  )
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image(
                    image: NativeImageProvider("ys_logo_watermark2"),
                    width: 40,
                    height: 40,
                  ),
                  Image(
                    image: NativeImageProvider("ys_logo_watermark2"),
                    width: 40,
                    height: 40,
                  ),
                  Image(
                    image: NativeImageProvider("ys_logo_watermark2"),
                    width: 40,
                    height: 40,
                  )
                ],
              ),
      ),
    );
  }

  Widget _getHeader() {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 20),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            clipBehavior: Clip.none,
            children: [
              CircleImage(
                  "http://avatar.youshu.cc/readwith/20200707/5f044b9422e95.jpg",
                  width: 32,
                  height: 32),
              Positioned(
                  right: -1,
                  child: Image(
                    image: NativeImageProvider("new_vip_tag_icon"),
                    width: 12,
                    height: 12,
                  ))
            ],
          ),
          SizedBox(width: 8),
          Text(
            "沃斯尼蝶",
            style: TextStyle(fontSize: 14, color: Color(0xff1F1F1F)),
          ),
          Spacer(),
          Image(image: NativeImageProvider("ys_logo"), width: 32, height: 32)
        ],
      ),
    );
  }

  Widget _getImage() {
    return Offstage(
      offstage: false,
      child: Padding(
        padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
        ),
        child: Image.network(
            "https://img.youshu.cc/readwith/testNote/cf60cf97638325141eca96f4b1856f68.jpg"),
      ),
    );
  }

  Offstage _getTitle() {
    return Offstage(
      offstage: false,
      child: Padding(
        padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
        ),
        child: Text(
          "人人都用得到的赚钱秘籍人人都用得到的赚钱",
          style: TextStyle(
              color: Color(0xff1F1F1F),
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Offstage _getContent() {
    return Offstage(
      offstage: false,
      child: Padding(
        padding: EdgeInsets.only(
          top: 12,
          left: 15,
          right: 15,
        ),
        child: Text(
          """"#分享一次说走就走的旅行 @有书君 这首歌催发了内心一切的沮丧。那天晚上我望着窗外飞速闪过的星星点点灯光，默默流了一路的眼泪哭完却觉得：如释重负。
                           \n旅途又让人觉得飘荡无根据，这首歌催发了内心一切的沮丧。那天晚上我望着窗外飞速闪过的星星点点灯光，默默流了一路的眼泪哭完却觉得：如释重负。
                           \n旅途又让人觉得飘荡无根据，这首歌催发了内心一切的沮丧。那天晚上我望着窗外飞速闪过的星星点点灯光，默默流了一路的眼泪哭完却觉得：如释重负。
                           \n继科斯基·斯夫，开具地毯卖大力即便是看着别人三两结伴，万家灯火也不会再觉得孤单。这是一个出走的过程，在短暂的时间里与自己对话，在时光的缝隙中遇见真正的自己。""",
          style: TextStyle(color: Color(0xff1F1F1F)),
        ),
      ),
    );
  }

  //内容区关联书籍布局
  Widget _getMiddleBook() {
    return Offstage(
        offstage: false,
        child: Padding(
            padding: EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
            ),
            child: RelatedBook(
              "https://img.youshu.cc/readoo/20211206/61ad73b303542.jpg",
              "我曾走在崩溃的边缘",
              "俞敏洪",
              () {},
            )));
  }

  ///内容区话题布局
  Widget _getMiddleTopic() {
    return Offstage(
        offstage: false,
        child: Padding(
            padding: EdgeInsets.only(
              top: 10,
              left: 15,
              right: 15,
            ),
            child: GestureDetector(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: Container(
                        height: 24.0,
                        padding: EdgeInsets.fromLTRB(4.0, 3.5, 4.0, 3.5),
                        color: Color(0x0f3ED09C),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image(
                                image: NativeImageProvider(
                                    "edit_huati_icon_light"),
                                width: 12,
                                height: 12),
                            SizedBox(width: 1.5),
                            Flexible(
                                child: Text("来自话题：" + ("我尼玛"),
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff676767),
                                        fontWeight: FontWeight.w400),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis))
                          ],
                        ))))));
  }

  Offstage _getIntro() {
    return Offstage(
      offstage: false,
      child: Padding(
        padding: EdgeInsets.only(
          top: 18,
          left: 15,
          right: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "582回复 · 914赞 · 88转发",
              maxLines: 1,
              textAlign: TextAlign.end,
              style: TextStyle(color: Color(0xff1F1F1F), fontSize: 12),
            )
          ],
        ),
      ),
    );
  }

  Container _getFooter() {
    return Container(
      margin: EdgeInsets.only(top: 24),
      padding: EdgeInsets.only(left: 15, right: 16.5, top: 13, bottom: 13),
      decoration: BoxDecoration(color: Color(0xffF7F7F7)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: NativeImageProvider("ic_launcher"),
            width: 40,
            height: 40,
          ),
          SizedBox(width: 8),
          Column(
            children: [
              Text(
                "长按识别二维码",
                style: TextStyle(color: Color(0xff676767), fontSize: 11),
              ),
              SizedBox(height: 1),
              Text(
                "查看更多内容 >>",
                style: TextStyle(color: Color(0xff969696), fontSize: 10),
              )
            ],
          ),
          Spacer(),
          Image.network(
            "http://feed.youshu.cc/readwith/media/picture/6331144f721c7.jpeg",
            width: 57.6,
            height: 57.6,
          )
        ],
      ),
    );
  }

  //底部分享布局
  Widget _getShareLayout() {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Column(
        children: [
          Container(
            height: 121.5,
            child: GridView.count(
              padding: EdgeInsets.only(top: 37.5),
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                getMorePopItem("微信好友", "weixin2", () => Navigator.pop(context)),
                getMorePopItem(
                    "微信朋友圈", "pengyouquan2", () => Navigator.pop(context)),
                getMorePopItem("保存图片", "lianjie", () => _shareUiImage()),
              ],
            ),
          ),
          Container(height: 0.5, color: Color(0xffE6E6E6)),
          GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.only(top: 12),
                child: Text("取消",
                    style: TextStyle(color: Color(0xff969696), fontSize: 15)),
                height: Platform.isAndroid ? 60 : 79,
                alignment: Alignment.topCenter,
              )),
        ],
      ),
    );
  }

  Widget getMorePopItem(String text, String imgName, GestureTapCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image(width: 42.5, height: 42.5, image: NativeImageProvider(imgName)),
          SizedBox(height: 8),
          Text(text, style: TextStyle(color: Color(0xff383838), fontSize: 11))
        ],
      ),
    );
  }

  /// 分享图片
  Future _shareUiImage() async {
    setState(() {
      _hideLoading = !_hideLoading;
    });
    Uint8List? sourceBytes = await _capturePngToByteData();
    if (sourceBytes == null) {
      return;
    }
    try {
      var flag = await MethodChannelUtil.nativeChannel
          .invokeMethod("saveImage", {'data': sourceBytes});
      if (flag) {
        Fluttertoast.showToast(msg: "保存成功");
      }
    } on PlatformException catch (e) {
      Fluttertoast.showToast(msg: "保存失败");
      print(e.message);
    } finally {
      setState(() {
        _hideLoading = !_hideLoading;
      });
    }
    /*Directory tempDir = await getTemporaryDirectory();
    String storagePath = tempDir.path;
    File file = File(
        '$storagePath/oldbird_gen_image_${DateTime.now().millisecondsSinceEpoch}.png');
    debugPrint('::file:path: ${file.path}');
    if (!file.existsSync()) {
      file.createSync();
    }
    file.writeAsBytesSync(sourceBytes,flush: true);
    Fluttertoast.showToast(msg: "保存成功");*/
  }

  /// 截屏图片生成图片，返回图片二进制
  Future<Uint8List?> _capturePngToByteData() async {
    try {
      RenderRepaintBoundary boundary = _repaintWidgetKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary;
      if (boundary == null) {
        return null;
      }
      // 获取当前设备的像素比
      double dpr = ui.window.devicePixelRatio;
      ui.Image image = await boundary.toImage(pixelRatio: dpr);
      final sourceBytes = await image.toByteData(format: ImageByteFormat.png);
      return sourceBytes?.buffer.asUint8List();
    } catch (e) {
      return null;
    }
  }
}
