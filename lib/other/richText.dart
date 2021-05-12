import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RichTextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("RichText")),
      body: Center(
        child: RichText(
          text: TextSpan(
              // style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                    text: "I am ",
                    style: TextStyle(fontSize: 24, color: Colors.black)),
                TextSpan(
                    text: "rich",
                    recognizer: TapGestureRecognizer()..onTapDown = (d){
                      Fluttertoast.showToast(msg: "I'm very rich");
                    },
                    style: TextStyle(
                        fontSize: 88,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.wavy,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.redAccent))
              ]),
        ),
      ),
    );
  }
}
