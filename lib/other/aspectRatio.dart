import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AspectRatioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AspectRatio")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("必须让AspectRatio组件确定其子级的大小，如果其外层嵌套了Expanded组件或者嵌套了Container组件并指定了宽高，"
              "则aspectRatio不会起作用，解决的办法是在AspectRatio组件和Expanded等组件之间加入一层Align组件或者Stack组件"),
          Container(
            width: 300,
            height: 300,
            color: Colors.green,
            child: Align(
              alignment: Alignment.topLeft,
              child:
                AspectRatio(
                  aspectRatio: 1 / 3,
                  child: Container(
                    color: Colors.deepOrange,
                  ),
                ),

            ),
          ),
        ],
      )
    );
  }
}


