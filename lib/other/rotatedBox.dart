import 'package:flutter/material.dart';

class RotatedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("RotatedBox"),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RotatedBox(
                  quarterTurns: 3,
                  child: Container(
                    color: Colors.brown,
                    padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                    child: Text("龟虽寿",
                        style: TextStyle(
                            fontSize: 34,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  )),
              Container(
                  // color: Colors.purpleAccent,
                  child: Text(
                '''
          神龟虽寿，犹有竟时；

          腾蛇乘雾，终为土灰。

          老骥伏枥，志在千里；

          烈士暮年，壮心不已。

          盈缩之期，不但在天；

          养怡之福，可得永年。

          幸甚至哉，歌以咏志。''',
                style: TextStyle(fontSize: 15),
              )),
              SizedBox(width: 20),
              Container(
                height: 255,
                alignment: Alignment.bottomLeft,
                // color: Colors.lightBlueAccent,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(color: Colors.grey)),
                        child: Text(
                          "曹操",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(color: Colors.grey)),
                        child: Text(
                          "曹孟德",
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
