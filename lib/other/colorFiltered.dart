import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ColorFilteredPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ColorFiltered"),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        children: [
          getItem(BlendMode.saturation),
          getItem(BlendMode.modulate),
          getItem(BlendMode.dst),
          getItem(BlendMode.dstIn),
          getItem(BlendMode.dstOut),
          getItem(BlendMode.dstATop),
          getItem(BlendMode.dstOver),
          getItem(BlendMode.src),
          getItem(BlendMode.srcIn),
          getItem(BlendMode.srcOut),
          getItem(BlendMode.srcATop),
          getItem(BlendMode.srcOver),
          getItem(BlendMode.clear),
          getItem(BlendMode.color),
          getItem(BlendMode.colorBurn),
          getItem(BlendMode.colorDodge),
          getItem(BlendMode.darken),
          getItem(BlendMode.difference),
          getItem(BlendMode.exclusion),
          getItem(BlendMode.hardLight),
          getItem(BlendMode.hue),
          getItem(BlendMode.lighten),
          getItem(BlendMode.luminosity),
          getItem(BlendMode.multiply),
          getItem(BlendMode.overlay),
          getItem(BlendMode.plus),
          getItem(BlendMode.screen),
          getItem(BlendMode.softLight),
          getItem(BlendMode.xor)
        ],
      ),
    );
  }

  Widget getItem(BlendMode mode) {
    return Container(
      padding: EdgeInsets.all(15),
      color: Colors.black12,
      child: Column(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(Colors.grey, mode),
            child: Image.asset("images/head.jpg"),
          ),
          Text(mode.toString())
        ],
      ),
    );
  }
}
