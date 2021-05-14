import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InteractiveViewerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InteractiveViewer"),
      ),
      body: Container(
        height: double.infinity,
        /*child: InteractiveViewer(
          //只能在水平或竖直方向上平移
          // alignPanAxis: true,
          //如果为false，则将阻止用户平移
          // panEnabled: false,
          //如果设置为Clip.none，则子级可能会超出InteractiveViewer的大小，但是在这些区域中不会接收到手势。 使用Clip.none时，请确保InteractiveViewer是所需的尺寸。
          // clipBehavior: Clip.none,
          maxScale: 5,
          child: Image.network(
              "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201503%2F02%2F203935nub7j7vvt0uberrk.jpg&refer=http%3A%2F%2Fattach.bbs.miui.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1621578280&t=3ca69068c29d86594eb3f821aa89c9be"),
        ),*/
      ),
    );
  }
}
