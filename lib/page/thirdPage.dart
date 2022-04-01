import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/other/third/badge.dart';
import 'package:flutter_app/other/third/cachedNetworkImage.dart';
import 'package:flutter_app/other/third/slidable.dart';
import 'package:flutter_app/page/providerPage.dart';
import 'package:flutter_app/page/screenUtilPage.dart';
import 'package:flutter_app/page/webViewPage.dart';
import 'package:flutter_app/third/lottiePage.dart';

import 'googleFontsPage.dart';
import 'imagePicker.dart';

class ThirdPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ThirdPageState();
  }
}

class ThirdPageState extends State<ThirdPage> {
  int index = 0;
  Color oddItemColor = Colors.blueGrey[50];
  Color evenItemColor = Colors.blueGrey[100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WidgetsPage"),
      ),
      body: ListView(
        children: [
          getJumpItem("Flutter ScreenUtil(页面适配)", new ScreenUtilPage()),
          getJumpItem("WebView", new WebViewExample()),
          getJumpItem("GoogleFonts(字体样式)", new GoogleFontsPage()),
          getJumpItem("ImagePicker(图片选择器)", new ImagePickerPage()),
          getJumpItem("Provider", new ProviderPage()),
          getJumpItem("badge(徽章，小红点)", new BadgePage()),
          getJumpItem(
              "cachedNetworkImage(带网络缓存的图片)", new CachedNetworkImagePage()),
          getJumpItem("slidable(左滑右滑)", new SlidablePage()),
          getJumpItem("lottie(Json动画)", new LottiePage()),
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
