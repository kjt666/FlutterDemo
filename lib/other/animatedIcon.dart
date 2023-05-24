import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedIconPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedIconPageState();
  }
}

class _AnimatedIconPageState extends State<AnimatedIconPage>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
              onPressed: () {
                controller.forward();
              },
              child: Text("forward")),
          AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            progress: controller,
          ),
          AnimatedIcon(
            icon: AnimatedIcons.arrow_menu,
            progress: controller,
          ),
          AnimatedIcon(
            icon: AnimatedIcons.search_ellipsis,
            progress: controller,
          ),
          RaisedButton(
              onPressed: () {
                controller.reverse();
              },
              child: Text("reverse"))
        ],
      ),
    ));
  }
}
