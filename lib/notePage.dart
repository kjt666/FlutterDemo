import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/widget/circleImage.dart';
import 'package:flutter_app/widget/dynamicPageView.dart';
import 'package:flutter_app/widget/filletButton.dart';
import 'package:flutter_app/widget/filletImage.dart';
import 'package:flutter_app/widget/labelImage.dart';
import 'package:flutter_app/widget/gradientAppBar.dart';
import 'package:flutter_app/widget/nativeImageProvider.dart';

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

  ScrollController scrollController;
  GlobalKey middleHeaderkey = GlobalKey();
  double titleBarOpacity = 0;
  double middleHeaderOffset;

  GlobalKey<GradientAppBarState> barKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      int alpha = ((scrollController.offset / 200) * 255).toInt();
      print("----------$scrollController.offset---------");
      barKey.currentState.changeBarColor(alpha < 255 ? alpha : 255);

      barKey.currentState
          .showHeader(scrollController.offset >= middleHeaderOffset);
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      RenderBox render = middleHeaderkey.currentContext.findRenderObject();
      print("${render.size}");
      print("${render.localToGlobal(Offset.zero)}");
      RenderBox barRender = barKey.currentContext.findRenderObject();
      print("appbar size = ${barRender.size}");
      print("appbar location = ${barRender.localToGlobal(Offset.zero)}");
      middleHeaderOffset = render.localToGlobal(Offset.zero).dy -
          barRender.localToGlobal(Offset.zero).dy -
          render.size.height;
      print("中间头像竖直偏移量阈值 = $middleHeaderOffset");
    });
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: scrollController,
            slivers: [
              _getHeader(),
              _getMiddleContent(),
              _getListTitle(),
              _getList(),
            ],
          ),
          GradientAppBar(barKey)
        ],
      ),
      bottomNavigationBar: _getBottomBar(),
    );
  }

  Widget _getHeader() {
    return SliverToBoxAdapter(
      child: DynamicPageView(
        context,
        urls,
      ),
    );
  }

  Widget _getMiddleContent() {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(20, 20, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("哈利路亚",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))),
            Row(
              children: [
                CircleImage(imageUrl, width: 35, height: 35, onTap: () {}),
                SizedBox(width: 10),
                Column(
                  key: middleHeaderkey,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text("f**k",
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                      Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Image(
                              image: NativeImageProvider("lingduren"),
                              width: 50,
                              height: 25)),
                      Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Image(
                              image: NativeImageProvider("new_vip_tag_icon"),
                              width: 15,
                              height: 15))
                    ]),
                    SizedBox(height: 5),
                    Text("2021-06-06",
                        style: TextStyle(fontSize: 12, color: Colors.grey))
                  ],
                ),
                Spacer(
                  flex: 1,
                ),
                FilletButton("关注"),
              ],
            ),
            SizedBox(height: 20),
            Text(
                "春秋时期，齐国的公子纠与公子小白争夺君位，管仲和鲍叔分别辅佐他们。管仲带兵阻击小白，用箭射中他的衣带钩，小白装死逃脱。后来小白即位为君，史称齐桓公。鲍叔对桓公说，要想成就霸王之业，非管仲不可。于是桓公重用管仲，鲍叔甘居其下，终成一代霸业。后人称颂齐桓公九合诸侯、一匡天下，为“春秋五霸”之首。孔子说：“桓公九合诸侯，不以兵车，管仲之力也。”司马迁说：“天下不多（称赞）管仲之贤而多鲍叔能知人也。”",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black,
                )),
            SizedBox(height: 20),
            _getMiddleBook(),
            SizedBox(height: 20),
            Row(children: [
              Image(
                  image: NativeImageProvider("edit_huati_icon"),
                  width: 18,
                  height: 18),
              SizedBox(width: 5),
              Text("来自话题：", style: TextStyle(color: Colors.grey)),
              Text("论持久战", style: TextStyle(color: Colors.blue)),
            ]),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              _getMiddleIconBtn("11", "tabbar_like_icon"),
              SizedBox(width: 10),
              _getMiddleIconBtn("微信", "wenzhang_detail_wechat"),
              SizedBox(width: 10),
              _getMiddleIconBtn("朋友圈", "wenzhang_detail_pengyouquan"),
              SizedBox(width: 10),
              _getMiddleIconBtn("复制链接", "wenzhang_detail_link"),
            ])
          ],
        ),
      ),
    );
  }

  static const imageUrl =
      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.zhimg.com%2F50%2Fv2-fce4f8a778fe3f24bca2cafc709b6847_hd.jpg&refer=http%3A%2F%2Fpic1.zhimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1625454014&t=e763deff04dcef7530b0745d632f86d6";

  Widget _getMiddleBook() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Color(0xfffaf6f6),
          ),
          padding: EdgeInsets.all(7),
          child: Row(
            children: [
              FilletImage(imageUrl, corner: 5, width: 40),
              SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("激荡一百年", style: TextStyle(fontSize: 16)),
                SizedBox(height: 5),
                Text("吴晓波", style: TextStyle(color: Colors.grey))
              ])
            ],
          ),
        ),
        Image(
          image: NativeImageProvider("shudan_card_bg"),
          width: 80,
          height: 64,
        )
      ],
    );
  }

  Widget _getMiddleIconBtn(String text, String iconName,
      {GestureTapCallback onTap}) {
    return Flexible(
        flex: 1,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 6, bottom: 6),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300], width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    image: NativeImageProvider(iconName),
                    width: 18,
                    height: 18),
                SizedBox(
                  width: 5,
                ),
                Text(
                  text,
                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                )
              ],
            ),
          ),
        ));
  }

  Widget _getListTitle() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            color: Colors.grey[100],
            height: 10,
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("评论",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17)),
                SizedBox(width: 7),
                Text("20条评论",
                    style: TextStyle(fontSize: 13, color: Colors.grey))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _getList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return _getListItem();
      }, childCount: 20),
    );
  }

  Widget _getListItem() {
    TextStyle bottomTextStyle = TextStyle(color: Colors.grey, fontSize: 12);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleImage(
            imageUrl,
            width: 40,
            height: 40,
            onTap: () {},
          ),
          SizedBox(
            width: 20,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    child: Text("f**k",
                        style: TextStyle(fontSize: 16, color: Colors.grey))),
                SizedBox(height: 10),
                GestureDetector(
                    child: Text(
                        "that thumbnail is fucking amazing!that thumbnail is fucking amazing!")),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("1小时前", style: bottomTextStyle),
                    Spacer(flex: 1),
                    TextButton.icon(
                        style: ButtonStyle(),
                        onPressed: () {},
                        icon: Image(
                            width: 15,
                            height: 15,
                            image: NativeImageProvider("like")),
                        label: Text("点赞", style: bottomTextStyle)),
                    TextButton.icon(
                        onPressed: () {},
                        icon: Image(
                          width: 15,
                          height: 15,
                          image: NativeImageProvider("square_icon_comment"),
                        ),
                        label: Text("评论", style: bottomTextStyle))
                  ],
                ),
                Divider(height: 0.5, color: Colors.grey[100])
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getBottomBar() {
    return BottomAppBar(
        elevation: 5.0,
        color: Colors.white,
        child: Container(
            padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
            height: 50,
            child: Row(children: [
              CircleImage(
                "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.zhimg.com%2F50%2Fv2-fce4f8a778fe3f24bca2cafc709b6847_hd.jpg&refer=http%3A%2F%2Fpic1.zhimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1625454014&t=e763deff04dcef7530b0745d632f86d6",
                width: 30,
                height: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                  width: 180,
                  padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(children: [
                    Image(
                      image: NativeImageProvider("tabbar_user_comment_icon"),
                      width: 15,
                      height: 15,
                    ),
                    Text("说点什么吧...",
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]))
                  ])),
              Flexible(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LabelImage("tabbar_like_icon", labelText: "喜欢"),
                      LabelImage(
                        "tabbar_comment_icon",
                        labelText: "33",
                        labelBgColor: Colors.red,
                        labelTextStyle:
                            TextStyle(fontSize: 8, color: Colors.white),
                      ),
                      LabelImage("tabbar_share_icon",
                          labelText: "评论",
                          labelBgColor: Colors.red,
                          labelTextStyle:
                              TextStyle(fontSize: 6, color: Colors.white))
                    ]),
                flex: 1,
              )
            ])));
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}
