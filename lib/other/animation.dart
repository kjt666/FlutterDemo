import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimationState();
  }
}

class _AnimationState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  Animation _curve;
  Animation _curveAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    _animation = Tween(begin: 0.0, end: 200.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _curve = CurvedAnimation(parent: _controller, curve: Curves.bounceIn);
    _curveAnimation = Tween(begin: 0.0, end: 200.0).animate(_curve);

    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("线性动画"),
          Flexible(
              flex: 1,
              child: Center(
                  child: Container(
                margin: new EdgeInsets.symmetric(vertical: 10.0),
                width: _animation.value,
                height: _animation.value,
                child: FlutterLogo(),
              ))),
          Text("曲线动画"),
          Flexible(
              flex: 1,
              child: Center(
                  child: Container(
                margin: new EdgeInsets.symmetric(vertical: 10.0),
                width: _curveAnimation.value,
                height: _curveAnimation.value,
                child: FlutterLogo(),
              ))),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
