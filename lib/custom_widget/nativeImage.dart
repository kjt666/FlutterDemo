import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/util/methodChannelUtil.dart';

class NativeImage extends StatefulWidget {
  String url = "";
  double width =20;
  double height =20;

  NativeImage(this.url,{this.width,this.height});

  @override
  State<StatefulWidget> createState() {
    return _NativeImageState();
  }
}

class _NativeImageState extends State<NativeImage> {
  Widget image;
  String imagePath = "";

  @override
  void initState() {
    super.initState();
    if (widget.url.startsWith("http") || widget.url.startsWith("https")) {
      image = Image.network(widget.url,width: widget.width,height: widget.height);
    } else {
      image = Image.file(File(imagePath),width: widget.width,height: widget.height);
    }
  }

  Future<void> getNativeImage() async {
    String path;
    try {
      path = await MethodChannelUtil.nativeChannel
          .invokeMethod("image", {'name': '${widget.url}'});
      print("$path");
      setState(() {
        imagePath = path;
      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return image;
  }
}
