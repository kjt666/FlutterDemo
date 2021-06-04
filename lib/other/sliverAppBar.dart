import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SliverAppBarPage extends StatelessWidget {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar:true,
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              snap: false,
              floating: false,
              expandedHeight: 360,
              title: Text("Doge"),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Image.network(
                  "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201311%2F05%2F20131105170355_Nsmw2.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1621059006&t=916bee75f0664c20e7446ba8ea07727f",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
                child: Center(
                  child: Text('Scroll to see the SliverAppBar in effect.'),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Card(
                  child: Center(
                    heightFactor: 5,
                    child: Text(
                      "$index",
                    ),
                  ),
                );
              }, childCount: 20),
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          elevation: 5.0,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Text("a"), Text("b"), Text("c")],
            ),
          ),
        ));
  }
}
