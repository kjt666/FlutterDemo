import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/other/randomIntUtil.dart';

class AnimatedPaddingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedPaddingState();
  }
}

class _AnimatedPaddingState extends State<AnimatedPaddingPage> {
  double _padding = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedPadding"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _padding = RandomUtil.getInt(2, 5).toDouble();
              });
            },
          )
        ],
      ),
      body: ListView(
        children: [
          for (var i = 0; i < 20; i++)
            AnimatedPadding(
                padding: EdgeInsets.all(_padding),
                duration: Duration(milliseconds: 500),
                child: ListTile(
                  title: Text(i.toString()),
                  /*tileColor: i.isOdd
                      ? Colors.blue.withOpacity(0.15)
                      : Colors.blue.withOpacity(0.35),*/
                ))
        ],
      ),
    );
  }
}
