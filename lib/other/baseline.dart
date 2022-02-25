import 'package:flutter/material.dart';

class BaselinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Baseline"),
      ),
      body: Container(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 550,
          color: Colors.grey[400],
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  child: Container(
                    height: 275,
                    color: Colors.red,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.black,
                  width: 3,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 2,
                  color: Colors.black,
                ),
              ),
              Baseline(
                baseline: 275,
                baselineType: TextBaseline.alphabetic,
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "0",
                      style: TextStyle(
                          fontSize: 48,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
