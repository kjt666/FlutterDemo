import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DraggableScrollableSheetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DraggableScrollableSheet"),
      ),
      body: Stack(
        children: [
          getItem(5),
          getItem(4),
          getItem(3),
          getItem(2),
          getItem(1)
        ],
      ),
    );
  }

  Widget getItem(int position) {
    double minSize = position / 20;
    return DraggableScrollableSheet(
      initialChildSize: minSize,
      minChildSize: minSize,
      maxChildSize: 0.8,
      builder: (BuildContext context, ScrollController scrollController) {
        return ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Image.asset("images/$position.jpeg"),
          ),
        );
      },
    );
  }
}
