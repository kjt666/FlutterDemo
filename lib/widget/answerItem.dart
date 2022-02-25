import 'package:flutter/material.dart';
import 'package:flutter_app/widget/circleImage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'nativeImageProvider.dart';

class AnswerItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnswerItemState();
  }
}

class _AnswerItemState extends State {
  @override
  Widget build(BuildContext context) {
    TextStyle bottomTextStyle =
        TextStyle(color: Color(0xffb3b3b3), fontSize: 11.sp);
    return Container(
      padding: EdgeInsets.fromLTRB(15.w, 20.h, 15.w, 0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleImage(
                "http://avatar.youshu.cc/readwith/20210408/606eb24bf2335.jpg",
                width: 25.r,
                height: 25.r,
                onTap: () {},
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5.w, 0, 3.w, 0),
                child: Text(
                  "超级赛亚人",
                  style: TextStyle(color: Color(0xff5E7FA9), fontSize: 13.sp),
                ),
              ),
              Offstage(
                  offstage: false,
                  child: Padding(
                    padding: EdgeInsets.only(right: 5.w),
                    child: Image(
                      width: 10.w,
                      height: 11.h,
                      image: NativeImageProvider("ys_icon_feed_vipuser"),
                    ),
                  )),
              Container(
                padding: EdgeInsets.fromLTRB(4.w, 0, 4.w, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.w),
                    border: Border.all(color: Color(0xffFF713F), width: 0.5.w),
                    color: Color(0x1aE8997D)),
                child: Text(
                  "精选",
                  style: TextStyle(color: Color(0xffFF713F), fontSize: 10.sp),
                ),
              )
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            "一定要给孩子讲一讲家族的历史让他知道他的父辈们是多么的忠孝节义，英勇刚强，让他们知道自己的幸福生活背后是先辈这样的筚路…",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 15.sp, color: Color(0xff151515)),
          ),
          SizedBox(height: 15.h),
          Row(
            children: [
              Text(
                "23分钟前",
                style: TextStyle(color: Color(0xffb3b3b3), fontSize: 11.sp),
              ),
              Spacer(flex: 1),
              GestureDetector(
                  onTap: () {},
                  child: Row(children: [
                    Image(
                        width: 13.r,
                        height: 13.r,
                        image: NativeImageProvider("undigg")),
                    SizedBox(width: 5.w),
                    Text("点赞", style: bottomTextStyle)
                  ])),
              SizedBox(width: 40.w),
              GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Image(
                        width: 13.w,
                        height: 13.5.h,
                        image: NativeImageProvider("square_icon_comment"),
                      ),
                      SizedBox(width: 5.w),
                      Text("评论", style: bottomTextStyle)
                    ],
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Divider(height: 0.5.h, color: Color(0xffececec)),
          )
        ],
      ),
    );
  }
}
