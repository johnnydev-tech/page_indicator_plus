// ignore_for_file: avoid_renaming_method_parameters

import 'package:flutter/material.dart';

import 'package:page_indicator_plus/src/page_indicator.dart';

class WarmPainter extends BasePainter {
  WarmPainter(PageIndicator widget, double page, int index, Paint paint) : super(widget, page, index, paint);

  @override
  void draw(Canvas canvas, double space, double size, double radius) {
    double progress = page - index;
    double distance = size + space;
    double start = index * (size + space);

    if (progress > 0.5) {
      double right = start + size + distance;

      double left = index * distance + distance * (progress - 0.5) * 2;
      canvas.drawRRect(RRect.fromLTRBR(left, 0.0, right, size, Radius.circular(radius)), _paint);
    } else {
      double right = start + size + distance * progress * 2;

      canvas.drawRRect(RRect.fromLTRBR(start, 0.0, right, size, Radius.circular(radius)), _paint);
    }
  }
}

class DropPainter extends BasePainter {
  DropPainter(PageIndicator widget, double page, int index, Paint paint) : super(widget, page, index, paint);

  @override
  void draw(Canvas canvas, double space, double size, double radius) {
    double progress = page - index;
    double dropHeight = widget.dropHeight;
    double rate = (0.5 - progress).abs() * 2;
    double scale = widget.scale;

    canvas.drawCircle(Offset(radius + ((page) * (size + space)), radius - dropHeight * (1 - rate)), radius * (scale + rate * (1.0 - scale)), _paint);
  }
}

class NonePainter extends BasePainter {
  NonePainter(PageIndicator widget, double page, int index, Paint paint) : super(widget, page, index, paint);

  @override
  void draw(Canvas canvas, double space, double size, double radius) {
    double progress = page - index;
    double secondOffset = index == widget.count - 1 ? radius : radius + ((index + 1) * (size + space));

    if (progress > 0.5) {
      canvas.drawCircle(Offset(secondOffset, radius), radius, _paint);
    } else {
      canvas.drawCircle(Offset(radius + (index * (size + space)), radius), radius, _paint);
    }
  }
}

class SlidePainter extends BasePainter {
  SlidePainter(PageIndicator widget, double page, int index, Paint paint) : super(widget, page, index, paint);

  @override
  void draw(Canvas canvas, double space, double size, double radius) {
    canvas.drawCircle(Offset(radius + (page * (size + space)), radius), radius, _paint);
  }
}

class ScalePainter extends BasePainter {
  ScalePainter(PageIndicator widget, double page, int index, Paint paint) : super(widget, page, index, paint);

  @override
  bool _shouldSkip(int i) {
    if (index == widget.count - 1) {
      return i == 0 || i == index;
    }
    return (i == index || i == index + 1);
  }

  @override
  void paint(Canvas canvas, Size size) {
    _paint.color = widget.color;
    double space = widget.space;
    double size = widget.size;
    double radius = size / 2;
    for (int i = 0, c = widget.count; i < c; ++i) {
      if (_shouldSkip(i)) {
        continue;
      }
      canvas.drawCircle(Offset(i * (size + space) + radius, radius), radius * widget.scale, _paint);
    }

    _paint.color = widget.activeColor;
    draw(canvas, space, size, radius);
  }

  @override
  void draw(Canvas canvas, double space, double size, double radius) {
    double secondOffset = index == widget.count - 1 ? radius : radius + ((index + 1) * (size + space));

    double progress = page - index;
    _paint.color = Color.lerp(widget.activeColor, widget.color, progress)!;
    canvas.drawCircle(Offset(radius + (index * (size + space)), radius), lerp(radius, radius * widget.scale, progress), _paint);
    _paint.color = Color.lerp(widget.color, widget.activeColor, progress)!;
    canvas.drawCircle(Offset(secondOffset, radius), lerp(radius * widget.scale, radius, progress), _paint);
  }
}

class ColorPainter extends BasePainter {
  ColorPainter(PageIndicator widget, double page, int index, Paint paint) : super(widget, page, index, paint);

  @override
  bool _shouldSkip(int i) {
    if (index == widget.count - 1) {
      return i == 0 || i == index;
    }
    return (i == index || i == index + 1);
  }

  @override
  void draw(Canvas canvas, double space, double size, double radius) {
    double progress = page - index;
    double secondOffset = index == widget.count - 1 ? radius : radius + ((index + 1) * (size + space));

    _paint.color = Color.lerp(widget.activeColor, widget.color, progress)!;
    canvas.drawCircle(Offset(radius + (index * (size + space)), radius), radius, _paint);
    _paint.color = Color.lerp(widget.color, widget.activeColor, progress)!;
    canvas.drawCircle(Offset(secondOffset, radius), radius, _paint);
  }
}

abstract class BasePainter extends CustomPainter {
  final PageIndicator widget;
  final double page;
  final int index;
  final Paint _paint;

  double lerp(double begin, double end, double progress) {
    return begin + (end - begin) * progress;
  }

  BasePainter(this.widget, this.page, this.index, this._paint);

  void draw(Canvas canvas, double space, double size, double radius);

  bool _shouldSkip(int index) {
    return false;
  }

  @override
  void paint(Canvas canvas, Size size) {
    _paint.color = widget.color;
    double space = widget.space;
    double size = widget.size;
    double radius = size / 2;
    for (int i = 0, c = widget.count; i < c; ++i) {
      if (_shouldSkip(i)) {
        continue;
      }
      canvas.drawCircle(Offset(i * (size + space) + radius, radius), radius, _paint);
    }

    double page = this.page;
    if (page < index) {
      page = 0.0;
    }
    _paint.color = widget.activeColor;
    draw(canvas, space, size, radius);
  }

  @override
  bool shouldRepaint(BasePainter oldDelegate) {
    return oldDelegate.page != page;
  }
}
