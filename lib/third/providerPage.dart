import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/other/randomIntUtil.dart';
import 'package:provider/provider.dart';

///每当调用该Consumer小部件时，notifyListeners()时它都会重建其下方的任何小部件。
///如果不需要重建，可以使用Provider.of并将侦听器设置为 false
class ProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (context) => MyModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("ProviderPage"),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.all(20),
                color: Colors.green[200],
                child: MyButton()/*ElevatedButton(
                  child: Text("Do something"),
                  onPressed: () => myModel.doSomething(),
                ) */
                  /*Consumer<MyModel>(
                builder: (context, myModel, child) {
                  return ElevatedButton(
                    child: Text("Do something"),
                    onPressed: () => myModel.doSomething(),
                  );
                },
              ),*/
            ),
            Container(
              padding: EdgeInsets.all(35),
              color: Colors.blue[200],
              child: Consumer<MyModel>(
                builder: (context, myModel, child) {
                  return Text(myModel.someValue);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myModel = Provider.of<MyModel>(context, listen: false);
    return ElevatedButton(
      child: Text('Do something'),
      onPressed: () {
        myModel.doSomething();
      },
    );
  }
}

class MyModel extends ChangeNotifier {
  String someValue = "Hello~";

  void doSomething() {
    someValue = "你好~${RandomUtil.getInt(1, 100)}";
    print(someValue);
    notifyListeners();
  }
}
