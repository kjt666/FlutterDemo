import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

class ShaderMaskPage extends StatelessWidget {
  var textStyle = TextStyle(fontSize: 18, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ShaderMask"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(colors: [Colors.yellow, Colors.redAccent])
                    .createShader(rect);
              },
              child: Text(
                "从左到右线性渐变",
                style: textStyle,
              ),
            ),
            ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.yellow, Colors.redAccent])
                    .createShader(rect);
              },
              child: Text(
                "从上到下线性渐变",
                style: textStyle,
              ),
            ),
            ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.yellow, Colors.redAccent])
                    .createShader(rect);
              },
              child: Text(
                "从左上角到右下角线性渐变",
                style: textStyle,
              ),
            ),
            SizedBox(height: 50),
            ShaderMask(
              shaderCallback: (rect) {
                return RadialGradient(
                        radius: 1,
                        center: Alignment.topLeft,
                        tileMode: TileMode.mirror,
                        colors: [Colors.yellow, Colors.deepOrange])
                    .createShader(rect);
              },
              child: Text(
                "已左上为中心径向渐变",
                style: textStyle,
              ),
            ),
            ShaderMask(
              shaderCallback: (rect) {
                return RadialGradient(
                        radius: 1,
                        center: Alignment.center,
                        tileMode: TileMode.mirror,
                        colors: [Colors.yellow, Colors.deepOrange])
                    .createShader(rect);
              },
              child: Text(
                "已中心为中心径向渐变",
                style: textStyle,
              ),
            ),
            ShaderMask(
              shaderCallback: (rect) {
                return RadialGradient(
                        radius: 1,
                        center: Alignment.bottomRight,
                        tileMode: TileMode.mirror,
                        colors: [Colors.yellow, Colors.deepOrange])
                    .createShader(rect);
              },
              child: Text(
                "已右下为中心径向渐变",
                style: textStyle,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ShaderMask(
              shaderCallback: (rect) {
                return SweepGradient(
                        center: Alignment.centerLeft,
                        colors: [Colors.yellow, Colors.deepOrange])
                    .createShader(rect);
              },
              child: Text(
                "已左中为中心扫描渐变",
                style: textStyle,
              ),
            ),
            ShaderMask(
              shaderCallback: (rect) {
                return SweepGradient(
                        center: Alignment.center,
                        colors: [Colors.yellow, Colors.deepOrange])
                    .createShader(rect);
              },
              child: Text(
                "已中心为中心扫描渐变",
                style: textStyle,
              ),
            ),
            ShaderMask(
              shaderCallback: (rect) {
                return SweepGradient(
                        center: Alignment.bottomLeft,
                        startAngle: math.pi/2,
                        endAngle: math.pi,
                        colors: [Colors.yellow, Colors.deepOrange])
                    .createShader(rect);
              },
              child: Text(
                "已右下为中心扫描渐变",
                style: textStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
