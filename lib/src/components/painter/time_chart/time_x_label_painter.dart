import 'dart:ui';
import 'package:flutter/material.dart';

import '../../view_mode.dart';
import '../chart_engine.dart';

class TimeXLabelPainter extends ChartEngine {
  TimeXLabelPainter({
    required ScrollController scrollController,
    required this.scrollOffsetNotifier,
    required BuildContext context,
    required ViewMode viewMode,
    required DateTime firstValueDateTime,
    required int? dayCount,
    required this.firstDataHasChanged,
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
  final bool firstDataHasChanged;
  final TextStyle? style;
  final bool showLine;

  @override
  void paint(Canvas canvas, Size size) {
    setDefaultValue(size);
    drawXLabels(canvas, size, firstDataHasChanged: firstDataHasChanged, style: style, showLine: showLine);
  }

  @override
  List generateCoordinates(Size size) => [];

  @override
  void drawYLabels(Canvas canvas, Size size) {}

  @override
  void drawBar(Canvas canvas, Size size, List coordinates) {}

  @override
  bool shouldRepaint(covariant TimeXLabelPainter oldDelegate) {
    return true;
  }
}
