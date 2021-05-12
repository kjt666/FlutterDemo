import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MediaQueryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MediaQueryPage();
  }
}

class _MediaQueryPage extends State<MediaQueryPage> {
  @override
  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("MediaQuery"),),
      body: Center(
        child: Text(queryData.toString()),
      ),
    );
  }
}
