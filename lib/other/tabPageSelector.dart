import 'package:flutter/material.dart';

class TabPageSelectorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TabPageSelectorState();
  }
}

class TabPageSelectorState extends State with TickerProviderStateMixin {
  PageController _pageController;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabPageSelector"),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _tabController.index = index;
              });
            },
            children: List.generate(5, (index) {
              return Image.asset(
                "images/${index + 1}.jpeg",
                fit: BoxFit.fill,
              );
            }),
          ),
          Positioned(
            bottom: 20,
            child: TabPageSelector(
              controller: _tabController,
              color: Colors.grey,
              selectedColor: Colors.white,
              indicatorSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
