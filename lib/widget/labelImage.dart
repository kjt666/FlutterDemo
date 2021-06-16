import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/widget/nativeImageProvider.dart';

class LabelImage extends StatefulWidget {
  final String url;
  final double width;
  final double height;
  final Color labelBgColor;
  final String labelText;
  final TextStyle labelTextStyle;
  final GestureTapCallback onTap;

  LabelImage(this.url,
      {this.width,
      this.height,
      this.labelBgColor,
      this.labelText,
      this.labelTextStyle,
      this.onTap});

  @override
  State<StatefulWidget> createState() {
    return _LabelImageState();
  }
}

class _LabelImageState extends State<LabelImage> {
  Color randomColor() {
    return Color.fromRGBO(randomInt(), randomInt(), randomInt(), 1);
  }

  int randomInt() {
    return Random.secure().nextInt(255);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          // clipBehavior: Clip.none,
          overflow: Overflow.visible,
          children: [
            Image(
              image: NativeImageProvider(widget.url),
              width: widget.width ?? 30,
              height: widget.height ?? 30,
            ),
            /*NativeImage(
            widget.url,
            width: widget.width ?? 20,
            height: widget.height ?? 20,
          ),*/
            Positioned(
                top: 2,
                right: -7,
                child: Container(
                  padding: EdgeInsets.fromLTRB(7, 1, 7, 1),
                  decoration: BoxDecoration(
                      color: widget.labelBgColor,
                      border: widget.labelBgColor==null?null:Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(7)),
                  child: Text(
                    widget.labelText ?? "",
                    style: widget.labelTextStyle ??
                        TextStyle(fontSize: 8, color: Colors.black),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
