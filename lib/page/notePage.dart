import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/bean/note_info_bean.dart';
import 'package:flutter_app/eum_noscroll_behavior.dart';
import 'package:flutter_app/util/DioUtil.dart';
import 'package:flutter_app/util/TimeUtil.dart';
import 'package:flutter_app/widget/circleImage.dart';
import 'package:flutter_app/widget/commentItem.dart';
import 'package:flutter_app/widget/dynamicPageView.dart';
import 'package:flutter_app/widget/emptyView.dart';
import 'package:flutter_app/widget/filletButton.dart';
import 'package:flutter_app/widget/filletImage.dart';
import 'package:flutter_app/widget/gradientAppBar.dart';
import 'package:flutter_app/widget/labelImage.dart';
import 'package:flutter_app/widget/nativeImageProvider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../bean/comment_list.dart';

class NotePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotePageState();
  }
}

class _NotePageState extends State<NotePage> {
  Logger logger = Logger();

  List<String> urls = [];

  ScrollController scrollController;
  GlobalKey middleHeaderkey = GlobalKey();
  double titleBarOpacity = 0;

  GlobalKey<GradientAppBarState> barKey = GlobalKey();
  GlobalKey<DynamicPageState> bannerKey = GlobalKey();
  RenderBox middleHeaderRender;

  //显示标题栏头像需要的位移量
  double barHeaderShowOffset = 0;
  bool noHeaderImg = true;

  GlobalKey commentTitleKey = GlobalKey();
  GlobalKey<EmptyViewState> emptyViewKey = GlobalKey();

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (noHeaderImg) {
        int alpha = ((scrollController.offset / 50) * 255).toInt();
        barKey.currentState.changeBarColor(alpha < 255 ? alpha : 255);
      } else {
        int alpha = ((scrollController.offset / 200) * 255).toInt();
        barKey.currentState.changeBarWithIconColor(alpha < 255 ? alpha : 255);
      }
      // print("----------$scrollController.offset---------");
      // print("${render.localToGlobal(Offset.zero)}");
      barKey.currentState.showHeader(
          middleHeaderRender.localToGlobal(Offset.zero).dy <=
              barHeaderShowOffset);
    });
    _getNoteData();
    _getCommentListData();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      middleHeaderRender = middleHeaderkey.currentContext.findRenderObject();
      RenderBox render2 = barKey.currentContext.findRenderObject();
      barHeaderShowOffset =
          render2.size.height - middleHeaderRender.size.height;
    });
    return Scaffold(
      body: Stack(
        children: [
          ScrollConfiguration(
              behavior: EUMNoScrollBehavior(),
              child: SmartRefresher(
                enablePullDown: false,
                enablePullUp: true,
                onLoading: _onLoading,
                controller: _refreshController,
                footer: CustomFooter(
                  loadStyle: LoadStyle.ShowWhenLoading,
                  builder: (BuildContext context, LoadStatus mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = Text("上拉加载");
                    } else if (mode == LoadStatus.loading) {
                      body = CupertinoActivityIndicator();
                    } else if (mode == LoadStatus.failed) {
                      body = Text("加载失败！点击重试！");
                    } else if (mode == LoadStatus.canLoading) {
                      body = Text("松手,加载更多!");
                    } else {
                      // body = Text("没有更多数据了!");
                      // body = Image(image: NativeImageProvider("youshu_slogn"));
                      body = Image.asset("images/youshu_slogn.png");
                    }
                    return Container(
                      height: 60,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Center(child: body),
                    );
                  },
                ),
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    /*SliverAppBar(
                      floating: true,
                      pinned: true,
                      snap: false,
                      toolbarHeight: 0,
                      collapsedHeight:220,
                      expandedHeight: 220.0,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Image.asset("images/1.jpeg",fit: BoxFit.cover,),
                      ),
                    ),*/
                    _getHeader(),
                    _getMiddleContent(),
                    _getListTitle(),
                    _getList(),
                  ],
                ),
              )),
          Offstage(
              offstage: noteInfo.id != null,
              child: EmptyView(emptyViewKey, "quesheng_wuwifi_07", "加载失败,请稍后重试",
                  () {
                _getNoteData();
              })),
          GradientAppBar(barKey, imageUrl, noteInfo.userData?.name ?? "", () {
            _openMoreBottomSheet();
          })
        ],
      ),
      bottomNavigationBar: _getBottomBar(),
    );
  }

  Widget _getHeader() {
    return SliverToBoxAdapter(
      child: noHeaderImg
          ? Container(
              height: 40,
              color: Colors.white,
            )
          : DynamicPageView(
              bannerKey,
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
                child: Text(noteInfo.title ?? "",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))),
            _getMiddleHeader(),
            SizedBox(height: 10),
            /*Text(noteInfo.content ?? "",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black,
                )),*/
            Html(
              data:
                  "<div style=\"line-height: 20px\">${noteInfo.content ?? ""}<\/div>" ??
                      "",
              onImageTap: (url, context, attributes, element) {
                // NavigatorUtil.pushImageBrowserPage(0, [url]);
                Fluttertoast.showToast(msg: url);
              },
            ),
            SizedBox(height: 20),
            _getMiddleBook(),
            SizedBox(height: 20),
            _getMiddleTopic(),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              _getMiddleIconBtn(
                  noteInfo.diggCount ?? "0",
                  "1" == noteInfo.isDigg
                      ? "wenzhang_detail_like_heart"
                      : "wenzhang_detail_like",
                  onTap: () => _like()),
              SizedBox(width: 10),
              _getMiddleIconBtn("微信", "wenzhang_detail_wechat", onTap: () {}),
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

  static var imageUrl =
      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.zhimg.com%2F50%2Fv2-fce4f8a778fe3f24bca2cafc709b6847_hd.jpg&refer=http%3A%2F%2Fpic1.zhimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1625454014&t=e763deff04dcef7530b0745d632f86d6";

  Widget _getMiddleHeader() {
    return Row(
      children: [
        CircleImage(imageUrl, width: 35, height: 35, onTap: () {
          Fluttertoast.showToast(msg: noteInfo.userData?.name);
        }),
        SizedBox(width: 10),
        GestureDetector(
            onTap: () {
              Fluttertoast.showToast(msg: noteInfo.userData?.name);
            },
            child: Column(
              key: middleHeaderkey,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text(noteInfo.userData?.name ?? "",
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  Offstage(
                      child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Image(
                              image: NativeImageProvider("lingduren"),
                              width: 50,
                              height: 25)),
                      offstage: true),
                  Offstage(
                      offstage: noteInfo.userData?.isVip != "1",
                      child: Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Image(
                              image: NativeImageProvider("new_vip_tag_icon"),
                              width: 15,
                              height: 15))),
                ]),
                SizedBox(height: 5),
                Text(TimeUtil.formatCommentTime(noteInfo.updateTime),
                    style: TextStyle(fontSize: 12, color: Colors.grey))
              ],
            )),
        Spacer(
          flex: 1,
        ),
        Offstage(offstage: "1" == noteInfo.isFollow, child: FilletButton("关注"))
      ],
    );
  }

  Widget _getMiddleBook() {
    return Offstage(
        offstage: noteInfo.relationData?.relationTitle == null,
        child: GestureDetector(
            onTap: () {
              Fluttertoast.showToast(msg: noteInfo.relationData?.scheme);
            },
            child: Stack(
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
                      FilletImage(noteInfo.relationData?.relationCover ?? "",
                          corner: 5, width: 40),
                      SizedBox(width: 10),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              noteInfo.relationData?.relationTitle ?? "",
                              style: TextStyle(fontSize: 15),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 2.5),
                            Text(
                              noteInfo.relationData?.author ?? "",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )
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
            )));
  }

  Widget _getMiddleTopic() {
    return Offstage(
        offstage: noteInfo.topicTitle == null,
        child: Row(children: [
          Image(
              image: NativeImageProvider("edit_huati_icon"),
              width: 18,
              height: 18),
          SizedBox(width: 5),
          Text("来自话题：", style: TextStyle(color: Colors.grey)),
          GestureDetector(
              onTap: () {
                Fluttertoast.showToast(msg: noteInfo.topicTitle);
              },
              child: Text(noteInfo.topicTitle ?? "",
                  style: TextStyle(color: Colors.blue))),
        ]));
  }

  Widget _getMiddleIconBtn(String text, String iconName,
      {GestureTapCallback onTap}) {
    return Flexible(
        flex: 1,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 7.5, bottom: 7.5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300], width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                    image: NativeImageProvider(iconName),
                    width: 15,
                    height: 15),
                SizedBox(
                  width: 4,
                ),
                Text(
                  text,
                  style: TextStyle(fontSize: 11, color: Colors.grey[700]),
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
            key: commentTitleKey,
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
                Text("${noteInfo.commentCount ?? 0}条评论",
                    style: TextStyle(fontSize: 12, color: Colors.grey))
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
        return CommentItem(commentList.list[index]);
      }, childCount: commentList.list == null ? 0 : commentList.list.length),
    );
  }

  Widget _getBottomBar() {
    return Offstage(
        offstage: noteInfo.id == null,
        child: BottomAppBar(
            elevation: 5.0,
            color: Colors.white,
            child: Container(
                padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
                height: 50,
                child: Row(children: [
                  CircleImage(
                    imageUrl,
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
                          image:
                              NativeImageProvider("tabbar_user_comment_icon"),
                          width: 15,
                          height: 15,
                        ),
                        Text("说点什么吧...",
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey[600]))
                      ])),
                  Flexible(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          LabelImage(
                              "1" == noteInfo.isDigg
                                  ? "tabbar_like_click_icon"
                                  : "tabbar_like_icon",
                              labelText: noteInfo.diggCount ?? "0", onTap: () {
                            _like();
                          }),
                          LabelImage(
                            "tabbar_comment_icon",
                            labelText: noteInfo.commentCount ?? "0",
                            labelBgColor: Colors.redAccent,
                            labelTextStyle:
                                TextStyle(fontSize: 8, color: Colors.white),
                            onTap: () {
                              RenderBox render = commentTitleKey.currentContext
                                  .findRenderObject();
                              scrollController.animateTo(
                                  render.localToGlobal(Offset.zero).dy,
                                  duration: Duration(milliseconds: 250));
                            },
                          ),
                          LabelImage("tabbar_share_icon",
                              onTap: () => _openShareBottomSheet())
                        ]),
                    flex: 1,
                  )
                ]))));
  }

  Future _openShareBottomSheet() async {
    await showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5))),
        builder: (BuildContext context) {
          return Container(
            height: 290,
            child: Column(
              children: [
                GridView.count(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  crossAxisCount: 5,
                  mainAxisSpacing: 30,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    getMorePopItem(
                        "微信好友", "weixin2", () => Navigator.pop(context)),
                    getMorePopItem(
                        "微信朋友圈", "pengyouquan2", () => Navigator.pop(context)),
                    getMorePopItem(
                        "QQ空间", "kongjian", () => Navigator.pop(context)),
                    getMorePopItem(
                        "新浪微博", "weiibo2", () => Navigator.pop(context)),
                    getMorePopItem(
                        "复制链接", "lianjie", () => Navigator.pop(context)),
                    getMorePopItem("转发", "guangchang", () {
                      Navigator.pop(context);
                    }),
                  ],
                ),
                Container(height: 10, color: Colors.grey[100]),
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      child: Text("取消",
                          style: TextStyle(color: Colors.grey, fontSize: 15)),
                      height: 40,
                      alignment: Alignment.center,
                    )),
              ],
            ),
          );
        });
  }

  Future _openMoreBottomSheet() async {
    await showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5))),
        builder: (BuildContext context) {
          return Container(
            height: 190,
            padding: EdgeInsets.only(top: 30),
            child: Column(
              children: <Widget>[
                Row(children: [
                  SizedBox(width: 20),
                  getMorePopItem("举报", "more_report_icon", () {
                    Navigator.pop(context);
                    _openReportBottomSheet();
                  }),
                  SizedBox(width: 30),
                  getMorePopItem(
                      "1" == noteInfo.isFav ? "已收藏" : "收藏",
                      "1" == noteInfo.isFav
                          ? "more_collect_click_icon"
                          : "more_collect_icon",
                      () => _favoritefs()),
                ]),
                Container(
                    height: 10,
                    margin: EdgeInsets.only(top: 20),
                    color: Colors.grey[100]),
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      child: Text("取消",
                          style: TextStyle(color: Colors.grey, fontSize: 15)),
                      height: 50,
                      alignment: Alignment.center,
                    )),
              ],
            ),
          );
        });
  }

  Widget getMorePopItem(String text, String imgName, GestureTapCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image(width: 55, height: 55, image: NativeImageProvider(imgName)),
          SizedBox(height: 5),
          Text(text, style: TextStyle(color: Colors.grey[700], fontSize: 12))
        ],
      ),
    );
  }

  List<String> reportContent = ["人身攻击", "广告或垃圾信息", "色情、淫秽低俗内容", "激进违法言论"];

  Future _openReportBottomSheet() async {
    await showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5))),
        builder: (BuildContext context) {
          return Container(
            height: 310.0,
            child: Column(
              children: <Widget>[
                for (var i = 0; i < reportContent.length; i++)
                  _getReportPopItem(reportContent[i], () {
                    _report(reportContent[i]);
                  }),
                Container(
                    height: 10,
                    margin: EdgeInsets.only(top: 20),
                    color: Colors.grey[100]),
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      child: Text("取消",
                          style: TextStyle(color: Colors.grey, fontSize: 15)),
                      height: 50,
                      alignment: Alignment.center,
                    )),
              ],
            ),
          );
        });
  }

  Widget _getReportPopItem(String text, GestureTapCallback onTap) {
    return ListTile(
      title: Text(text, textAlign: TextAlign.center),
      onTap: onTap,
    );
  }

  NoteInfo noteInfo = NoteInfo();

  //获取文章信息
  void _getNoteData() async {
    var response = await DioUtil.dio.post("m/bp/info", data: {
      'user_id': '90006269',
      'id': '3335233884500656157', //3328779617678000128
      'type': 'note',
      'source': '0'
    });
    logger.d(response.data);
    Map<String, dynamic> data = json.decode(response.data);
    if (data['code'] != "1") {
      print("接口凑无！！！");
      barKey.currentState.hideMoreIcon(true);
      barKey.currentState.changeIconColor(Colors.black);
      emptyViewKey.currentState.showEmptyView(true);
    } else {
      setState(() {
        noteInfo = NoteInfo.fromJson(data['data']);
        noteInfo.content = noteInfo.content.replaceAll("\n", "</br>");
        print(noteInfo.content);
        print(
            "-----------isDigg = ${noteInfo.isDigg},isFav = ${noteInfo.isFav}");
        noHeaderImg = noteInfo.imgStr.isEmpty;
        barKey.currentState.hideMoreIcon(false);
        barKey.currentState.changeIconColor(Colors.black);
        imageUrl = noteInfo.userData.avatar;
        urls = noteInfo.imgStr;
        emptyViewKey.currentState.showLoading(false);
      });
    }
  }

  CommentList commentList = new CommentList();

  //获取评论列表
  void _getCommentListData() async {
    var response = await DioUtil.dio.post("m/common_comment/list", data: {
      'page': '1',
      'limit': '10',
      'type': '1',
      'business_type': '104',
      'business_id': '0',
      'collection_id': '1',
      'chapter_id': '3314629710482374686',
    });
    logger.d(response.data);
    Map<String, dynamic> data = json.decode(response.data);
    setState(() {
      commentList = CommentList.fromJson(data['data']);
    });
  }

  //举报文章
  void _report(String reportContent) async {
    Navigator.pop(context);
    var response = await DioUtil.dio.post("m/comment/tip_off", data: {
      'id': '3335233884500656157',
      'type': '3',
      'content': reportContent,
    });
    logger.d(response.data);
    Fluttertoast.showToast(msg: "举报成功\n我们将尽快核实处理");
    /*if (response != null && "1" == response.data['code']) {
      Fluttertoast.showToast(msg: "举报成功\n我们将尽快核实处理");
    }*/
  }

  //收藏文章
  void _favoritefs() async {
    Navigator.pop(context);
    var response = await DioUtil.dio.post("m/note/fav", data: {
      'id': '3335233884500656157',
    });
    logger.d(response.data);
    if (noteInfo.isFav == "1") {
      noteInfo.isFav = "0";
      Fluttertoast.showToast(msg: "已取消收藏");
    } else {
      noteInfo.isFav = "1";
      Fluttertoast.showToast(msg: "已添加收藏");
    }
  }

  void _like() async {
    //点赞a,取消赞c
    var response = await DioUtil.dio.post("m/digg/add", data: {
      'id': noteInfo.id,
      'type': 'note',
      'act': "1" == noteInfo.isDigg ? 'c' : 'a'
    });
    int diggCount = int.tryParse(noteInfo.diggCount);
    setState(() {
      if ("1" == noteInfo.isDigg) {
        noteInfo.isDigg = "0";
        noteInfo.diggCount = (--diggCount).toString();
      } else {
        noteInfo.isDigg = "1";
        noteInfo.diggCount = (++diggCount).toString();
      }
    });
  }

  int count = 0;

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 2000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    if (mounted) setState(() {});
    count++ < 3
        ? _refreshController.loadComplete()
        : _refreshController.loadNoData();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}
