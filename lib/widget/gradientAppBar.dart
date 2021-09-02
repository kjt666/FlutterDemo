import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  bool hideMore = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withAlpha(bgAlpha),
      height: 80,
      width: double.infinity,
      // padding: EdgeInsets.only(bottom: 3),
      child: Stack(
        alignment: Alignment.bottomLeft,
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
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            left: 45,
            right: 45,
            top: headerOpacity == 1 ? 38 : 53,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedOpacity(
                    child: CircleImage(widget.url, width: 35, height: 35),
                    opacity: headerOpacity,
                    duration: Duration(milliseconds: 200)),
                SizedBox(width: 10),
                AnimatedOpacity(
                    child: Text(
                      widget.name,
                      style: TextStyle(fontSize: 16),
                    ),
                    opacity: headerOpacity,
                    duration: Duration(milliseconds: 200)),
                Spacer(flex: 1),
                AnimatedOpacity(
                    child: Offstage(offstage: false, child: FilletButton("关注")),
                    opacity: headerOpacity,
                    duration: Duration(milliseconds: 200))
              ],
            ),
          ),
          Positioned(
              right: 0,
              child: Offstage(
                  offstage: hideMore,
                  child: IconButton(
                      icon: Icon(Icons.more_horiz, color: iconColor),
                      onPressed: widget.moreTapCallback))),
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

  void changeIconColor(Color color) {
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

  void hideMoreIcon(bool b) {
    setState(() {
      hideMore = b;
    });
  }
}
