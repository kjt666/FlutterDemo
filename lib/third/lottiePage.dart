import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LottiePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lottie"),
      ),
      body: Center(
        child: Lottie.asset("assets/loading.json",width: 38.w,height: 40.h),
      ),
    );
  }
}
