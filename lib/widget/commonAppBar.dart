import 'package:flutter/material.dart';

class CommonAppBar extends AppBar {
  CommonAppBar(
    BuildContext context,
    String titleStr, {
    Color backgroundColor = Colors.white,
    Color arrowColor = Colors.black,
    double elevation = 1,
    List<Widget> actions,
  }) : super(
            backgroundColor: backgroundColor,
            toolbarHeight: 44,
            elevation: elevation,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: arrowColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              titleStr,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            actions: actions);
}
