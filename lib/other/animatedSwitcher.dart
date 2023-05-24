import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/other/randomIntUtil.dart';

class AnimatedSwitcherPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedSwitcher();
  }
}

class _AnimatedSwitcher extends State<AnimatedSwitcherPage>
    with TickerProviderStateMixin {

  Widget _switcherShapeWidget = Container(
    color: Colors.redAccent,
    key: ValueKey(1),
    width: 200,
    height: 100,
  );

  Widget? _widgetOne, _widgetTwo;
  Color _color = Colors.redAccent;

  @override
  void initState() {
    super.initState();
    /*_widgetOne = Container(
      color: Colors.redAccent,
      key: ValueKey(1),
      width: 200,
      height: 100,
    );
    _widgetTwo = Container(
      color: Colors.blue,
      key: ValueKey(2),
      width: 100,
      height: 200,
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AnimatedSwitcher"),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: 200,
              height: 200,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(child: child, scale: animation);
                },
                child: _switcherShapeWidget,
              ),
            ),
            RaisedButton(
                onPressed: () {
                  setState(() {
                    _switcherShapeWidget = getChangeWidget();
                  });
                },
                child: Text("转换形状")),
            Container(
              width: 200,
              height: 200,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                switchInCurve: Curves.elasticInOut,
                reverseDuration: Duration(milliseconds: 0),
                switchOutCurve: Curves.bounceInOut,
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return RotationTransition(
                    child: child,
                    turns: animation,
                    alignment: Alignment.center,
                  );
                },
                child: Container(
                  width: 200,
                  height: 150,
                  key: ValueKey(_color),
                  color: _color,
                ),
              ),
            ),
            RaisedButton(
                onPressed: () {
                  setState(() {
                    _color = RandomUtil.getColor();
                  });
                },
                child: Text("转换颜色")),
          ]),
        ));
  }

  Random _random = Random.secure();

  Widget getChangeWidget() {
    return Container(
      width: RandomUtil.getInt(100, 200).toDouble(),
      height: RandomUtil.getInt(100, 200).toDouble(),
      key: ValueKey(_random.nextInt(200)),
      color: RandomUtil.getColor(),
    );
  }

  int getRangeRandomInt(int min, int max) {
    return min + _random.nextInt(max - min);
  }
}
