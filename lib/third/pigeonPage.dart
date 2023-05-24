import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../pigeon.dart';

class PigeonPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PigeonState();
  }
}

class PigeonState extends State<PigeonPage> {
  NativeApi nativeApi = NativeApi();

  Book? searchBook;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pigeon"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  nativeApi.saveBook(Book(
                      title: "三体",
                      author: Author(
                          name: "刘慈欣", male: false, state: StateEnum.success)));
                },
                child: Text("调用原生的saveBook()方法")),
            ElevatedButton(
                onPressed: () {
                  nativeApi.searchBook("明朝那些事儿").then((value) {
                    setState(() {
                      searchBook = value;
                    });
                  });
                },
                child: Text("调用原生的searchBook()方法")),
            Offstage(
              offstage: searchBook == null,
              child: Text(
                  "书名：${searchBook?.title}，作者：${searchBook?.author?.name}"),
            ),
            ElevatedButton(
                onPressed: () {
                  nativeApi.getSomething().then((value) {
                    setState(() {
                      Fluttertoast.showToast(msg: value);
                    });
                  });
                },
                child: Text("调用原生的异步方法方法")),
          ],
        ),
      ),
    );
  }
}
