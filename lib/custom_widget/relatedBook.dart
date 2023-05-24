import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'filletImage.dart';
import 'nativeImageProvider.dart';

class RelatedBook extends StatelessWidget {
  final String _bookCover;
  final String _title;
  final String _subTitle;
  final GestureTapCallback _onTap;

  RelatedBook(this._bookCover, this._title, this._subTitle, this._onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            height: 60.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              color: Color(0xfff5f5f5),
            ),
            padding: EdgeInsets.all(8.r),
            child: Row(
              children: [
                FilletImage(_bookCover, corner: 4.r, width: 34.5.w,height: 44.h,),
                SizedBox(width: 10.w),
                Flexible(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(
                        _title,
                        style: TextStyle(fontSize: 14.sp),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        _subTitle,
                        style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ]))
              ],
            ),
          ),
          /*Image(
            image: NativeImageProvider("shudan_card_bg"),
            width: 80,
            height: 64,
          )*/
        ],
      ),
    );
  }
}
