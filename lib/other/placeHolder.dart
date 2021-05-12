import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlaceHolderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PlaceHolder")),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(10),
              child: Text("Tip:\n"
                  "1、PlaceHolder在一般情况下会扩展填充其父部件所有可用空间"
                  "2、当PlaceHolder放置在像ListView、Row、Column这样的无界父级窗口时，可以通过设置fallbackWidth和fallbackHeight来约束PlaceHolder的宽度和高度",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
          Container(
            height: 100,
            child: Placeholder(color: Colors.red,),
          ),
          Placeholder(fallbackHeight: 150,strokeWidth: 3,),
          Row(children: [
            Placeholder(fallbackWidth: 150,fallbackHeight: 100),
            Placeholder(fallbackWidth: 150,fallbackHeight: 100)
          ],)
        ],
      ),
    );
  }
}
