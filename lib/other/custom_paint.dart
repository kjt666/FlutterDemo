import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widget/loading.dart';

class CustomPaintPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CustomPatinState();
  }
}

class _CustomPatinState extends State<CustomPaintPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CustomPaint"),
        ),
        body: Loading(
          Colors.grey[500],
          center: false,
        ));
  }
}
