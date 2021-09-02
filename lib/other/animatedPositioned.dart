import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedPositionedPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedPositionedState();
  }
}

class _AnimatedPositionedState extends State<AnimatedPositionedPage> {
  bool _showMessage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedPositioned"),
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Container(
            width: 300,
            height: 500,
            color: Colors.lightBlueAccent,
            alignment: Alignment.center,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    "message",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                AnimatedPositioned(
                    left: 75,
                    //同时使用了所有方向属性时，内部的小部件可以具备放大缩小的能力
                    top: _showMessage ? 100 : 200,
                    // bottom: _showMessage?270:200,
                    duration: Duration(milliseconds: 500),
                    child: GestureDetector(
                      onTapDown: (d) {
                        setState(() {
                          _showMessage = !_showMessage;
                        });
                      },
                      child: AnimatedOpacity(
                        opacity: _showMessage?0.5:1,
                        duration: Duration(milliseconds: 500),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            width: 150,
                            height: 100,
                            color: Colors.blueAccent,
                            alignment: Alignment.center,
                            child: Text(
                              "点我",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
