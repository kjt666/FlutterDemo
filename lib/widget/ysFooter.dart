import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'loading.dart';
import 'nativeImageProvider.dart';

class YsFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      loadStyle: LoadStyle.ShowWhenLoading,
      builder: (BuildContext context, LoadStatus mode) {
        Widget body;
        if (mode == LoadStatus.loading) {
          body = Loading(Colors.grey[500]);
        } else if (mode == LoadStatus.canLoading) {
          body = Text("松手,加载更多!");
        } else {
          body = Image(image: NativeImageProvider("youshu_slogn"));
        }
        return Container(
          height: 60,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Center(child: body),
        );
      },
    );
  }
}
