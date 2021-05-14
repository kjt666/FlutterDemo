import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedCrossFadePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedCrossFadeState();
  }
}

class _AnimatedCrossFadeState extends State<AnimatedCrossFadePage> {
  var showStatus = List<bool>.filled(9, false);
  List<String> s = [
    "+5000",
    "-1W",
    "-2000",
    "+1",
    "-30",
    "+10W",
    "+100",
    "+50W",
    "+5"
  ];
  int maxChoiceCount = 3;
  int currentChoiceCount = 0;
  bool hideAgain = true;
  Color endColor = Colors.yellow;

  @override
  void initState() {
    super.initState();
    s.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AnimatedCrossFade"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder(
                duration: Duration(milliseconds: 300),
                child: Text("开心大乐透",
                    style: TextStyle(
                      fontSize: 28,
                      fontStyle: FontStyle.italic,
                    )),
                tween: ColorTween(begin: Colors.redAccent, end: endColor),
                builder: (context, color, child) {
                  return ColorFiltered(
                      child: child,
                      colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
                },
                onEnd: () {
                  // print("TweenAnimationBuilder end");
                  setState(() {
                    endColor = endColor == Colors.yellow?Colors.redAccent:Colors.yellow;
                    // endColor = RandomUtil.getColor();
                  });
                },
              ),
              Text("您有三次开奖机会~"),
              Flexible(
                  child: FractionallySizedBox(
                heightFactor: 0.1,
              )),
              Container(
                height: 300,
                width: 300,
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  children: [for (var i = 0; i < 9; i++) getGridItem(i)],
                ),
              ),
              Offstage(
                offstage: hideAgain,
                child: RaisedButton(
                  child: Text("不过瘾，再来一次"),
                  onPressed: () {
                    setState(() {
                      hideAgain = true;
                      currentChoiceCount = 0;
                      showStatus.fillRange(0, showStatus.length, false);
                      s.shuffle();
                    });
                  },
                ),
              )
            ],
          ),
        ));
  }

  Widget getGridItem(int i) {
    return GestureDetector(
      onTapDown: (d) {
        setState(() {
          if(showStatus[i])
            return;
          currentChoiceCount++;
          if (currentChoiceCount <= maxChoiceCount) {
            // showStatus[i] = !showStatus[i];
            showStatus[i] = true;
          }
          if (currentChoiceCount == maxChoiceCount) {
            hideAgain = false;
          }
        });
      },
      child: /*GridTile(
          child:*/
          AnimatedCrossFade(
        crossFadeState: showStatus[i]
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        firstCurve: Curves.ease,
        secondCurve: Curves.ease,
        reverseDuration: Duration(milliseconds: 0),
        duration: Duration(milliseconds: 500),
        firstChild: Container(
          color: Colors.redAccent,
        ),
        secondChild: Container(
          color: Colors.black26,
          alignment: Alignment.center,
          child: Text(s[i]),
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
