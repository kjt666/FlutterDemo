import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PhysicalModelPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PhysicalModelState();
  }
}

class _PhysicalModelState extends State<PhysicalModelPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PhysicalModel"),
      ),
      body: Center(
        child: PhysicalModel(
          color: Colors.white10,
          elevation: 10,
          // borderRadius: BorderRadius.all(Radius.circular(10)),
          shape: BoxShape.circle,
          // shadowColor: Colors.yellowAccent,
          child: Container(
            width: 100,
            height: 100,
            transform: Matrix4.translationValues(15, 15, 0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.amber),
              color: Colors.redAccent,
              image: DecorationImage(
                  image: AssetImage("images/gyy.jpeg"), fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}
