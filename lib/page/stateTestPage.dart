import 'package:flutter/material.dart';

class StateTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateTestPageState();
  }
}

class StateTestPageState extends State {
  @override
  Widget build(BuildContext context) {
    print("page widget build");
    return Scaffold(
      appBar: AppBar(
        title: Text("StateTestPage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HaveStateWidget(),
            NoStateWidget(),
            TextButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text("点击刷新"))
          ],
        ),
      ),
    );
  }
}

class HaveStateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HaveStateWidgetState();
  }
}

class HaveStateWidgetState extends State {
  @override
  Widget build(BuildContext context) {
    print("haveState widget build");
    return Text("我是有状态小部件");
  }
}

class NoStateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("noState widget build");
    return Text("我是无状态小部件");
  }
}
