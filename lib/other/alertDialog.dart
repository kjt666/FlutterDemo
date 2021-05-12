import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AlertDialogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AlertDialog"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (_a) => AlertDialog(
                            title: Text("Accept?"),
                            content: Text("Do you accept?"),
                            backgroundColor: Colors.amberAccent,
                            actions: [
                              RaisedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: Text("No")),
                              RaisedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: Text("Yes"))
                            ],
                          ));
                },
                child: Text("弹出Android提示框")),
            CupertinoButton(
                onPressed: () {
                  showCupertinoDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (_) => CupertinoAlertDialog(
                            title: Text("Accept?"),
                            content: Text("Do you accept?"),
                            actions: [
                              CupertinoDialogAction(
                                  child: Text("No"),
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  }),
                              CupertinoDialogAction(
                                  child: Text("Yes"),
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  })
                            ],
                          ));
                },
                child: Text("弹出Ios提示框")),
          ],
        )));
  }
}
