
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/bean/comment_list_bean.dart';
import 'package:flutter_app/util/DioUtil.dart';
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
    goCommentDetailPage = (){
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
                    onTap: goCommentDetailPage, child: Text(widget.itemBean.content)),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(widget.itemBean.createTime, style: bottomTextStyle),
                    Spacer(flex: 1),
                    TextButton.icon(
                        style: ButtonStyle(),
                        onPressed: () {
                          _diggComment();
                        },
                        icon: Image(
                            width: 15,
                            height: 15,
                            image: NativeImageProvider(
                                widget.itemBean.isDigg == "1"
                                    ? "digg"
                                    : "undigg")),
                        label: Text(
                            widget.itemBean.diggCount == "0"
                                ? "点赞"
                                : widget.itemBean.diggCount,
                            style: bottomTextStyle)),
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
