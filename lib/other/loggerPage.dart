import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/log/myLogger.dart';

// ignore: must_be_immutable
class LoggerPage extends StatelessWidget {
  var logger = MyLogger();
  List<String>? nullList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logger"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text("输出info日志"),
            onPressed: () {
              logger.i("info~info~info~info~info~info~info~");
            },
          ),
          ElevatedButton(
            child: Text("输出debug日志"),
            onPressed: () {
              logger.d("debug~debug~debug~debug~debug~debug~debug~");
            },
          ),
          ElevatedButton(
            child: Text("输出warning日志"),
            onPressed: () {
              logger.w(
                  "warning~warning~warning~warning~warning~warning~warning~");
            },
          ),
          ElevatedButton(
            child: Text("输出error日志"),
            onPressed: () {
              try {
                /*throw PlatformException(
                    code: "-1",
                    message:
                        "PlatformException!!!PlatformException!!!PlatformException!!!");*/
                String str = "abc123";
                str.substring(10,15);
              }  catch (e) {
                logger.e("error~error~error~error~error~error~error~",error: e);
              }
            },
          )
        ],
      ),
    );
  }
}
