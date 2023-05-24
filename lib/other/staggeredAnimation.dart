import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StaggeredAnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StaggeredAnimationState();
  }
}

class StaggeredAnimationState extends State<StaggeredAnimationPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> opacity;
  late Animation<double> width;
  late Animation<double> height;
  late Animation<EdgeInsets> padding;
  late Animation<BorderRadius?> borderRadius;
  late Animation<Color?> color;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    opacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller, curve: Interval(0.0, 0.1, curve: Curves.ease)));
    width = Tween<double>(begin: 50.0, end: 150.0).animate(CurvedAnimation(
        parent: _controller, curve: Interval(0.125, 0.25, curve: Curves.ease)));
    height = Tween<double>(begin: 50.0, end: 150.0).animate(CurvedAnimation(
        parent: _controller, curve: Interval(0.25, 0.375, curve: Curves.ease)));
    padding = EdgeInsetsTween(begin: EdgeInsets.all(0), end: EdgeInsets.all(10))
        .animate(CurvedAnimation(
            parent: _controller,
            curve: Interval(0.25, 0.375, curve: Curves.ease)));
    borderRadius = BorderRadiusTween(
            begin: BorderRadius.circular(4.0), end: BorderRadius.circular(75.0))
        .animate(CurvedAnimation(
            parent: _controller,
            curve: Interval(0.375, 0.500, curve: Curves.ease)));
    color = ColorTween(begin: Colors.blue[300], end: Colors.amberAccent)
        .animate(CurvedAnimation(
            parent: _controller, curve: Interval(0.500, 0.750)));
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StaggeredAnimation"),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 300,
          height: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.black.withOpacity(0.1),
              border: Border.all(color: Colors.black.withOpacity(0.5))),
          child: AnimatedBuilder(
            builder: _buildAnimation,
            animation: _controller,
          ),
        ),
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Container(
      width: width.value,
      height: height.value,
      padding: padding.value,
      decoration: BoxDecoration(
        borderRadius: borderRadius.value,
        color: color.value,
        border: Border.all(color: Colors.indigo.shade300, width: 3.0),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
