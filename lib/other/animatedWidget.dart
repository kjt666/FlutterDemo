import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedWidgetState();
  }
}

class _AnimatedWidgetState extends State<AnimatedWidgetPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 1),lowerBound: 1,upperBound: 5, vsync: this)
          ..repeat(reverse: true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedWidget"),
      ),
      body: Center(
        child: ButtonTransition(_animationController),
      ),
    );
  }
}

class ButtonTransition extends AnimatedWidget {

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Container(alignment:Alignment.center,child: Text("WTF!",style: TextStyle(fontSize: 32,fontStyle: FontStyle.italic),),width: 200,height: 60,),
      style: TextButton.styleFrom(side: BorderSide(width: width.value,color: Colors.blue)),
    );
  }

  ButtonTransition(width) : super(listenable: width);

  Animation<double> get width => listenable;
}
