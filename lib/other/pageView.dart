import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/widget/dynamicPageView.dart';

class PageViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PageViewPageState();
  }
}

class _PageViewPageState extends State<PageViewPage> {
  List<String> urls = [
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201205%2F03%2F01400598djmyeczcskh2yr.jpg&refer=http%3A%2F%2Fattach.bbs.miui.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1625291567&t=c4dd86212d09a55d4f6b256ee05e253a',
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fww4.sinaimg.cn%2Fmw690%2F007ZVs3Jgy1gql936kg8hj30t01qjnab.jpg&refer=http%3A%2F%2Fwww.sina.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1625293779&t=a5b2e6d0d36a29421980b5bd4f1cae1d",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201308%2F23%2F144350zazrmibjc212v201.jpg&refer=http%3A%2F%2Fattach.bbs.miui.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1625291567&t=12d663b6e0fda2eadbb29282b7ecb622",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwx1.sinaimg.cn%2Fmw690%2F007ZVs3Jgy1gql9361pfij30t01qj152.jpg&refer=http%3A%2F%2Fwx1.sinaimg.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1625299176&t=59f130a5a57d029f258b8f32dea7015b",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201408%2F07%2F213601f2xz7usscm2z1mjh.jpg&refer=http%3A%2F%2Fattach.bbs.miui.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1625291567&t=d0bdae3b2600e107000acc475aa6b2bb"
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
