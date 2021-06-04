import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/circleImage.dart';
import 'package:flutter_app/widget/dynamicPageView.dart';

class NotePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotePageState();
  }
}

class _NotePageState extends State<NotePage> {
  /*List<String> urls = [
    "http://img.youshu.cc/readwith/testNote/9dac16187fb8b3332bef66f96316c2f9.jpg",
    "http://img.youshu.cc/readwith/testNote/8c034773addc8ba95fb856fb43ec2d71.jpg",
    "http://img.youshu.cc/readwith/testNote/7effe4fd75b685737fb06fb1636ef9f4.jpg",
    "http://img.youshu.cc/readwith/testNote/3d7867e969dd4693e17b3aa89c6a4154.jpg",
    "http://img.youshu.cc/readwith/testNote/b279d5c988e41e5930d19567e40ef862.jpg",
    "http://img.youshu.cc/readwith/testNote/4dbe25736d6ea8705279439ebc0c09ac.jpg",
    "http://img.youshu.cc/readwith/testNote/db92fc3d885b6526213d2af2637c33a3.jpg"
  ];*/

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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: DynamicPageView(
              context,
              urls,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Card(
                child: Center(
                  heightFactor: 5,
                  child: Text(
                    "$index",
                  ),
                ),
              );
            }, childCount: 20),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 5.0,
        color: Colors.white,
        child: Container(
          height: 50,
          child: Row(
              children: [
                CircleImage("url")
              ],
          ),
        ),
      ),
    );
  }
}
