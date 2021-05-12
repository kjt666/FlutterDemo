import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ToggleButtonsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ToggleButtonsState();
  }
}

class _ToggleButtonsState extends State<ToggleButtonsPage> {
  var selectedList = List.generate(6, (index) => false);
  var textStyle = TextStyle(fontSize: 18);
  var textAlign = TextAlign.left;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToggleButtons"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "你想让你的用户从多个相关选项中选择吗? 将ToggleButtons添加到你的应用程序会有所帮助！",
              style: textStyle,
              textAlign: textAlign,
            ),
            SizedBox(height: 20),
            ToggleButtons(
              children: [
                Icon(Icons.format_align_left),
                Icon(Icons.format_align_center),
                Icon(Icons.format_align_right),
                Text("加粗",style: TextStyle(fontWeight: FontWeight.bold)),
                Text("斜体",style: TextStyle(fontStyle: FontStyle.italic)),
                Text("下划线",style: TextStyle(decoration: TextDecoration.underline))
              ],
              isSelected: selectedList,
              color: Colors.black45,
              selectedColor: Colors.black,
              selectedBorderColor: Colors.amber,
              fillColor: Colors.yellow,
              borderRadius: BorderRadius.circular(30),
              onPressed: (index) {
                setState(() {
                  selectedList[index] = !selectedList[index];
                  switch (index) {
                    case 0:
                      if (selectedList[0]) {
                        selectedList[1] = false;
                        selectedList[2] = false;
                        textAlign = TextAlign.start;
                      }
                      break;
                    case 1:
                      if (selectedList[1]) {
                        selectedList[0] = false;
                        selectedList[2] = false;
                        textAlign = TextAlign.center;
                      }
                      break;
                    case 2:
                      if (selectedList[2]) {
                        selectedList[0] = false;
                        selectedList[1] = false;
                        textAlign = TextAlign.right;
                      }
                      break;
                    case 3:
                      textStyle = selectedList[3]
                          ? textStyle
                              .merge(TextStyle(fontWeight: FontWeight.bold))
                          : textStyle
                              .merge(TextStyle(fontWeight: FontWeight.normal));
                      break;
                    case 4:
                      textStyle = selectedList[4]
                          ? textStyle
                              .merge(TextStyle(fontStyle: FontStyle.italic))
                          : textStyle
                              .merge(TextStyle(fontStyle: FontStyle.normal));
                      break;
                    case 5:
                      textStyle = selectedList[5]
                          ? textStyle.merge(
                              TextStyle(decoration: TextDecoration.underline))
                          : textStyle.merge(
                              TextStyle(decoration: TextDecoration.none));
                      break;
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
