import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/notePage.dart';
import 'package:flutter_app/widget/circleImage.dart';
import 'package:flutter_app/widget/filletButton.dart';

class GradientAppBar extends StatefulWidget {
  GradientAppBar(Key barKey, this.url, this.name, this.moreTapCallback)
      : super(key: barKey);

  String url;
  String name;
  VoidCallback moreTapCallback;

  @override
  State<StatefulWidget> createState() {
    return new GradientAppBarState();
  }
}

class GradientAppBarState extends State<GradientAppBar> {
  int bgAlpha = 0;
  Color iconColor = Colors.white;
  double headerOpacity = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withAlpha(bgAlpha),
      height: 85,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: iconColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          SizedBox(width: 5),
          Flexible(
            child: Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: headerOpacity,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleImage(widget.url, width: 35, height: 35),
                        SizedBox(width: 10),
                        Text(
                          widget.name,
                          style: TextStyle(fontSize: 16),
                        ),
                        Spacer(flex: 1),
                        Offstage(offstage: true, child: FilletButton("关注"))
                      ]),
                )),
          ),
          IconButton(
              icon: Icon(Icons.more_horiz, color: iconColor),
              onPressed: widget.moreTapCallback),
        ],
      ),
    );
  }

  void changeBarWithIconColor(int alpha) {
    setState(() {
      iconColor = alpha == 0 ? Colors.white : Colors.black;
      bgAlpha = alpha;
    });
  }

  void changeBarColor(int alpha) {
    setState(() {
      bgAlpha = alpha;
    });
  }

  void changeIconColor(Color color){
    setState(() {
      iconColor = color;
    });
  }

  void showHeader(bool show) {
    if (show && headerOpacity != 1) {
      setState(() {
        headerOpacity = 1;
      });
    }
    if (!show && headerOpacity != 0) {
      setState(() {
        headerOpacity = 0;
      });
    }
  }
}
