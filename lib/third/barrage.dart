import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_barrage/flutter_barrage.dart';

class BarragePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BarragePageState();
  }
}

class BarragePageState extends State<BarragePage> {
  final barrageWallController = BarrageWallController();

  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    // List<Bullet> bullets = [];

    List<Bullet> bullets = List<Bullet>.generate(1000, (i) {
      final showTime = random.nextInt(60000); // in 60s
      return Bullet(child: Text('$i-$showTime'), showTime: showTime);
    });

    final textEditingController = TextEditingController();
    return Scaffold(
        appBar: AppBar(title: Text("弹幕")),
        body: SafeArea(
            child: Column(children: <Widget>[
          Expanded(
              flex: 9,
              child: Stack(children: <Widget>[
                Positioned(
//                    top: 20,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width *
                            MediaQuery.of(context).size.aspectRatio +
                        100,
                    child: BarrageWall(
                        debug: true,
                        safeBottomHeight: 60,
                        // do not send bullets to the safe area
                        /*
                      speed: 8,
                      speedCorrectionInMilliseconds: 3000,*/
                        /*
                        timelineNotifier: timelineNotifier, // send a BarrageValue notifier let bullet fires using your own timeline*/
                        bullets: bullets,
                        child: new Container(),
                        controller: barrageWallController)),
              ])),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      controller: textEditingController,
                      textInputAction: TextInputAction.send,
                      maxLength: 20,
                      onSubmitted: (text) {
                        textEditingController.clear();
                        barrageWallController
                            .send([new Bullet(child: Text(text))]);
                      }))),
        ])));
  }
}
