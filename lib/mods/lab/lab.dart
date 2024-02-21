import 'package:flutter/material.dart';
import 'bar_chart_example_2.dart';
import 'bar_chart_example_4.dart';
import 'zoomable_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'test_zoom.dart';

// PlotData data = PlotData(dataList: [
//   DataPoint(yValue: 8.56415915, xValue: '02/09 15:30'),
//   DataPoint(yValue: 56.56415915, xValue: '02/09 16:30'),
//   DataPoint(yValue: 72.56415915, xValue: '02/09 17:30'),
//   DataPoint(yValue: 25.56415915, xValue: '02/09 18:30'),
//   DataPoint(yValue: 71.56415915, xValue: '02/09 19:30'),
//   DataPoint(yValue: 15.56415915, xValue: '02/09 20:30'),
// ], maxY: 100.0, minY: 0);

List<DataPoint> dataList = [
  DataPoint(yValue: 8.56415915, xValue: '02/09 01:30'),
  DataPoint(yValue: 56.56415915, xValue: '02/09 02:30'),
  DataPoint(yValue: 72.56415915, xValue: '02/09 03:30'),
  DataPoint(yValue: 25.56415915, xValue: '02/09 04:30'),
  DataPoint(yValue: 71.56415915, xValue: '02/09 05:30'),
  DataPoint(yValue: 15.56415915, xValue: '02/09 06:30'),
  DataPoint(yValue: 25.56415915, xValue: '02/09 07:30'),
  DataPoint(yValue: 8.56415915, xValue: '02/09 08:30'),
  DataPoint(yValue: 56.56415915, xValue: '02/09 09:30'),
  DataPoint(yValue: 72.56415915, xValue: '02/09 10:30'),
];

List<FlSpot> dataToFlSpot(List<DataPoint> dataList) {
  List<FlSpot> flSpots = [];
  for (int i = 0; i < dataList.length; i++) {
    flSpots.add(FlSpot(i.toDouble(), dataList[i].yValue.toDouble()));
  }
  return flSpots;
}

class LabPage extends StatelessWidget {
  const LabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LabPage')),
      body: Container(
        color: Colors.grey[200],
        // child: LinePlot(
        //   plotData: data,
        // ),
        child: AspectRatio(
          aspectRatio: 21 / 9,
          child: ZoomableChart(
            maxX: 9,
            builder: (minX, maxX) {
              return LineChart(
                LineChartData(
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
              );
            },
          ),
        ),
      ),
    );
  }
}
