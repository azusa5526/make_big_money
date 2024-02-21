import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:make_big_money/utils/console.dart';

const style = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.blueAccent,
  fontFamily: 'Digital',
  fontSize: 18,
);

class DataPoint {
  final num yValue;
  final dynamic xValue;

  DataPoint({required this.xValue, required this.yValue});
}

class PlotData {
  List<DataPoint> dataList;
  double maxY;
  double minY;
  double maxX;
  double minX;
  PlotData(
      {required this.dataList,
      required this.maxY,
      required this.minY,
      this.minX = 0,
      this.maxX = 0}) {
    maxX = dataList.length.toDouble();
  }
}

class LinePlot extends StatefulWidget {
  final PlotData plotData;
  const LinePlot({required this.plotData, super.key});

  @override
  _LinePlotState createState() => _LinePlotState();
}

class _LinePlotState extends State<LinePlot> {
  late double _previousScale;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: (ScaleStartDetails details) {
        _previousScale = widget.plotData.maxX;
      },
      onScaleUpdate: (ScaleUpdateDetails details) {
        if (details.scale != 1.0) {
          setState(() {
            if (_previousScale * details.scale <
                widget.plotData.dataList.length) {
              widget.plotData.maxX = _previousScale * details.scale;
            }
          });
        } else {
          setState(() {
            double primDelta = details.focalPointDelta.dx;
            if (primDelta.isNegative) {
              if (widget.plotData.maxX < widget.plotData.dataList.length) {
                widget.plotData.minX += _previousScale * 0.005;
                widget.plotData.maxX += _previousScale * 0.005;
              }
            } else {
              if (widget.plotData.minX > -1) {
                widget.plotData.minX -= _previousScale * 0.005;
                widget.plotData.maxX -= _previousScale * 0.005;
              }
            }
          });
        }
      },
      onDoubleTap: () {
        setState(() {
          widget.plotData.minX = 0;
          widget.plotData.maxX = widget.plotData.dataList.length.toDouble() - 1;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: LineChart(
          LineChartData(
              titlesData: FlTitlesData(
                topTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      return getXAxisWidget(
                          value, meta, widget.plotData.dataList);
                    },
                    reservedSize: 30,
                  ),
                ),
              ),
              minX: widget.plotData.minX,
              maxX: widget.plotData.maxX,
              maxY: widget.plotData.maxY + widget.plotData.maxY * 0.1,
              gridData: const FlGridData(
                drawHorizontalLine: false,
              ),
              clipData: const FlClipData.all(),
              lineBarsData: [
                LineChartBarData(
                    barWidth: 1,
                    dotData: const FlDotData(
                      show: true,
                    ),
                    spots: dataToFlSpot(widget.plotData.dataList)),
              ],
              lineTouchData: const LineTouchData(enabled: false)),
        ),
      ),
    );
  }
}

List<FlSpot> dataToFlSpot(List<DataPoint> dataList) {
  List<FlSpot> flSpots = [];
  for (int i = 0; i < dataList.length; i++) {
    flSpots.add(FlSpot(i.toDouble(), dataList[i].yValue.toDouble()));
  }
  return flSpots;
}

SideTitleWidget getXAxisWidget(
    double value, TitleMeta meta, List<DataPoint> dataList) {
  var index = value.toInt();
  Widget child;

  if (index < dataList.length && index >= 0) {
    child = Text(dataList[index].xValue.toString(),
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
        ));
  } else {
    child = Container();
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: child,
  );
}
