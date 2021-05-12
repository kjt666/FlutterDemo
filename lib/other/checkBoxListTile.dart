import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CheckBoxListTilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CheckBoxListTileState();
  }
}

class _CheckBoxListTileState extends State<CheckBoxListTilePage> {
  List titleList = ["桂林", "三亚", "丽江", "杭州", "厦门", "北海", "青岛"];

  List checkedList = List.generate(7, (index) => false);

  List<Widget> widgets = <Widget>[];

  @override
  void initState() {
    super.initState();
    getWidgets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckBoxListTile"),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return widgets[index];
          },
          itemCount: widgets.length),
    );
  }

  List<Widget> getWidgets() {
    for (var i = 0; i < titleList.length; i++) {
      widgets.add(StatefulBuilder(builder: (context, setState) {
        return Card(child: CheckboxListTile(
            value: checkedList[i],
            title: Text(titleList[i]),
            controlAffinity: ListTileControlAffinity.platform,
            onChanged: (b) {
              setState(() {
                checkedList[i] = !checkedList[i];
              });
            }),);
      }));
    }
    return widgets;
  }
}
