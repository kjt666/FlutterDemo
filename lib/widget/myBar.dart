import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppBarWeight extends StatefulWidget {
  AppBarWeight(Key barKey) : super(key: barKey);

  @override
  State<StatefulWidget> createState() {
    return new AppBarWeightState();
  }
}

class AppBarWeightState extends State<AppBarWeight> {
  int _opacity = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor.withAlpha(_opacity),
      height: 85,
    );
  }

  void onChange(int alpha) {
    setState(() {
      _opacity = alpha;
    });
  }
}
