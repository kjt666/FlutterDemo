import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FlexiblePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FlexiblePageState();
  }
}

class _FlexiblePageState extends State<FlexiblePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flexible")),
      body: Column(
        children: [
          Container(
            height: 100,
            color: Colors.lightBlue,
          ),
          Flexible(
              flex: 2,
              child: Container(
                color: Colors.red,
              )),
          Flexible(
              flex: 3,
              child: Container(
                color: Colors.amber[300],
              )),
          Flexible(
              flex: 1,
              child: Container(
                color: Colors.greenAccent,
              ))
        ],
      ),
    );
  }
}
