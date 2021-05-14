import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConstrainedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ConstrainedBox"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 120),
                child: Text(
                  "Delicious Candy",
                  style: TextStyle(fontSize: 28, color: Colors.blueAccent),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: 100),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text(
                    "Tap Me!",
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
