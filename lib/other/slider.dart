import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SliderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SliderState();
  }
}

class _SliderState extends State<SliderPage> {
  double rating = 30;
  double rating2 = 50;
  var selectedRange = RangeValues(20, 50);
  double rating3 = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("$rating"),
            Slider(
              value: rating,
              onChanged: (newRating) {
                setState(() {
                  rating = newRating;
                });
              },
              min: 0,
              max: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Text("$rating2"),
            Slider(
              value: rating2,
              onChanged: (newRating) {
                setState(() {
                  rating2 = newRating;
                });
              },
              min: 0,
              max: 100,
              divisions: 10,
              label: "$rating2",
            ),
            SizedBox(
              height: 20,
            ),
            Text("$selectedRange"),
            RangeSlider(
                values: selectedRange,
                min: 0,
                max: 100,
                divisions: 10,
                labels: RangeLabels(
                    "${selectedRange.start}", "${selectedRange.end}"),
                onChanged: (newRange) {
                  setState(() {
                    selectedRange = newRange;
                  });
                }),
            SizedBox(
              height: 20,
            ),
            Text("$rating3"),
            CupertinoSlider(
                value: rating3,
                max: 10,
                min: 0,
                divisions: 5,
                onChanged: (newRating) {
                  setState(() {
                    rating3 = newRating;
                  });
                })
          ],
        ),
      ),
    );
  }
}
