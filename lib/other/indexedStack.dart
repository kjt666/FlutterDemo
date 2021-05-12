import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IndexedStackPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexedStackState();
  }
}

class _IndexedStackState extends State<IndexedStackPage> {
  int widgetIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("IndexedStack"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    widgetIndex = 0;
                  });
                }, child: Text("切换方块儿1")),
                ElevatedButton(onPressed: (){
                  setState(() {
                    widgetIndex = 1;
                  });
                }, child: Text("切换方块儿2")),
                ElevatedButton(onPressed: (){
                  setState(() {
                    widgetIndex = 2;
                  });
                }, child: Text("切换方块儿3")),
              ],
            ),
            IndexedStack(
              index: widgetIndex,
              children: [
                Container(
                  color: Colors.amber,
                  width: 200,
                  height: 200,
                ),
                Container(
                  color: Colors.deepOrangeAccent,
                  width: 200,
                  height: 200,
                ),
                Container(
                  color: Colors.red,
                  width: 200,
                  height: 200,
                )
              ],
            )
          ],
        ));
  }
}
