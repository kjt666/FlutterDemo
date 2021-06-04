import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/util/methodChannelUtil.dart';

class NativeImage extends StatefulWidget {
  String url = "";

  NativeImage(this.url);

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
      image = Image.network(widget.url);
    } else {
      image = Image.file(File(imagePath));
    }
    getNativeImage();
  }

  Future<void> getNativeImage() async {
    String path;
    try {
      path = await MethodChannelUtil.nativeChannel
          .invokeMethod("image", {'name': '${widget.url}'});
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
