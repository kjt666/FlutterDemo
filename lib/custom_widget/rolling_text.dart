/// 数字滚动效果
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RollingText extends StatefulWidget {
  int leftNum;
  int midNum;
  int rightNum;

  double textSize;
  Color textColor;

  RollingText({
    this.leftNum = 3,
    this.midNum = 5,
    this.rightNum = 7,
    this.textSize = 18,
    this.textColor = Colors.black,
  });

  @override
  _RollingTextState createState() => _RollingTextState();
}

class _RollingTextState extends State<RollingText> {
  List<int> leftData = [];
  List<int> midData = [];
  List<int> rightData = [];

  ScrollController leftView = ScrollController();
  ScrollController midView = ScrollController();
  ScrollController rightView = ScrollController();

  void _leftToEnd() {
    leftView.animateTo(leftView.position.maxScrollExtent,
        duration: Duration(milliseconds: 800), curve: Curves.easeOut);
  }

  void _midToEnd() {
    midView.animateTo(midView.position.maxScrollExtent,
        duration: Duration(milliseconds: 900), curve: Curves.easeOut);
  }

  void _rightToEnd() {
    rightView.animateTo(rightView.position.maxScrollExtent,
        duration: Duration(milliseconds: 1000), curve: Curves.easeOut);
  }

  @override
  void initState() {
    super.initState();
    leftData = [1, 2, 3, 4, 5, 6, 7, 8, 9, this.widget.leftNum];
    midData = [1, 2, 3, 4, 5, 6, 7, 8, 9, this.widget.midNum];
    rightData = [1, 2, 3, 4, 5, 6, 7, 8, 9, this.widget.rightNum];
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    Future.delayed(Duration(milliseconds: 300), () async {
      if (this.widget.leftNum != 0) {
        _leftToEnd();
      }
      if (this.widget.midNum != 0) {
        _midToEnd();
      }
      _rightToEnd();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          //left
          getNumWidget(widget.leftNum, leftView, leftData),
          //mid
          getNumWidget(widget.midNum, midView, midData),
          // right
          getNumWidget(widget.rightNum, rightView, rightData),
        ],
      ),
    );
  }

  Widget getNumWidget(int num, ScrollController controller, List<int> numList) {
    return num != 0
        ? Container(
            height: widget.textSize,
            child: SingleChildScrollView(
              controller: controller,
              child: Column(
                children: numList.map((num) {
                  return Text(
                    '$num',
                    style: TextStyle(
                        color: this.widget.textColor,
                        fontSize: widget.textSize,
                        fontWeight: FontWeight.bold),
                  );
                }).toList(),
              ),
            ),
          )
        : Container();
  }
}
