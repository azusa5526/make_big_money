import 'dart:math';

import 'package:flutter/material.dart';
import 'package:make_big_money/utils/console.dart';

class ZoomableChart extends StatefulWidget {
  const ZoomableChart({
    super.key,
    required this.maxX,
    required this.builder,
  });

  final double maxX;
  final Widget Function(double, double) builder;

  @override
  State<ZoomableChart> createState() => _ZoomableChartState();
}

class _ZoomableChartState extends State<ZoomableChart> {
  late double minX;
  late double maxX;

  late double lastMaxXValue;
  late double lastMinXValue;

  @override
  void initState() {
    initZoomChart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          minX = 0;
          maxX = widget.maxX;
        });
      },
      onScaleStart: (details) {
        lastMinXValue = minX;
        lastMaxXValue = maxX;
      },
      onScaleUpdate: (details) {
        var horizontalScale = details.scale;

        if (horizontalScale == 1.0) {
          // Horizontal move
          double horizontalDistance = details.focalPointDelta.dx;
          if (horizontalDistance == 0) return;
          var lastMinMaxDistance = max(lastMaxXValue - lastMinXValue, 0.0);

          setState(() {
            minX -= lastMinMaxDistance * 0.005 * horizontalDistance;
            maxX -= lastMinMaxDistance * 0.005 * horizontalDistance;

            if (minX < 0) {
              minX = 0;
              maxX = lastMinMaxDistance;
            }
            if (maxX > widget.maxX) {
              maxX = widget.maxX;
              minX = maxX - lastMinMaxDistance;
            }
          });
        } else {
          // Scale up/down
          var lastMinMaxDistance = max(lastMaxXValue - lastMinXValue, 0);
          var newMinMaxDistance = lastMinMaxDistance / horizontalScale;
          var distanceDifference = newMinMaxDistance - lastMinMaxDistance;
          setState(() {
            final newMinX = max(
              lastMinXValue - distanceDifference,
              0.0,
            );
            final newMaxX = min(
              lastMaxXValue + distanceDifference,
              widget.maxX,
            );

            // Zoom ratio control
            if (newMaxX - newMinX > 3) {
              minX = newMinX;
              maxX = newMaxX;
            }
          });
        }
      },
      child: widget.builder(minX, maxX),
    );
  }

  @override
  void didUpdateWidget(ZoomableChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.maxX != oldWidget.maxX) {
      initZoomChart();
    }
  }

  void initZoomChart() {
    minX = 0;
    maxX = widget.maxX;
  }
}
