import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Stack"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  getRedBox(),
                  getGreenBox(),
                  getBlueBox(),
                  getYellowBox()
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  getRedBox(),
                  getGreenBox(),
                  getBlueBox(),
                  Positioned(
                    child: getYellowBox(),
                    top: 20,
                    left: 20,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  getRedBox(),
                  Positioned(child: getBlueBox(),right: -50,bottom: -50,)
                ],
                clipBehavior: Clip.none,
              ),
            ],
          ),
        ));
  }

  Widget getRedBox() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: 160,
        height: 160,
        color: Colors.red,
      ),
    );
  }

  Widget getGreenBox() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: 140,
        height: 140,
        color: Colors.green,
      ),
    );
  }

  Widget getBlueBox() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: 120,
        height: 120,
        color: Colors.blue,
      ),
    );
  }

  Widget getYellowBox() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: 100,
        height: 100,
        color: Colors.yellow,
      ),
    );
  }
}
