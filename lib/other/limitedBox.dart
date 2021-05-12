import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LimitedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LimitedBox")),
      body: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Tip：\n"
                  "1、仅当LimitedBox的父级未绑定时，LimitedBox才会为其子级提供默认大小\n"
                  "2、当LimitedBox的父级约束大小时，LimitedBox无效，比如父级Container设置了宽高为300，LimitedBox设置了宽高为150，此时真正的宽高为300\n"
                  "3、将容器放在ListView中时，不会显示任何内容，因为容器在不受约束时，其大小将设置为0，此时将容器包装在LimitedBox中，会在每个容器上强加LimitedBox的最高高度，"
                  "LimitedBox为其子级在无限制环境中提供了有限的范围",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
          for (var i = 0; i < 20; i++)
            LimitedBox(
              maxHeight: 100,
              child: Container(
                color: randomColor(),
              ),
            )
        ],
      ),
    );
  }

  Color randomColor() {
    return Color.fromRGBO(randomInt(), randomInt(), randomInt(), 1);
  }

  int randomInt() {
    return Random.secure().nextInt(255);
  }
}
