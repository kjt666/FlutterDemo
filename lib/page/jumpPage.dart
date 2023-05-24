import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/other/loggerPage.dart';
import 'package:flutter_app/page/myPage.dart';
import 'package:flutter_app/page/noteLongGraphPage.dart';
import 'package:flutter_app/page/notePage.dart';
import 'package:flutter_app/page/stateTestPage.dart';
import 'package:flutter_app/page/thirdPage.dart';
import 'package:flutter_app/page/widgetsPage.dart';
import 'package:flutter_app/util/DioUtil.dart';
import 'package:flutter_app/util/methodChannelUtil.dart';
import 'package:flutter_app/video/videoPage2.dart';

import '../other/nativeImage.dart';

class JumpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JumpState();
  }
}

class _JumpState extends State<JumpPage> {
  int index = 0;
  Color oddItemColor = Colors.blueGrey.shade50;
  Color evenItemColor = Colors.blueGrey.shade100;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MethodChannelUtil.nativeChannel.setMethodCallHandler((call) {
      if (call.method == "lal") {
        return Future.value("Hello~ ${call.arguments}\nI'm flutter");
      }
      return Future.value(null);
    });
    DioUtil.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JumpPage"),
      ),
      body: ListView(
        children: [
          getJumpItem("原生小部件集合", jumpPage: new WidgetsPage()),
          getJumpItem("第三方框架", jumpPage: new ThirdPage()),
          getJumpItem("展示原生中的图片", jumpPage: new NativeImagePage()),
          getJumpItem("logger日志输出", jumpPage: new LoggerPage()),
          getJumpItem("打开原生页面", function: () {
            MethodChannelUtil.nativeChannel.invokeMethod("jumpToNative");
          }),
          getJumpItem("复杂页面1~~~", jumpPage: new MyPage()),
          getJumpItem("复杂页面2~~~", jumpPage: new NotePage()),
          getJumpItem("复杂页面3~~~", jumpPage: new NoteLongGraphPage()),
          getJumpItem("StateTest", jumpPage: new StateTestPage()),
          getJumpItem("AliVideoView", jumpPage: new VideoPage2()),
        ],
      ),
    );
  }

  Widget getJumpItem(String title, {Widget? jumpPage, Function? function}) {
    index++;
    return Card(
      color: index.isOdd ? oddItemColor : evenItemColor,
      child: ListTile(
        title: Text(title),
        // tileColor: index.isOdd ? oddItemColor : evenItemColor,
        onTap: () {
          if (jumpPage != null) {
            Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => jumpPage,
                ));
          }
          if (function != null) {
            function.call();
          }
        },
      ),
    );
  }
}
