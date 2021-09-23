import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BuilderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Builder"),
      ),
      body: TextButton(
        child: Text("Click Here!"),
        onPressed: () {
          print(Scaffold.of(context).hasAppBar);
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Help!")));
        },
      ),
    );
  }
}
