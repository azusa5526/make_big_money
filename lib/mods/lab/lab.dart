import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:make_big_money/utils/console.dart';
import 'package:make_big_money/utils/after_layout.dart';
import 'zoomable_chart.dart';

class DataPoint {
  final num yValue;
  final dynamic xValue;

  DataPoint({required this.xValue, required this.yValue});
}

List<DataPoint> dataList = [
  DataPoint(yValue: 55.56415915, xValue: '2024-02-09 00:00:00'),
  DataPoint(yValue: 8.56415915, xValue: '2024-02-09 01:00:00'),
  DataPoint(yValue: 56.56415915, xValue: '2024-02-09 02:00:00'),
  DataPoint(yValue: 72.56415915, xValue: '2024-02-09 03:00:00'),
  DataPoint(yValue: 25.56415915, xValue: '2024-02-09 04:00:00'),
  DataPoint(yValue: 56.56415915, xValue: '2024-02-09 05:00:00'),
  DataPoint(yValue: 72.56415915, xValue: '2024-02-09 06:00:00'),
  DataPoint(yValue: 71.56415915, xValue: '2024-02-09 07:00:00'),
  DataPoint(yValue: 15.56415915, xValue: '2024-02-09 08:00:00'),
  DataPoint(yValue: 71.56415915, xValue: '2024-02-09 09:00:00'),
  DataPoint(yValue: 54.56415915, xValue: '2024-02-09 10:00:00'),
  DataPoint(yValue: 25.56415915, xValue: '2024-02-09 11:00:00'),
  DataPoint(yValue: 8.56415915, xValue: '2024-02-09 12:00:00'),
  DataPoint(yValue: 56.56415915, xValue: '2024-02-09 13:00:00'),
  DataPoint(yValue: 72.56415915, xValue: '2024-02-09 14:00:00'),
  DataPoint(yValue: 8.56415915, xValue: '2024-02-09 15:00:00'),
  DataPoint(yValue: 56.56415915, xValue: '2024-02-09 16:00:00'),
  DataPoint(yValue: 72.56415915, xValue: '2024-02-09 17:00:00'),
  DataPoint(yValue: 10.56415915, xValue: '2024-02-09 18:00:00'),
  DataPoint(yValue: 56.56415915, xValue: '2024-02-09 19:00:00'),
  DataPoint(yValue: 66.56415915, xValue: '2024-02-09 20:00:00'),
  DataPoint(yValue: 71.56415915, xValue: '2024-02-09 21:00:00'),
  DataPoint(yValue: 15.56415915, xValue: '2024-02-09 22:00:00'),
  DataPoint(yValue: 71.56415915, xValue: '2024-02-09 23:00:00'),
];

List<FlSpot> dataToFlSpot(List<DataPoint> dataList) {
  List<FlSpot> flSpots = [];
  for (int i = 0; i < dataList.length; i++) {
    flSpots.add(FlSpot(i.toDouble(), dataList[i].yValue.toDouble()));
  }
  return flSpots;
}

class LabPage extends StatefulWidget {
  const LabPage({super.key});

  @override
  State<LabPage> createState() => _LabPageState();
}

class _LabPageState extends State<LabPage> {
  int itemWidth = 0;
  int calcInterval = 1;
  int chartWidth = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(calcInterval.toString())),
      body: Container(
        color: Colors.grey[200],
        child: AspectRatio(
          aspectRatio: 21 / 10,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 16.0, left: 20.0, right: 20.0, bottom: 8.0),
            child: ZoomableChart(
              maxX: dataList.length - 1,
              builder: (minX, maxX) {
                console('maxX $maxX, minX $minX');
                calcInterval = getInterval(maxX, minX, chartWidth);
                return AfterLayout(
                  callback: (value) {
                    setState(() {
                      chartWidth = value.rect.width.toInt();
                      calcInterval = getInterval(maxX, minX, chartWidth);
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
                            interval: calcInterval.toDouble(),
                            getTitlesWidget: (value, meta) {
                              return getXAxisWidget(value, meta, dataList);
                            },
                            reservedSize: 56,
                          ),
                        ),
                        leftTitles: const AxisTitles(
                            sideTitles: SideTitles(
                          showTitles: false,
                        )),
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
                          spots: dataToFlSpot(dataList),
                          isCurved: false,
                          barWidth: 2,
                          dotData: const FlDotData(
                            show: false,
                          ),
                        ),
                      ],
                      minY: 1,
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
            console('itemWidth ${value.rect.width.toInt()}');
            setState(() {
              itemWidth = value.rect.width.toInt();
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

  int getInterval(double maxX, double minX, int chartWidth) {
    var tempInterval = ((maxX - minX) / ((chartWidth - 40) / (itemWidth + 0)));
    return tempInterval > 1 ? tempInterval.ceil() : 1;
  }
}
