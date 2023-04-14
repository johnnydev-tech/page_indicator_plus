// ignore_for_file: avoid_renaming_method_parameters

import 'package:flutter/material.dart';
import 'package:page_indicator_plus/src/painter.dart';

import 'enum/page_indicator_layout_type.dart';

class _PageIndicatorState extends State<PageIndicator> {
  int index = 0;
  final Paint _paint = Paint();

  BasePainter _createPainer() {
    switch (widget.layout) {
      case PageIndicatorLayout.NONE:
        return NonePainter(
            widget, widget.controller.page ?? 0.0, index, _paint);
      case PageIndicatorLayout.SLIDE:
        return SlidePainter(
            widget, widget.controller.page ?? 0.0, index, _paint);
      case PageIndicatorLayout.WARM:
        return WarmPainter(
            widget, widget.controller.page ?? 0.0, index, _paint);
      case PageIndicatorLayout.COLOR:
        return ColorPainter(
            widget, widget.controller.page ?? 0.0, index, _paint);
      case PageIndicatorLayout.SCALE:
        return ScalePainter(
            widget, widget.controller.page ?? 0.0, index, _paint);
      case PageIndicatorLayout.DROP:
        return DropPainter(
            widget, widget.controller.page ?? 0.0, index, _paint);
      default:
        throw Exception("Not a valid layout");
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child = SizedBox(
      width: widget.count * widget.size + (widget.count - 1) * widget.space,
      height: widget.size,
      child: CustomPaint(
        painter: _createPainer(),
      ),
    );

    if (widget.layout == PageIndicatorLayout.SCALE ||
        widget.layout == PageIndicatorLayout.COLOR) {
      child = ClipRect(
        child: child,
      );
    }

    return IgnorePointer(
      child: child,
    );
  }

  void _onController() {
    double page = widget.controller.page ?? 0.0;
    index = page.floor();

    setState(() {});
  }

  @override
  void initState() {
    widget.controller.addListener(_onController);
    super.initState();
  }

  @override
  void didUpdateWidget(PageIndicator oldWidget) {
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller.removeListener(_onController);
      widget.controller.addListener(_onController);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onController);
    super.dispose();
  }
}

class PageIndicator extends StatefulWidget {
  /// size of the dots
  final double size;

  /// space between dots.
  final double space;

  /// count of dots
  final int count;

  /// active color
  final Color activeColor;

  /// normal color
  final Color color;

  /// layout of the dots,default is [PageIndicatorLayout.SLIDE]
  final PageIndicatorLayout layout;

  // Only valid when layout==PageIndicatorLayout.scale
  final double scale;

  // Only valid when layout==[PageIndicatorLayout.DROP]
  final double dropHeight;

  final PageController controller;

  const PageIndicator({
    Key? key,
    required this.controller,
    required this.count,
    this.size = 20.0,
    this.layout = PageIndicatorLayout.SLIDE,
    this.color = Colors.grey,
    this.activeColor = Colors.blue,
    this.scale = 0.6,
    this.space = 5.0,
    this.dropHeight = 20.0,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PageIndicatorState();
  }
}
