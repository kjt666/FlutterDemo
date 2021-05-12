import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClipOvalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ClipOval"),
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: ClipOval(
                child: Image.asset("images/3.jpeg"),
              ),
            ),
            Flexible(
              flex: 1,
              child: ClipOval(
                child: Image.network(
                  "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201311%2F05%2F20131105170355_Nsmw2.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1621059006&t=916bee75f0664c20e7446ba8ea07727f",
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: ClipOval(
                child: Image.network(
                  "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fphotoblog%2F1503%2F19%2Fc15%2F4117546_4117546_1426763500796_mthumb.jpg&refer=http%3A%2F%2Fimg.pconline.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1621493127&t=1bf4c8bbbe7c42addf9714f5e0381cf0",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
