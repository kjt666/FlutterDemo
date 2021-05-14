import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SelectableTextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SelectableText"),
      ),
      body: Center(
        child: SelectableText(
          "你是否曾经想过要使应用程序中的一些文本可被选择呢? SelectableText正是适合您的小部件！进一步了解 SelectableText → https://goo.gle/31NfBb0",
          style:  TextStyle(color: Colors.blue),
          showCursor: true,
          cursorColor: Colors.redAccent,
          // cursorHeight: 5,
          cursorWidth: 1,
          cursorRadius: Radius.circular(5),
          // maxLines: 2,
          // scrollPhysics:ClampingScrollPhysics() ,
        ),
      ),
    );
  }
}
