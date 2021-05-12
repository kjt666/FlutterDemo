import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SliverAppBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 260,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Doge"),
              collapseMode: CollapseMode.parallax,
              background: Image.network(
                "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201311%2F05%2F20131105170355_Nsmw2.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1621059006&t=916bee75f0664c20e7446ba8ea07727f",
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Card(
                child: Center(heightFactor: 5,
                  child: Text("$index",),
                ),
              );
            }, childCount: 20),
          )
        ],
      ),
    );
  }
}
