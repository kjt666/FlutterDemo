import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientCircularProgressIndicator extends StatefulWidget {
  const GradientCircularProgressIndicator(
      {Key? key,
      required this.radius,
      required this.colors,
      this.strokeWidth = 2.0,
      this.stops,
      this.strokeCapRound = false,
      this.backgroundColor = const Color(0xFFEEEEEE),
      this.totalAngle = 2 * pi,
      this.fromValue = 0,
      this.toValue = 1,
      this.image})
      : super(key: key);

  final ImageProvider? image;

  ///粗细
  final double strokeWidth;

  /// 圆的半径
  final double radius;

  ///两端是否为圆角
  final bool strokeCapRound;

  /// 起始进度，取值范围 >0.0
  final double fromValue;

  /// 终点进度，取值范围 >0.0
  final double toValue;

  /// 进度条背景色
  final Color backgroundColor;

  /// 进度条的总弧度，2*PI为整圆，小于2*PI则不是整圆
  final double totalAngle;

  /// 渐变色数组
  final List<Color> colors;

  /// 渐变色的终止点，对应colors属性
  final List<double>? stops;

  @override
  State<StatefulWidget> createState() {
    return AState();
  }
}

class AState extends State<GradientCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  ui.Image? image;
  double _offset = .0;
  var _colors;
  late CurvedAnimation curve;
  late Animation<double> tween;
  double value=0;

  @override
  void initState() {
    super.initState();
    if (widget.image != null) {
      loadImage();
    }
    // 如果两端为圆角，则需要对起始位置进行调整，否则圆角部分会偏离起始位置
    // 下面调整的角度的计算公式是通过数学几何知识得出，读者有兴趣可以研究一下为什么是这样
    if (widget.strokeCapRound) {
      _offset =
          asin(widget.strokeWidth / (widget.radius * 2 - widget.strokeWidth));
    }
    _colors = widget.colors;
    if (_colors == null) {
      Color color = Theme.of(context).colorScheme.secondary;
      _colors = [color, color];
    }
    _controller =
        AnimationController(duration: Duration(milliseconds: 800), vsync: this);
    curve = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    tween = Tween(begin: widget.fromValue, end: widget.toValue).animate(curve)..addListener(() {
      value = tween.value;
    });
    // _controller..forward(from: 0);
    Future.delayed(Duration(milliseconds: 300), () async {
      _controller..forward(from: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller.view,
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: -pi / 2.0 - _offset,
          child: CustomPaint(
            size: Size.fromRadius(widget.radius),
            painter: _GradientCircularProgressPainter(
                strokeWidth: widget.strokeWidth,
                strokeCapRound: widget.strokeCapRound,
                backgroundColor: widget.backgroundColor,
                image: image,
                value: value,
                total: widget.totalAngle,
                radius: widget.radius,
                colors: _colors,
                stops: widget.stops),
          ),
        );
      },
    );
  }

  Future<void> loadImage() async {
    image = await _loadImageByProvider(widget.image!,
        config: ImageConfiguration(size: Size(10.w, 10.w)));
    setState(() {});
  }

  Future<ui.Image> _loadImageByProvider(ImageProvider provider,
      {ImageConfiguration config = ImageConfiguration.empty}) async {
    Completer<ui.Image> completer = Completer<ui.Image>();
    late ImageStreamListener listener;
    ImageStream stream = provider.resolve(config);
    listener = ImageStreamListener((ImageInfo frame, bool sync) {
      final ui.Image image = frame.image;
      completer.complete(image);
      stream.removeListener(listener);
    });
    stream.addListener(listener);
    return completer.future;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

//实现画笔
class _GradientCircularProgressPainter extends CustomPainter {
  _GradientCircularProgressPainter(
      {required this.colors,
      this.strokeWidth = 10.0,
      this.strokeCapRound = false,
      this.backgroundColor = const Color(0xFFEEEEEE),
      this.radius,
      this.total = 2 * pi,
      this.stops,
      this.value,
      this.image});

  final double strokeWidth;
  final bool strokeCapRound;
  final double? value;
  final Color backgroundColor;
  final List<Color> colors;
  final double total;
  final double? radius;
  final List<double>? stops;
  final ui.Image? image;

  @override
  void paint(Canvas canvas, Size size) {
    if (radius != null) {
      size = Size.fromRadius(radius!);
    }
    print("aaaaaaaaaaaaa => ${value}");
    double _offset = strokeWidth / 2.0;
    double _value = (value ?? .0);
    double _angle = _value /*.clamp(.0, 1.0)*/ * total;
    double _start = .0;

    if (strokeCapRound) {
      _start = asin(strokeWidth / (size.width - strokeWidth));
    }

    Rect rect = Offset(_offset, _offset) &
        Size(size.width - strokeWidth, size.height - strokeWidth);

    var paint = Paint()
      ..strokeCap = strokeCapRound ? StrokeCap.round : StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth;

    // 先画背景
    if (backgroundColor != Colors.transparent) {
      paint.color = backgroundColor;
      canvas.drawArc(rect, _start, total, false, paint);
    }

    // 再画前景，应用渐变
    if (_value >= 0 && _value < 1) {
      paint.color = Colors.white;
      paint.shader = SweepGradient(
        startAngle: 0.0,
        endAngle: _angle,
        colors: colors,
        stops: stops,
      ).createShader(rect);

      canvas.drawArc(rect, _start, _angle, false, paint);
    } else {
      print("image = null?======> ${image == null}");
      if (image != null) {
        paint.color = Colors.white;
        // canvas.drawImage(image!, Offset.zero, paint);
        var src = Rect.fromLTWH(0, 0, image?.width.toDouble() ?? size.width,
            image?.height.toDouble() ?? size.height);
        var dst = Rect.fromLTWH(0, 0, size.width, size.height);

        Matrix4 m4 = Matrix4.identity();
        Matrix4 moveCenter = Matrix4.translationValues(45.w, 45.w, 0);
        Matrix4 moveBack = Matrix4.translationValues(-45.w, -45.w, 0);

        Matrix4 rotate90 = Matrix4.rotationZ(2 * pi * (_value - 1) + pi * 0.5);
        rotate90 = moveCenter.multiplied(rotate90).multiplied(moveBack);
        m4.multiply(rotate90);

        canvas.transform(m4.storage);
        canvas.drawImageRect(image!, src, dst, paint);
      }
    }
  }

  //简单返回true，实践中应该根据画笔属性是否变化来确定返回true还是false
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
