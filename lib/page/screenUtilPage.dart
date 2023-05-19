import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(360, 690),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterScreenUtil"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                  width: 180.w,
                  height: 200.h,
                  color: Colors.red,
                  child: Text(
                    '我的实际宽度:${180.w}dp \n'
                    '我的实际高度:${200.h}dp',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                  width: ScreenUtil().setWidth(180),
                  height: ScreenUtil().setHeight(200),
                  color: Colors.blue,
                  child: Text(
                      '我的设计稿宽度: 180dp \n'
                      '我的设计稿高度: 200dp',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
              width: 100.w,
              height: 100.w,
              color: Colors.green,
              child: Text(
                '我是正方形,边长是100',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
            Text('设备宽度:${ScreenUtil().screenWidth}dp'),
            Text('设备高度:${ScreenUtil().screenHeight}dp'),
            Text('设备的像素密度:${ScreenUtil().pixelRatio}'),
            Text('底部安全区距离:${ScreenUtil().bottomBarHeight}dp'),
            Text('状态栏高度:${ScreenUtil().statusBarHeight}dp'),
            Text(
              '实际宽度与设计稿的比例:${ScreenUtil().scaleWidth}',
              textAlign: TextAlign.center,
            ),
            Text(
              '实际高度与设计稿的比例:${ScreenUtil().scaleHeight}',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50.h,
            ),
            Text('系统的字体缩放比例:${ScreenUtil().textScaleFactor}'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '我的文字大小在设计稿上是16dp，因为设置了`textScaleFactor`,所以不会随着系统的文字缩放比例变化',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  textScaleFactor: 1.0,
                ),
                Text(
                  '我的文字大小在设计稿上是16dp，会随着系统的文字缩放比例变化',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
