import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/other/randomIntUtil.dart';

class AnimatedOpacityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedOpacityState();
  }
}

class _AnimatedOpacityState extends State<AnimatedOpacityPage> {
  double _opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedOpacity"),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: _opacity,
            child: GestureDetector(
              child: CircleAvatar(
                backgroundImage: AssetImage('images/head.jpg'),
              ),
              onTapDown: (d) {
                setState(() {
                  _opacity = (RandomUtil.getInt(20, 100).toDouble() / 100);
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
