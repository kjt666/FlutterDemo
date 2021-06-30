import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedWidgetState();
  }
}

class _AnimatedWidgetState extends State<AnimatedWidgetPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: Duration(seconds: 2),
        lowerBound: 3,
        upperBound: 10,
        vsync: this)
      ..repeat(reverse: true);
    // _animation = Tween(begin: 0.0, end: 200.0).animate(_animationController);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedWidget"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                child: Text(
                    '''1、使用AnimatedWidget助手类（而不是addListener()和setState()）来给widget添加动画
        2、使用AnimatedWidget创建一个可重用动画的widget。''')),
            Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                child: Text(
                    "和animation中不同的是，AnimatedWidget(基类)中会自动调用addListener()和setState()。")),
            ButtonTransition(_animationController)
          ],
        ),
      ),
    );
  }
}

class ButtonTransition extends AnimatedWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Container(
        alignment: Alignment.center,
        child: Text(
          "WTF!",
          style: TextStyle(fontSize: 32, fontStyle: FontStyle.italic),
        ),
        width: 200,
        height: 60,
      ),
      style: TextButton.styleFrom(
          side: BorderSide(width: animation.value, color: Colors.blue)),
    );
  }

  ButtonTransition(animation) : super(listenable: animation);

  Animation<double> get animation => listenable;
}
