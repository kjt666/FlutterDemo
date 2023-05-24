import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleFontsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var map = GoogleFonts.asMap();
    var keys = map.keys;
    return Scaffold(
      appBar: AppBar(
        title: Text("GoogleFonts"),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        children: [
          for (var key in keys)
            GridTile(
              child: Text(
                "Hello $key",
                textAlign: TextAlign.center,
                style: map[key]?.call(),
              ),
            )
        ],
      ),
    );
  }
}
