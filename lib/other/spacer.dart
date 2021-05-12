import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SpacerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Spacer")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("spaceEvenly"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              getColorContainer(),
              getColorContainer(),
              getColorContainer()
            ],
          ),
          Text("spaceAround"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              getColorContainer(),
              getColorContainer(),
              getColorContainer()
            ],
          ),
          Text("spaceBetween"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getColorContainer(),
              getColorContainer(),
              getColorContainer()
            ],
          ),
          Text("customSpacer"),
          Row(
            children: [
              getColorContainer(),
              Spacer(flex: 1),
              getColorContainer(),
              Spacer(flex: 2,),
              getColorContainer()
            ],
          ),
          Text("customSpacer"),
          Row(
            children: [
              getColorContainer(),
              Spacer(flex: 2),
              getColorContainer(),
              Spacer(flex: 1,),
              getColorContainer()
            ],
          ),Text("customSpacer"),
          Row(
            children: [
              Spacer(flex: 2),
              getColorContainer(),
              Spacer(flex: 1),
              getColorContainer(),
              Spacer(flex: 1,),
              getColorContainer(),
              Spacer(flex: 2,),
            ],
          ),
        ],
      ),
    );
  }

  Widget getColorContainer() {
    return Container(
      width: 50,
      height: 50,
      color: Colors.blue,
    );
  }
}
