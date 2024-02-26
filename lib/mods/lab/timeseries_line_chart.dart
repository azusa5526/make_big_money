import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:make_big_money/utils/console.dart';
import 'package:make_big_money/utils/after_layout.dart';
import 'zoomable_chart.dart';

const yAxisWidthOffset = 9.0;

class DataPoint {
  final num yValue;
  final dynamic xValue;

  DataPoint({required this.xValue, required this.yValue});
}

class TimeseriesLineChart extends StatefulWidget {
  const TimeseriesLineChart({super.key, required this.dataList});

  final List<DataPoint> dataList;

  @override
  State<TimeseriesLineChart> createState() => _TimeseriesLineChartState();
}

class _TimeseriesLineChartState extends State<TimeseriesLineChart> {
  late int calcXInterval;
  int xLabelWidth = 1;
  int xLabelHeight = 1;
  int yLabelWidth = 1;
  num maxLengthNumber = 0;
  int chartWidth = 0;
  late num maxY;
  late num minY;
  int temp = 10;

  @override
  void initState() {
    if (widget.dataList.isNotEmpty) {
      maxY = widget.dataList
          .map((dataPoint) => dataPoint.yValue)
          .reduce((maxValue, yValue) => maxValue > yValue ? maxValue : yValue);
      minY = widget.dataList
          .map((dataPoint) => dataPoint.yValue)
          .reduce((minValue, yValue) => minValue < yValue ? minValue : yValue);

      maxLengthNumber = getMaxLengthNumber(
          widget.dataList.map((dataPoint) => dataPoint.yValue).toList());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey[200],
          child: AspectRatio(
            aspectRatio: 21 / 10,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 0.0, right: 20.0, bottom: 8.0),
              child: ZoomableChart(
                maxX: widget.dataList.length - 1,
                builder: (minX, maxX) {
                  calcXInterval =
                      getInterval(maxX, minX, chartWidth, xLabelWidth);
                  return AfterLayout(
                    callback: (value) {
                      setState(() {
                        chartWidth = value.rect.width.toInt();
                        calcXInterval =
                            getInterval(maxX, minX, chartWidth, xLabelWidth);
                      });
                    },
                    child: LineChart(
                      LineChartData(
                        titlesData: FlTitlesData(
                          topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          rightTitles: const AxisTitles(
                              sideTitles: SideTitles(
                            showTitles: false,
                          )),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: calcXInterval.toDouble(),
                              getTitlesWidget: (value, meta) {
                                return getXAxisWidget(
                                    value, meta, widget.dataList);
                              },
                              reservedSize: 56,
                            ),
                          ),
                          leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                  // getTitlesWidget: (value, meta) {
                                  //   return getYAxisWidget(value, meta);
                                  // },
                                  showTitles: true,
                                  reservedSize:
                                      yLabelWidth + yAxisWidthOffset)),
                        ),
                        gridData: const FlGridData(
                          drawHorizontalLine: false,
                        ),
                        clipData: const FlClipData.all(),
                        minX: minX,
                        maxX: maxX,
                        lineTouchData: const LineTouchData(enabled: false),
                        lineBarsData: [
                          LineChartBarData(
                            spots: dataToFlSpot(widget.dataList),
                            isCurved: false,
                            barWidth: 2,
                            dotData: const FlDotData(
                              show: false,
                            ),
                          ),
                        ],
                        maxY: maxY + maxY * 0.1,
                        borderData: FlBorderData(
                          show: false,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        AfterLayout(
          callback: (value) {
            yLabelWidth = value.rect.width.ceil();
          },
          child: Text(
            maxLengthNumber.toStringAsFixed(1),
            style: const TextStyle(color: Colors.grey),
          ),
        )
      ],
    );
  }

  SideTitleWidget getXAxisWidget(
      double value, TitleMeta meta, List<DataPoint> dataList) {
    var index = value.toInt();
    Widget child;

    if (index < dataList.length && index >= 0) {
      List<String> parts = dataList[index].xValue.toString().split(' ');

      child = AfterLayout(
          callback: (value) {
            setState(() {
              xLabelWidth = value.rect.width.toInt();
              xLabelHeight = value.rect.height.toInt();
            });
          },
          child: Column(
            children: [
              Text(parts[0].substring(5)),
              Text(parts[1].substring(0, 5))
            ],
          ));
    } else {
      child = Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: child,
    );
  }

  // SideTitleWidget getYAxisWidget(double value, TitleMeta meta) {
  //   var index = value.toInt();
  //   Widget child;

  //   child = AfterLayout(
  //     callback: (value) {
  //       setState(() {
  //         yLabelWidth = value.rect.width.ceil();
  //         console('yLabelWidth $yLabelWidth');
  //       });
  //     },
  //     child: Text(index.toString()),
  //   );

  //   return SideTitleWidget(
  //     axisSide: meta.axisSide,
  //     child: child,
  //   );
  // }

  num getMaxLengthNumber(List<num> numbers) {
    int maxLength = 0;
    num maxLengthNumber = 0;

    for (final num number in numbers) {
      int length = number.toString().length;

      if (length > maxLength) {
        maxLength = length;
        maxLengthNumber = number;
      }
    }

    return maxLengthNumber;
  }

  List<FlSpot> dataToFlSpot(List<DataPoint> dataList) {
    List<FlSpot> flSpots = [];
    for (int i = 0; i < dataList.length; i++) {
      flSpots.add(FlSpot(i.toDouble(), dataList[i].yValue.toDouble()));
    }
    return flSpots;
  }

  int getInterval(double maxX, double minX, int chartWidth, int itemWidth) {
    var tempInterval = ((maxX - minX) /
        ((chartWidth - 20 - yLabelWidth - yAxisWidthOffset) /
            (itemWidth + 10)));
    return tempInterval > 1 ? tempInterval.ceil() : 1;
  }
}
