import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FlutterAnimate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterAnimate"),
      ),
      body: Center(
          child: Text("额爱你",
                  style: TextStyle(fontSize: 32, color: Colors.redAccent))
              .animate(
                  delay: 1000.ms, onPlay: (controller) => controller.repeat())
              .fade(duration: 500.ms)
              .scale(delay: 500.ms, begin: Offset(0, 0), end: Offset(2, 2))
              // .tint(color: Colors.purpleAccent)
              .shake(duration: 500.ms, delay: 1500.ms)),
    );
  }
}
