import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'dart:ui' as ui;

class Loading extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingState();
  }
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  int speed = 3;
  List<int> frames = [6, 4, 2, 4, 6, 4];
  List<int> frameList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    frameList.clear();
    int s = ((frames[0] - frames[1]) * 10 / speed).round();
    for (int i = 0; i < 2; i++) {
      for (int j = 0; j < speed; j++) {
        int max = frames[i] * 10 - s * j;
        frameList.add(max);
      }
    }
    frameList.add(frames[2] * 10);
    int size = frameList.length;
    for (int i = size - 2; i > 0; i--) {
      int v = frameList[i];
      frameList.add(v);
    }
    int size1 = frameList.length;
    for (int i = 0; i < size1; i++) {
      int v = frameList[i];
      frameList.add(v);
    }
    _controller = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    )..repeat();
  }

  @override
  void didUpdateWidget(covariant Loading oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller.view,
      builder: (BuildContext context, Widget child) {
        return _buildIndicator(context, _controller.value);
      },
    );
  }

  Widget _buildIndicator(BuildContext context, double value) {
    return Center(
      child: CustomPaint(
        size: Size(140, 50),
        foregroundPainter:
            LoadingPainter(frameList, speed, (_controller.value * 12).floor()),
      ),
    );
  }
}

class LoadingPainter extends CustomPainter {
  LoadingPainter(this.frameList, this.speed, this.progressDegree);

  Paint _paint = Paint()
    ..color = Colors.grey[500]
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..style = PaintingStyle.fill
    ..strokeWidth = 1.0;

  int progressDegree = 0;
  double vW = 2.5;
  double row_w = 3;
  int speed = 6;
  List<int> frames = [6, 4, 2, 4, 6, 4];
  List<int> frameList = [];

  @override
  void paint(Canvas canvas, Size size) {
    // canvas.drawRect(Rect.fromLTRB(0, 0, size.width, size.height), _paint);
    // canvas.drawLine(Offset(0, 0), Offset(size.width, size.height), _paint);
    // // 1-2 段落构造器并添加文本信息
    // ParagraphBuilder bulder = ParagraphBuilder(
    //     ParagraphStyle(fontSize: 14, fontStyle: FontStyle.normal))
    //   ..pushStyle(ui.TextStyle(color: Colors.black))
    //   ..addText("halo哈~");
    // // 3 设置段落容器宽度
    // ParagraphConstraints pc = ParagraphConstraints(width: size.width - 100);
    // // 4 计算文本位置及尺寸
    // Paragraph paragraph = bulder.build()..layout(pc);
    // // 5 文本绘制
    // canvas.drawParagraph(paragraph, Offset(50, 120));

    int width = 40;
    int height = 20;

    double vH = frameList[progressDegree] * vW / 10;
    fillRoundRect(canvas, (width) / 2 - vW / 2, (height) / 2 - vH / 2, vW, vH);
    double vH2 = frameList[progressDegree + 1 * speed] * vW / 10;
    fillRoundRect(canvas, (width) / 2 - vW / 2 - row_w * 2,
        (height) / 2 - vH2 / 2, vW, vH2);
    fillRoundRect(canvas, (width) / 2 - vW / 2 + row_w * 2,
        (height) / 2 - vH2 / 2, vW, vH2);
    double vH3 = frameList[progressDegree + 2 * speed] * vW / 10;
    fillRoundRect(canvas, (width) / 2 - vW / 2 - row_w * 4,
        (height) / 2 - vH3 / 2, vW, vH3);
    fillRoundRect(canvas, (width) / 2 - vW / 2 + row_w * 4,
        (height) / 2 - vH3 / 2, vW, vH3);

    // 1-2 段落构造器并添加文本信息
    ParagraphBuilder bulder = ParagraphBuilder(
        ParagraphStyle(fontSize: 14, fontStyle: FontStyle.normal))
      ..pushStyle(ui.TextStyle(color: Colors.grey[600]))
      ..addText("书友请稍等...");
    // 3 设置段落容器宽度
    ParagraphConstraints pc = ParagraphConstraints(width: 90);
    // 4 计算文本位置及尺寸
    Paragraph paragraph = bulder.build()..layout(pc);
    // 5 文本绘制
    canvas.drawParagraph(paragraph, Offset(45, 0));
  }

  @override
  bool shouldRepaint(covariant LoadingPainter oldDelegate) {
    return oldDelegate.progressDegree != progressDegree;
  }

  void fillRoundRect(
      Canvas canvas, double x, double y, double width, double height) {
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTRB(x, y, x + width, y + height), Radius.circular(5)),
        _paint);
  }
}
