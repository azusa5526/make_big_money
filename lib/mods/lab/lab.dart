import 'package:flutter/material.dart';
import 'bar_chart_example_2.dart';
import 'bar_chart_example_4.dart';
import 'test_zoom.dart';

PlotData data = PlotData(dataList: [
  DataPoint(yValue: 8.56415915, xValue: '02/09 15:30'),
  DataPoint(yValue: 56.56415915, xValue: '02/09 16:30'),
  DataPoint(yValue: 72.56415915, xValue: '02/09 17:30'),
  DataPoint(yValue: 25.56415915, xValue: '02/09 18:30'),
  DataPoint(yValue: 71.56415915, xValue: '02/09 19:30'),
  DataPoint(yValue: 15.56415915, xValue: '02/09 20:30'),
], maxY: 100.0, minY: 0);

class LabPage extends StatelessWidget {
  const LabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LabPage')),
      body: Container(
        color: Colors.grey[200],
        child: LinePlot(
          plotData: data,
        ),
      ),
    );
  }
}
