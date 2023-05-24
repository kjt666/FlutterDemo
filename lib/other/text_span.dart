import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/util/emojiUtil.dart';

class TextSpanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextSpanState();
  }
}

class _TextSpanState extends State<TextSpanPage> {
  String s =
      "我刚吃完饭 [(f)][(k)] [(f)][(t)]哈哈[(n)][(h)][(A)][(w)][(E)][(L)][(L)][(E)][(E)][(z)][(z)][(A)][(B)][(D)][(#)][(X)][(&)][(&)][(*)][(X)][(X)]";
  List<InlineSpan>? spans = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    spans?.add(TextSpan(text: s, style: TextStyle(color: Colors.black)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextSpan"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: "我爱你，你爱我，蜜雪冰城甜蜜蜜~",
                      style: TextStyle(color: Colors.black)),
                  WidgetSpan(
                      child: Image.asset(
                    "images/ee_1.png",
                    width: 25,
                    height: 25,
                  )),
                  WidgetSpan(
                      child: Image.asset(
                    "images/ee_2.png",
                    width: 25,
                    height: 25,
                  ))
                ])),
            SizedBox(height: 10),
            RichText(
                text: TextSpan(children: [
              TextSpan(text: "我爱你，", style: TextStyle(color: Colors.black)),
              TextSpan(text: "你爱我，", style: TextStyle(color: Colors.redAccent)),
              TextSpan(text: "蜜雪冰城甜蜜蜜~", style: TextStyle(color: Colors.amber)),
            ])),
            SizedBox(height: 10),
            RichText(
                text: TextSpan(children: [
              TextSpan(text: "我爱你，", style: TextStyle(color: Colors.black)),
              WidgetSpan(
                  child: ElevatedButton(
                    child: Text("你爱我，"),
                    onPressed: () {},
                  ),
                  style: TextStyle(color: Colors.redAccent)),
              TextSpan(text: "蜜雪冰城甜蜜蜜~", style: TextStyle(color: Colors.black)),
            ])),
            RichText(text: TextSpan(children: spans)),
            ElevatedButton(
                onPressed: () {
                  var list = EmojiUtil.getInstance()?.addSmiles(
                      s,
                      TapGestureRecognizer()
                        ..onTap = () {
                          print("啊哦~");
                        });
                  spans = list;
                  setState(() {});
                },
                child: Text("转换字符串"))
          ],
        ),
      ),
    );
  }
}
