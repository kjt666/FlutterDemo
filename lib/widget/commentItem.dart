import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/bean/comment_list.dart';
import 'package:flutter_app/util/DioUtil.dart';
import 'package:flutter_app/util/TimeUtil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'circleImage.dart';
import 'nativeImageProvider.dart';

class CommentItem extends StatefulWidget {
  Comment itemBean;

  CommentItem(this.itemBean);

  @override
  State<StatefulWidget> createState() {
    return CommentItemState();
  }
}

class CommentItemState extends State<CommentItem> {
  GestureTapCallback goUserHomePage;
  GestureTapCallback goCommentDetailPage;

  @override
  void initState() {
    super.initState();
    goUserHomePage = () {
      Fluttertoast.showToast(msg: widget.itemBean.userData?.name);
    };
    goCommentDetailPage = () {
      Fluttertoast.showToast(msg: widget.itemBean.content);
    };
  }

  @override
  Widget build(BuildContext context) {
    TextStyle bottomTextStyle = TextStyle(color: Colors.grey, fontSize: 12);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleImage(
            widget.itemBean.userData?.avatar,
            width: 40,
            height: 40,
            onTap: goUserHomePage,
          ),
          SizedBox(
            width: 20,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: goUserHomePage,
                    child: Text(widget.itemBean.userData?.name,
                        style: TextStyle(fontSize: 16, color: Colors.grey))),
                SizedBox(height: 10),
                GestureDetector(
                    onTap: goCommentDetailPage,
                    child: Text(widget.itemBean.content)),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(TimeUtil.formatCommentTime(widget.itemBean.createTime),
                        style: bottomTextStyle),
                    Spacer(flex: 1),
                    GestureDetector(
                        onTap: () {
                          _diggComment();
                        },
                        child: Row(children: [
                          Image(
                              width: 15,
                              height: 15,
                              image: NativeImageProvider(
                                  widget.itemBean.isDigg == "1"
                                      ? "digg"
                                      : "undigg")),
                          SizedBox(width: 5),
                          Text(
                              widget.itemBean.diggCount == "0"
                                  ? "点赞"
                                  : widget.itemBean.diggCount,
                              style: bottomTextStyle)
                        ])),
                    SizedBox(width: 10),
                    GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Image(
                              width: 15,
                              height: 15,
                              image: NativeImageProvider("square_icon_comment"),
                            ),
                            SizedBox(width: 5),
                            Text("评论", style: bottomTextStyle)
                          ],
                        ))
                  ],
                ),
                getSubCommentListView(),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Divider(height: 0.5, color: Colors.grey[100]),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getSubCommentListView() {
    var list = widget.itemBean.commentList;
    var commentCount = int.tryParse(widget.itemBean.commentCount);
    if (commentCount == null) commentCount = 0;
    return (list == null || list.isEmpty)
        ? SizedBox()
        : MediaQuery.removePadding(
            removeTop: true,
            removeBottom: true,
            context: context,
            child: Container(
                decoration: BoxDecoration(
                    color: Color(0xfff6f7fa),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                padding: EdgeInsets.fromLTRB(15, 15, 5, 5),
                margin: EdgeInsets.only(top: 10),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: new NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      if (i == 3) {
                        return Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: GestureDetector(
                              onTap: goCommentDetailPage,
                              child: Text(
                                "查看全部${widget.itemBean.commentCount}条回复",
                                style: TextStyle(
                                    color: Color(0xff00bf7f), fontSize: 13),
                              ),
                            ));
                      } else {
                        bool samePerson = list[i].userData.userId ==
                            list[i].replyUserData.userId;
                        return Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: /*Text("${list[i].userData.name} 回复 ${list[i].replyUserData.name}：${list[i].content}")*/ RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 13),
                                    children: [
                                  TextSpan(
                                      text: "${list[i].userData.name}",
                                      style: TextStyle(
                                          color: Color(0xff00bf7f),
                                          fontSize: 13),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Fluttertoast.showToast(
                                              msg: "${list[i].userData.name}");
                                        }),
                                  samePerson
                                      ? TextSpan()
                                      : TextSpan(text: " 回复 "),
                                  samePerson
                                      ? TextSpan()
                                      : TextSpan(
                                          text: "${list[i].replyUserData.name}",
                                          style: TextStyle(
                                              color: Color(0xff00bf7f),
                                              fontSize: 13),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "${list[i].replyUserData.name}");
                                            }),
                                  TextSpan(
                                      text: "：${list[i].content}",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          _openReportBottomSheet();
                                        }),
                                ])));
                      }
                    },
                    itemCount: list == null
                        ? 0
                        : commentCount > 3
                            ? 4
                            : list.length)));
  }

  Future _openReportBottomSheet() async {
    await showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5))),
        builder: (BuildContext context) {
          return Container(
            height: 200.0,
            child: Column(
              children: [
                ListTile(
                  title: Text("回复", textAlign: TextAlign.center),
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  title: Text("举报", textAlign: TextAlign.center),
                  onTap: () => Navigator.pop(context),
                ),
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

  //评论点赞
  void _diggComment() async {
    var response = await DioUtil.dio.post("m/common_comment/digg",
        data: {'id': widget.itemBean.id, 'business_type': '104'});
    print(response.data);
    /*if (response.data['code'] == "1") {
      Map<String, dynamic> data = json.decode(response.data);
      var diggCount = int.tryParse(widget.itemBean.diggCount);
      setState(() {
        widget.itemBean.isDigg = data['digg_status'];
        widget.itemBean.diggCount = "1" == data['digg_status']
            ? (diggCount++).toString()
            : (diggCount--).toString();
      });
    }*/
    //
    var diggCount = int.tryParse(widget.itemBean.diggCount);
    setState(() {
      if ("1" == widget.itemBean.isDigg) {
        widget.itemBean.isDigg = "0";
        widget.itemBean.diggCount = (--diggCount).toString();
      } else {
        widget.itemBean.isDigg = "1";
        widget.itemBean.diggCount = (++diggCount).toString();
      }
    });
  }
}
