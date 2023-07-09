import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widget/rolling_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../custom_widget/aa.dart';

class DemoPage extends StatelessWidget {
  double _value = 1.7;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: [
            getLottieWidget(_value),
            GradientCircularProgressIndicator(
              radius: 45.w,
              colors: const [
                Color(0XffF3A765),
                Color(0XffFFBB55),
              ],
              stops: [0.7, 1],
              image: AssetImage("assets/shouye_yuanhuan.png"),
              strokeWidth: 10.w,
              backgroundColor: const Color(0x1AB2651A),
              strokeCapRound: true,
              fromValue: _value >= 2 ? 1 : 0,
              toValue: _value,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RollingText(
                  textSize: 24.w,
                  // leftNum: 0,
                  // midNum: 0,
                  // rightNum: 5,
                ),
                Text(
                  "分钟",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF646464),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ],
        ));
  }

  Widget getLottieWidget(double value) {
    late Widget lottieWidget;
    if (value < 1) {
      lottieWidget = SizedBox();
    } else if (value < 2) {
      lottieWidget = Lottie.asset("assets/ring_p2.json",
          width: 39.w * pi, height: 39.w * pi, repeat: false);
    } else {
      lottieWidget = Lottie.asset("assets/ring_p3.json",
          width: 37.w * pi, height: 37.w * pi, repeat: false);
    }
    return lottieWidget;
  }
}
