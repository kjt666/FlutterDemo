import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/util/methodChannelUtil.dart';

class NativeImagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NativeState();
  }
}

class _NativeState extends State<NativeImagePage> {

  var imagePath = "";

  Future<void> getNativeImage() async {
    String path;
    try {
      path = await MethodChannelUtil.nativeChannel.invokeMethod("image", {'name': 'ic_launcher'});
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
    return Scaffold(
      appBar: AppBar(
        title: Text("NativeImage"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text("调用原生资源图片"),
              onPressed: () {
                getNativeImage();
              },
            ),
            Image.file(
              File(imagePath),
              width: 50,
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
