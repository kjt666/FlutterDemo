import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FilletButton extends StatelessWidget {

  final String text;
  final TextStyle textStyle;
  final Color bgColor;
  final double radius;
  final EdgeInsetsGeometry padding;
  final GestureTapCallback onTap;

  FilletButton(this.text,
      {this.textStyle, this.bgColor, this.radius, this.padding,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? EdgeInsets.fromLTRB(13, 4, 13, 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 15),
            color: bgColor ?? Color(0xff00bf7f)),
        child: Text(text,
            style: textStyle ??
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
