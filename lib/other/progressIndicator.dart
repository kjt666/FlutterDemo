import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

class ProgressIndicatorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProgressIndicatorState();
  }
}

class _ProgressIndicatorState extends State<ProgressIndicatorPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProgressIndicator"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 100,
              child: LinearProgressIndicator(),
            ),
            SizedBox(
              height: 30,
            ),
            AnimatedBuilder(
              animation: _controller,
              child: Container(
                width: 200.0,
                height: 200.0,
                color: Colors.green,
              ),
              builder: (BuildContext context, Widget? child) {
                return CircularProgressIndicator(
                  value: _controller.value,
                  strokeWidth: 1,
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            CupertinoActivityIndicator()
          ],
        ),
      ),
    );
  }
}
/*
*/
