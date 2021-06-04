import 'package:flutter/widgets.dart';

class CircleImage extends StatefulWidget {
  final String url;
  final double width;
  final double height;

  CircleImage(this.url, {this.width, this.height});

  @override
  State<StatefulWidget> createState() {
    return _CircleImageState();
  }
}

class _CircleImageState extends State<CircleImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 80,
      height: widget.height ?? 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image:
            DecorationImage(image: NetworkImage(widget.url), fit: BoxFit.cover),
      ),
    );
  }
}
