import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/page/ScreenUtilPage.dart';
import 'package:flutter_app/page/googleFontsPage.dart';
import 'package:flutter_app/page/myPage.dart';
import 'package:flutter_app/page/notePage.dart';
import 'package:flutter_app/other/loggerPage.dart';
import 'package:flutter_app/page/webViewPage.dart';
import 'package:flutter_app/page/widgetsPage.dart';
import 'package:flutter_app/util/DioUtil.dart';
import 'package:flutter_app/util/methodChannelUtil.dart';

import '../other/nativeImage.dart';
import 'questionDetailPage.dart';

class JumpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JumpState();
  }
}

class _JumpState extends State<JumpPage> {
  int index = 0;
  Color oddItemColor = Colors.blueGrey[50];
  Color evenItemColor = Colors.blueGrey[100];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MethodChannelUtil.nativeChannel.setMethodCallHandler((call) {
      if (call.method == "lal") {
        return Future.value("Hello~ ${call.arguments}\nI'm flutter");
      }
      return null;
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
          getJumpItem("小部件集合", jumpPage: new WidgetsPage()),
          getJumpItem("展示原生中的图片", jumpPage: new NativeImagePage()),
          getJumpItem("logger日志输出", jumpPage: new LoggerPage()),
          getJumpItem("打开原生页面", function: () {
            MethodChannelUtil.nativeChannel.invokeMethod("jumpToNative");
          }),
          getJumpItem("复杂页面1~~~", jumpPage: new MyPage()),
          getJumpItem("复杂页面2~~~", jumpPage: new NotePage()),
          getJumpItem("Flutter页面适配",jumpPage: new ScreenUtilPage()),
          getJumpItem("WebView",jumpPage: new WebViewExample()),
          getJumpItem("GoogleFonts",jumpPage: new GoogleFontsPage()),
          getJumpItem("QuestionDetailPage",jumpPage: new QuestionDetailPage())
        ],
      ),
    );
  }

  Widget getJumpItem(String title, {Widget jumpPage, Function function}) {
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
