import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllChildrenCanResponseEvent extends StatelessWidget {
  const AllChildrenCanResponseEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        wChild(1, 200),
        wChild(2, 200),
        // AbsorbPointer(child: wChild(1, 200)),
        // AbsorbPointer(child: wChild(2, 200)),
      ],
    );
  }

  Widget wChild(int index, double size) {
    return Listener(
      onPointerDown: (e) => print(index),
      behavior: HitTestBehavior.translucent,
      child: IgnorePointer(child:  Container(
        width: size,
        height: size,
        color: Colors.grey,
      ),),
    );
  }
}