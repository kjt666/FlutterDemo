import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CircleImage extends StatefulWidget {
  String? url;
  double width;
  double height;
  GestureTapCallback? onTap;

  CircleImage(this.url, {this.width = 80, this.height = 80, this.onTap});

  @override
  State<StatefulWidget> createState() {
    return _CircleImageState();
  }
}

class _CircleImageState extends State<CircleImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300, width: 0.5),
          image: DecorationImage(
              image: NetworkImage(widget.url ?? ""), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
