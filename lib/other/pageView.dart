import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PageViewPageState();
  }
}

class _PageViewPageState extends State<PageViewPage> {
  List widthList = [200.0, 250.0, 170.0];
  var currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      print("value = ${_pageController.page}\n current index = $currentIndex");
      //向左滑
      if (_pageController.page > currentIndex) {

      }
      //向右滑
      else {

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageView"),
      ),
      body: Container(
        color: Colors.yellow,
        width: double.infinity,
        height: widthList[currentIndex],
        child: PageView(
          onPageChanged: (i) {
            setState(() {
              currentIndex = i;
            });
          },
          controller: _pageController,
          children: [
            Image.asset(
              "images/1.jpeg",
              fit: BoxFit.fill,
            ),
            Image.asset(
              "images/2.jpeg",
              fit: BoxFit.fill,
            ),
            Image.asset(
              "images/3.jpeg",
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }
}
