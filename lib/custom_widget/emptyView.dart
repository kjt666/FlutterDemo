import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/custom_widget/loading.dart';

import 'nativeImageProvider.dart';

class EmptyView extends StatefulWidget {
  final String imageName;
  final String emptyText;
  final GestureTapCallback onTap;

  EmptyView(Key key, this.imageName, this.emptyText, this.onTap)
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return EmptyViewState();
  }
}

class EmptyViewState extends State<EmptyView> {
  bool hideEmptyView = true;
  bool hideLoading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Offstage(
          offstage: hideEmptyView,
          child: Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.only(top: 180),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: NativeImageProvider(widget.imageName),
                  width: 140,
                  height: 140,
                ),
                SizedBox(height: 10),
                Text(
                  widget.emptyText,
                  style: TextStyle(fontSize: 14, color: Color(0xff808080)),
                ),
                SizedBox(height: 25),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(21, 5, 21, 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border:
                            Border.all(color: Color(0xff4bba95), width: 0.5)),
                    child: Text(
                      "点击重试",
                      style: TextStyle(fontSize: 14, color: Color(0xff4bba95)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Offstage(
          offstage: hideLoading,
          child: Container(
            color: Colors.white,
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 200),
            width: double.infinity,
            height: double.infinity,
            child: PhysicalModel(
              color: Colors.grey[100],
              shadowColor: Colors.grey[100],
              borderRadius: BorderRadius.all(Radius.circular(12)),
              elevation: 10,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Loading(
                  Color(0xff4bba95),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void showLoading(bool isShow) {
    setState(() {
      if (isShow) {
        hideEmptyView = isShow;
      }
      hideLoading = !isShow;
    });
  }

  void showEmptyView(bool isShow) {
    setState(() {
      if (isShow) {
        hideLoading = isShow;
      }
      hideEmptyView = !isShow;
    });
  }
}
