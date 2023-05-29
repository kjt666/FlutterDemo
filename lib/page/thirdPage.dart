import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/third/badge.dart';
import 'package:flutter_app/third/cachedNetworkImage.dart';
import 'package:flutter_app/third/flutter_animate/flutterAnimateExample.dart';
import 'package:flutter_app/third/lottiePage.dart';
import 'package:flutter_app/third/pigeonPage.dart';
import 'package:flutter_app/third/providerPage.dart';
import 'package:flutter_app/third/ratingBarPage.dart';
import 'package:flutter_app/third/screenUtilPage.dart';
import 'package:flutter_app/third/slidable.dart';
import 'package:flutter_app/third/webViewPage.dart';

import '../third/flutter_animate.dart';
import '../third/googleFontsPage.dart';
import '../third/html.dart';
import 'imagePicker.dart';

class ThirdPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ThirdPageState();
  }
}

class ThirdPageState extends State<ThirdPage> {
  int index = 0;
  Color oddItemColor = Colors.blueGrey.shade50;
  Color evenItemColor = Colors.blueGrey.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WidgetsPage"),
      ),
      body: ListView(
        children: [
          getJumpItem("Flutter ScreenUtil(页面适配)", new ScreenUtilPage()),
          getJumpItem("html(富文本)", new HtmlPage()),
          getJumpItem("WebView", new WebViewExample()),
          getJumpItem("GoogleFonts(字体样式)", new GoogleFontsPage()),
          getJumpItem("ImagePicker(图片选择器)", new ImagePickerPage()),
          getJumpItem("Provider", new ProviderPage()),
          getJumpItem("badge(徽章，小红点)", new BadgePage()),
          getJumpItem(
              "cachedNetworkImage(带网络缓存的图片)", new CachedNetworkImagePage()),
          getJumpItem("slidable(左滑右滑)", new SlidablePage()),
          getJumpItem("lottie(Json动画)", new LottiePage()),
          getJumpItem("ratingBar(评分栏)", new RatingBarPage()),
          getJumpItem("flutter_animate(方便快捷实现动画效果)", new FlutterAnimate()),
          getJumpItem("flutter_animate(官方示例)", new FlutterAnimateExample()),
          getJumpItem("pigeon", new PigeonPage()),
        ],
      ),
    );
  }

  Widget getJumpItem(String title, Widget jumpPage) {
    index++;
    return Card(
      color: index.isOdd ? oddItemColor : evenItemColor,
      child: ListTile(
        title: Text(title),
        // tileColor: index.isOdd ? oddItemColor : evenItemColor,
        onTap: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => jumpPage,
              ));
        },
      ),
    );
  }
}
