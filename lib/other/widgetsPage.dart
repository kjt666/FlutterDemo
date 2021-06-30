import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/other/AnimatedOpacity.dart';
import 'package:flutter_app/other/ShaderMask.dart';
import 'package:flutter_app/other/TabBar.dart';
import 'package:flutter_app/other/alertDialog.dart';
import 'package:flutter_app/other/animatedCrossFade.dart';
import 'package:flutter_app/other/animatedPadding.dart';
import 'package:flutter_app/other/animatedPositioned.dart';
import 'package:flutter_app/other/animatedSwitcher.dart';
import 'package:flutter_app/other/animatedWidget.dart';
import 'package:flutter_app/other/animation.dart';
import 'package:flutter_app/other/aspectRatio.dart';
import 'package:flutter_app/other/builder.dart';
import 'package:flutter_app/other/checkBoxListTile.dart';
import 'package:flutter_app/other/clipOval.dart';
import 'package:flutter_app/other/colorFiltered.dart';
import 'package:flutter_app/other/constrainedBox.dart';
import 'package:flutter_app/other/custom_paint.dart';
import 'package:flutter_app/other/draggableScrollableSheet.dart';
import 'package:flutter_app/other/drawer.dart';
import 'package:flutter_app/other/flexiblePage.dart';
import 'package:flutter_app/other/fractionallySizedBox.dart';
import 'package:flutter_app/other/html.dart';
import 'package:flutter_app/other/image.dart';
import 'package:flutter_app/other/imageFiltered.dart';
import 'package:flutter_app/other/indexedStack.dart';
import 'package:flutter_app/other/interactiveViewer.dart';
import 'package:flutter_app/other/limitedBox.dart';
import 'package:flutter_app/other/listWheelScrollView.dart';
import 'package:flutter_app/other/mediaQueryPage.dart';
import 'package:flutter_app/other/nativeImage.dart';
import 'package:flutter_app/other/pageView.dart';
import 'package:flutter_app/other/physicalModel.dart';
import 'package:flutter_app/other/placeHolder.dart';
import 'package:flutter_app/other/progressIndicator.dart';
import 'package:flutter_app/other/reorderableListView.dart';
import 'package:flutter_app/other/richText.dart';
import 'package:flutter_app/other/selectableText.dart';
import 'package:flutter_app/other/slider.dart';
import 'package:flutter_app/other/sliverAppBar.dart';
import 'package:flutter_app/other/spacer.dart';
import 'package:flutter_app/other/stack.dart';
import 'package:flutter_app/other/text_span.dart';
import 'package:flutter_app/other/toggleButtons.dart';
import 'package:flutter_app/other/tweenAnimationBuilder.dart';
import 'package:logger/logger.dart';

import 'animatedIcon.dart';

class WidgetsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WidgetsPageState();
  }
}

class _WidgetsPageState extends State<WidgetsPage> {

  var logger = Logger(printer: PrettyPrinter());

  int index = 0;
  Color oddItemColor = Colors.blueGrey[50];
  Color evenItemColor = Colors.blueGrey[100];
  bool disEnable = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WidgetsPage"),
        actions: [
          Switch(
            value: disEnable,
            onChanged: (b) {
              setState(() {
                disEnable = !disEnable;
              });
            },
          )
        ],
      ),
      body: IgnorePointer(
        ignoring: disEnable,
        child: ListView(
          children: [
            getJumpItem("flexible", new FlexiblePage()),
            getJumpItem("mediaQuery", new MediaQueryPage()),
            getJumpItem("spacer", new SpacerPage()),
            getJumpItem("animatedIcon(带动画的图标)", new AnimatedIconPage()),
            getJumpItem("aspectRatio(部件宽高比)", new AspectRatioPage()),
            getJumpItem(
                "limitedBox(限制最大尺寸，配合列表、行、列部件使用)", new LimitedBoxPage()),
            getJumpItem("placeHolder(占位符)", new PlaceHolderPage()),
            getJumpItem("richText(可以展示多种文字效果)", new RichTextPage()),
            getJumpItem("reorderableListView(可以拖动item从新排列的列表)",
                new ReorderableListViewPage()),
            getJumpItem("animatedSwitcher(带动画的切换)", new AnimatedSwitcherPage()),
            getJumpItem(
                "animatedPositioned(带动画的位置变动)", new AnimatedPositionedPage()),
            getJumpItem("animatedPadding(带动画的边距)", new AnimatedPaddingPage()),
            getJumpItem(
                "indexedStack(可以展示指定下标child的部件)", new IndexedStackPage()),
            getJumpItem("constrainedBox(限制最大最小尺寸)", new ConstrainedBoxPage()),
            getJumpItem("stack(可以堆叠窗口的部件)", new StackPage()),
            getJumpItem(
                "animatedOpacity(带动画的透明度渐变)", new AnimatedOpacityPage()),
            getJumpItem(
                "fractionallySizeBox(百分比大小)", new FractionallySizeBoxPage()),
            getJumpItem("selectableText(可选择的文本)", new SelectableTextPage()),
            getJumpItem("slider(滑竿)", new SliderPage()),
            getJumpItem("alertDialog(提醒弹窗)", new AlertDialogPage()),
            getJumpItem(
                "animatedCrossFade(交叉淡入淡出)", new AnimatedCrossFadePage()),
            getJumpItem("draggableScrollableSheet(底部拖拽窗)",
                new DraggableScrollableSheetPage()),
            getJumpItem("colorFiltered(颜色混合)", new ColorFilteredPage()),
            getJumpItem("toggleButtons(选项框)", new ToggleButtonsPage()),
            getJumpItem("tweenAnimationBuilder(补间动画构建器)",
                new TweenAnimationBuilderPage()),
            getJumpItem("image(图片)", new ImagePage()),
            getJumpItem("tabBar(标签栏)", new TabBarPage()),
            getJumpItem("drawer(抽屉)", new DrawerPage()),
            getJumpItem(
                "listWheelScrollView(轮轴滚动列表)", new ListWheelScrollViewPage()),
            getJumpItem("shaderMask(遮罩)", new ShaderMaskPage()),
            // getJumpItem("builder", new BuilderPage())
            getJumpItem("progressIndicator(进度条)", new ProgressIndicatorPage()),
            getJumpItem("clipOval(裁剪椭圆型)", new ClipOvalPage()),
            getJumpItem(
                "checkBoxListTile(复选框列表item)", new CheckBoxListTilePage()),
            getJumpItem("sliverAppBar(列表滑动折叠)", new SliverAppBarPage()),
            getJumpItem(
                "interactiveViewer(手势放大缩小)", new InteractiveViewerPage()),
            getJumpItem("imageFiltered(高斯模糊)", new ImageFilteredPage()),
            getJumpItem("physicalModel(物理模型)", new PhysicalModelPage()),
            getJumpItem("pageView(viewPager)", new PageViewPage()),
            getJumpItem("html(富文本)", new HtmlPage()),
            getJumpItem("textSpan(扩展文本)", new TextSpanPage()),
            getJumpItem("customPaint(自定义Widget)", new CustomPaintPage()),
            getJumpItem("animation", new AnimationPage()),
            getJumpItem("animatedWidget(动画小部件)", new AnimatedWidgetPage()),
          ],
        ),
      ),
    );
  }

  Widget getJumpItem(String title, Widget jumpPage) {
    index++;
    return Card(
      color: index.isOdd ? oddItemColor : evenItemColor,
      child: ListTile(
        title: Text(title),
        // tileColor: index.isOdd ? oddItemColor : evenItemColor,
        onTap: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => jumpPage,
              ));
        },
      ),
    );
  }
}
