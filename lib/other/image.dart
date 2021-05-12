import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/head.jpg",
              width: 150,
              height: 150,
              fit: BoxFit.cover,
              color: Colors.redAccent,
              colorBlendMode: BlendMode.saturation,
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              "images/dynamic.gif",
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            Image.network(
              "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201311%2F05%2F20131105170355_Nsmw2.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1621059006&t=916bee75f0664c20e7446ba8ea07727f",
              width: 150,
              height: 150,
              filterQuality: FilterQuality.high,
              loadingBuilder: (context, child, progress) {
                return progress == null
                    ? child
                    : LinearProgressIndicator(
                        minHeight: 10,
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
