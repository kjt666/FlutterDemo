import 'package:flutter/widgets.dart';

class FilletImage extends StatefulWidget {
  final String url;
  final double? corner;
  final double? width;
  final double? height;

  FilletImage(this.url, {this.corner, this.width, this.height});

  @override
  State<StatefulWidget> createState() {
    return _FilletImageState();
  }
}

class _FilletImageState extends State<FilletImage> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Image.network(widget.url,
          fit: BoxFit.cover,
          width: widget.width ?? 50,
          height: widget.height ?? 50),
      borderRadius: BorderRadius.circular(widget.corner ?? 0),
    )
        /*Container(
      width: widget.width ?? 50,
      height: widget.height ?? 50,
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(widget.url)),
          borderRadius: BorderRadius.all(Radius.circular(widget.corner ?? 0))),
    )*/
        ;
  }
}
