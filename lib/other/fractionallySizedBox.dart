import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/other/randomIntUtil.dart';

class FractionallySizeBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FractionallySizeBox"),
      ),
      body: Container(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          heightFactor: 0.5,
          child: Container(
            color: Colors.redAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    child: FractionallySizedBox(
                  heightFactor: 0.5,
                  widthFactor: 0.5,
                  child: Container(
                    color: Colors.yellow,
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getColumItem() {
    return Flexible(
        child: FractionallySizedBox(
      heightFactor: 0.1,
      child: Container(
        color: RandomUtil.getColor(),
      ),
    ));
  }
}
