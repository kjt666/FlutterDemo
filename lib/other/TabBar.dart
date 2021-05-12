import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Text("TabBar"),
            bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                tabs: [
                  Tab(
                    text: "大海",
                  ),
                  Tab(
                    text: "萝莉",
                  ),
                  Tab(
                    text: "星轨",
                  ),
                  Tab(
                    text: "美女",
                  ),
                  Tab(
                    text: "草原",
                  )
                ]),
          ),
          body: TabBarView(children: [
            FractionallySizedBox(
              child: ClipRRect(
                child: Image.asset(
                  "images/1.jpeg",
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              widthFactor: 0.9,
              heightFactor: 0.9,
            ),
            FractionallySizedBox(
              child: ClipRRect(
                child: Image.asset(
                  "images/2.jpeg",
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              widthFactor: 0.9,
              heightFactor: 0.9,
            ),
            FractionallySizedBox(
              child: ClipRRect(
                child: Image.asset(
                  "images/3.jpeg",
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              widthFactor: 0.9,
              heightFactor: 0.9,
            ),
            FractionallySizedBox(
              child: ClipRRect(
                child: Image.asset(
                  "images/4.jpeg",
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              widthFactor: 0.9,
              heightFactor: 0.9,
            ),
            FractionallySizedBox(
              child: ClipRRect(
                child: Image.asset(
                  "images/5.jpeg",
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              widthFactor: 0.9,
              heightFactor: 0.9,
            )
          ]),
        ));
  }
}
