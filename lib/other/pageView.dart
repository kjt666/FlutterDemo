import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../custom_widget/dynamicPageView.dart';

class PageViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PageViewPageState();
  }
}

class _PageViewPageState extends State<PageViewPage> {
  List<String> urls = [
    'https://img2.baidu.com/it/u=2243573419,589412055&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500',
  "https://img0.baidu.com/it/u=242767209,2541342896&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Fe7488158-0b29-456b-8124-656851869b42%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1688527479&t=52e21818e0dda490b04dc14417fda0a9",
    "https://img1.baidu.com/it/u=1508617168,4244230514&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
    "https://img0.baidu.com/it/u=1320971078,3815664576&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PageView"),
        ),
        body: ListView(
          children: [
            DynamicPageView(
              null,
              context,
              urls,
              clickCallBack: (index, url) {
                print("index = $index,url = $url");
              },
            ),
            Text('''如果非空，则要求图像具有此高度。

            如果为 null，则图像将选择最能保留其固有纵横比的大小。

            强烈建议 指定宽度和高度，或者将小部件放置在设置严格布局约束的上下文中，以便图像在加载时不会改变大小。如果事先不知道确切的图像尺寸，请考虑使用fit来调整图像的渲染以适应给定的宽度和高度。''')
          ],
        ));
  }
}
