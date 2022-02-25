import 'package:flutter/widgets.dart';

class FilletImage extends StatefulWidget {
  final String url;
  final double corner;
  final double width;
  final double height;
  final GestureTapCallback onTap;

  FilletImage(this.url, {this.corner, this.width, this.height, this.onTap});

  @override
  State<StatefulWidget> createState() {
    return _FilletImageState();
  }
}

class _FilletImageState extends State<FilletImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
        child: Image.network(widget.url,
            fit: BoxFit.cover,
            width: widget.width ?? 50,
            height: widget.height ?? 50),
        borderRadius: BorderRadius.circular(widget.corner ?? 0),
      ),
      onTap: widget.onTap,
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
