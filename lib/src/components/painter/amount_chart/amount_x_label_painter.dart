import 'dart:ui';
import 'package:flutter/material.dart';

import '../../view_mode.dart';
import '../chart_engine.dart';

class AmountXLabelPainter extends ChartEngine {
  AmountXLabelPainter({
    required ScrollController scrollController,
    required this.scrollOffsetNotifier,
    required BuildContext context,
    required ViewMode viewMode,
    required DateTime firstValueDateTime,
    required int? dayCount,
    this.style,
    this.showLine = true
  }) : super(
          scrollController: scrollController,
          context: context,
          viewMode: viewMode,
          firstValueDateTime: firstValueDateTime,
          dayCount: dayCount,
          repaint: scrollOffsetNotifier,
        );

  final ValueNotifier<double> scrollOffsetNotifier;
  final TextStyle? style;
  final bool showLine;

  @override
  void paint(Canvas canvas, Size size) {
    setDefaultValue(size);
    drawXLabels(canvas, size, style: style, showLine: showLine);
  }

  @override
  List generateCoordinates(Size size) => [];

  @override
  void drawYLabels(Canvas canvas, Size size) {}

  @override
  void drawBar(Canvas canvas, Size size, List coordinates) {}

  @override
  bool shouldRepaint(covariant AmountXLabelPainter oldDelegate) {
    return true;
  }
}
