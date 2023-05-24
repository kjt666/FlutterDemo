import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/other/randomIntUtil.dart';

class TweenAnimationBuilderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TweenAnimationBuilderState();
  }
}

class _TweenAnimationBuilderState extends State<TweenAnimationBuilderPage> {

  Color endColor = Colors.redAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TweenAnimationBuilder"),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          duration: Duration(seconds: 1),
          child: Text(
              "TweenAnimationBuilder",style: TextStyle(fontSize: 24,fontStyle: FontStyle.italic,)),
          tween: ColorTween(begin: Colors.black, end: endColor),
          builder: (context, color, child) {
            return ColorFiltered(
                child: child,
                colorFilter: ColorFilter.mode(color as Color, BlendMode.srcIn));
          },
          onEnd: (){
            // print("TweenAnimationBuilder end");
            setState(() {
              endColor = RandomUtil.getColor();
            });
          },
        ),
      ),
    );
  }
}
