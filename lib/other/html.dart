import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Html"),
      ),
      body: ListView(
        children: [
          Html(
            data:
                "“不积百Book，无以至千里”，有书共读第100期啦～回看“如何读完100本书”直播，快来收割读书干货吧！#我们相遇的第100周#<br\/>咳咳～好啦～正事说完，现在来晒超级幕后花絮[(U)]<p class=\"zss_editor_img\"><img src=\"http:\/\/img.youshu.cc\/readwith\/20171106\/5a007185cb6da.jpeg\" \/><\/p><p class=\"zss_editor_img\"><img src=\"http:\/\/img.youshu.cc\/readwith\/20171106\/5a007185d0414.jpeg\" \/><\/p><p class=\"zss_editor_img\"><img src=\"http:\/\/img.youshu.cc\/readwith\/20171106\/5a007185d5b7c.jpeg\" \/><\/p><p class=\"zss_editor_img\"><img src=\"http:\/\/img.youshu.cc\/readwith\/20171106\/5a007185eb799.jpeg\" \/><\/p><p class=\"zss_editor_img\"><img src=\"http:\/\/img.youshu.cc\/readwith\/20171106\/5a007185f04b7.jpeg\" \/><\/p><p class=\"zss_editor_img\"><img src=\"http:\/\/img.youshu.cc\/readwith\/20171106\/5a007186010e9.jpeg\" \/><\/p><p class=\"zss_editor_img\"><img src=\"http:\/\/img.youshu.cc\/readwith\/20171106\/5a007186137f4.jpeg\" \/><\/p><p class=\"zss_editor_img\"><img src=\"http:\/\/img.youshu.cc\/readwith\/20171106\/5a00718619e51.jpeg\" \/><\/p><p class=\"zss_editor_img\"><img src=\"http:\/\/img.youshu.cc\/readwith\/20171106\/5a00718621c7a.jpeg\" \/><\/p>",
            onImageTap: (url, context, attributes, element) {
              print("url =====>  $url");
              print("attributes =====>  $attributes");
              print("element =====>  $element");
            },

          )
        ],
      ),
    );
  }
}
