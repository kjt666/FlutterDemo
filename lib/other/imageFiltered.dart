import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageFilteredPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImageFilteredState();
  }
}

class _ImageFilteredState extends State<ImageFilteredPage> {
  double blur = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ImageFiltered"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
             /* child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                child: Image.asset("images/gyy.jpeg"),
              ),*/
            ),
          ),
          Slider(
              value: blur,
              min: 0,
              max: 10,
              divisions: 10,
              onChanged: (newValue) {
                setState(() {
                  blur = newValue;
                });
              })
        ],
      ),
    );
  }
}
