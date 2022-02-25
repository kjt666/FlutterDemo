import 'package:flutter/material.dart';
import 'package:flutter_app/eum_noscroll_behavior.dart';
import 'package:flutter_app/widget/answerItem.dart';
import 'package:flutter_app/widget/circleImage.dart';
import 'package:flutter_app/widget/emptyView.dart';
import 'package:flutter_app/widget/filletButton.dart';
import 'package:flutter_app/widget/filletImage.dart';
import 'package:flutter_app/widget/nativeImageProvider.dart';
import 'package:flutter_app/widget/relatedBook.dart';
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
      backgroundColor: Colors.white,
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
                  _getContent(),
                  _getListTitle(),
                  _getList(),
                ],
              ),
            ),
          ),
          _getWriteAnswerButton(),
          _getTabBar()
        ],
      ),
    );
  }

  Widget _getTabBar() {
    return Positioned(
        child: Container(
          height: 44.h,
          color: Colors.white,
          child: Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // Navigator.pop(context);
                  }),
              SizedBox(width: 10.w),
              Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 5.w),
                  child: CircleImage(
                    "http://avatar.youshu.cc/readwith/20210408/606eb24bf2335.jpg",
                    width: 24.r,
                    height: 24.r,
                  )),
              Text(
                "沃斯尼蝶",
                style: TextStyle(color: Color(0xff1b1b1b), fontSize: 13.sp),
              ),
              Spacer(),
              FilletButton(
                "关注",
                radius: 0.5.w,
                bgColor: Colors.blue,
                padding: EdgeInsets.fromLTRB(8.5.w, 1.5.h, 8.5.w, 2.h),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.share))
            ],
          ),
        ));
  }

  Widget _getContent() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(15.w, 20.h, 15.w, 15.h),
        child: Column(
          children: [
            SizedBox(height: 25.h),
            Text(
              "孩子们所谓的“提升”反映了哪些现实问题，如果有机会，你愿意接受这种“提升”吗？",
              style: TextStyle(
                  color: Color(0xff1b1b1b),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
            Offstage(
                offstage: false,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
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
                )),
            SizedBox(height: 10.h),
            RelatedBook(
              "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201708%2F19%2F20170819135341_ZAKWG.thumb.700_0.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1648290737&t=d44f8d79a66f814a3954998c2a522269",
              "万物有灵",
              "主讲人:老路",
              () {},
            ),
            SizedBox(height: 10.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5.w, 4.h, 6.5.w, 4.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.w),
                        gradient: LinearGradient(
                            colors: [Color(0x103E6BD0), Color(0x1078F1CB)])),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Image(
                                width: 11.5.w,
                                height: 13.h,
                                image: NativeImageProvider("wneti_icon"))),
                        SizedBox(width: 6.w),
                        Text(
                          "查看更多相关问题",
                          style: TextStyle(
                              color: Color(0xff676767), fontSize: 12.sp),
                        )
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  "18分钟前",
                  style: TextStyle(color: Color(0xffb3b3b3), fontSize: 11.sp),
                ),
                Offstage(
                  offstage: true,
                  child: GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child: Image(
                        width: 14.w,
                        height: 2.h,
                        image: NativeImageProvider("more_icon"),
                      ),
                    ),
                  ),
                )
              ],
            )
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
    return false
        ? SliverToBoxAdapter(
            child: Container(
            color: Colors.white,
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: NativeImageProvider("quesheng_wuwifi_07"),
                  width: 210,
                  height: 120,
                ),
                SizedBox(height: 10),
                Text(
                  "快来发表回答吧~",
                  style: TextStyle(color: Colors.grey[600]),
                )
              ],
            ),
          ))
        : SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return AnswerItem();
            }, childCount: 10),
          );
  }

  Widget _getWriteAnswerButton() {
    return Positioned(
        bottom: 28.5.h,
        child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 100.w,
              height: 35.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(19.w),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xff04CD8A), Color(0xff07D892)],
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
            )));
  }
}
