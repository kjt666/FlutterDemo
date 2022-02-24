import 'package:flutter/material.dart';
import 'package:flutter_app/eum_noscroll_behavior.dart';
import 'package:flutter_app/widget/answerItem.dart';
import 'package:flutter_app/widget/filletImage.dart';
import 'package:flutter_app/widget/nativeImageProvider.dart';
import 'package:flutter_app/widget/ysFooter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class QuestionDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuestionDetailPageState();
  }
}

class _QuestionDetailPageState extends State {
  RefreshController _refreshController;

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh: false);
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          ScrollConfiguration(
            behavior: EUMNoScrollBehavior(),
            child: SmartRefresher(
              enablePullDown: false,
              enablePullUp: true,
              controller: _refreshController,
              footer: YsFooter(),
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  _getListTitle(),
                  _getList(),
                ],
              ),
            ),
          ),
          _getWriteAnswerButton()
        ],
      ),
    );
  }

  Widget _getContent() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(15.w, 20.h, 15.w, 15.h),
        child: Column(
          children: [
            Text(
              "孩子们所谓的“提升”反映了哪些现实问题，如果有机会，你愿意接受这种“提升”吗？",
              style: TextStyle(
                  color: Color(0xff1b1b1b),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 15.h),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 4.w,
                  mainAxisSpacing: 4.w),
              itemBuilder: (context, index) {
                return FilletImage(
                  "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201708%2F19%2F20170819135341_ZAKWG.thumb.700_0.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1648290737&t=d44f8d79a66f814a3954998c2a522269",
                  corner: 6.w,
                );
              },
              itemCount: 5,
            ),
          ],
        ),
      ),
    );
  }

  ///回答头部布局
  Widget _getListTitle() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            color: Colors.grey[100],
            height: 8.h,
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(15.w, 17.h, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("回答",
                    style: TextStyle(
                        color: Color(0xff151515),
                        fontWeight: FontWeight.bold,
                        fontSize: 19.sp)),
                SizedBox(width: 7.w),
                Text("12条评论",
                    style: TextStyle(fontSize: 10.sp, color: Color(0xffb3b3b3)))
              ],
            ),
          )
        ],
      ),
    );
  }

  ///回答列表
  Widget _getList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return AnswerItem();
      }, childCount: 10),
    );
  }

  Widget _getWriteAnswerButton() {
    return Positioned(
        bottom: 28.5.h,
        child: Container(
          width: 100.w,
          height: 38.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19.w),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff04CD8A), Color(0xff07D892)],
              )),
          child: Row(
            children: [
              Image(
                  width: 13.r,
                  height: 13.r,
                  image: NativeImageProvider("bi_dibu_icon")),
              SizedBox(width: 4.w),
              Text(
                "写回答",
                style: TextStyle(color: Colors.white, fontSize: 14.sp),
              )
            ],
          ),
        ));
  }
}
