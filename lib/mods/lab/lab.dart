import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:make_big_money/utils/console.dart';

import 'timeseries_line_chart.dart';

List<DataPoint> dataList = [
  DataPoint(yValue: 55.56415915, xValue: '2024-02-09 00:00:00'),
  DataPoint(yValue: 8.56415915, xValue: '2024-02-09 01:00:00'),
  DataPoint(yValue: -600.56415915, xValue: '2024-02-09 02:00:00'),
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

List<DataPoint> dataList2 = [
  DataPoint(yValue: 56.56415915, xValue: '2024-02-09 13:00:00'),
  DataPoint(yValue: 72.56415915, xValue: '2024-02-09 14:00:00'),
  DataPoint(yValue: 8.56415915, xValue: '2024-02-09 15:00:00'),
  DataPoint(yValue: 56.56415915, xValue: '2024-02-09 16:00:00'),
  DataPoint(yValue: 72.56415915, xValue: '2024-02-09 17:00:00'),
  DataPoint(yValue: 10.56415915, xValue: '2024-02-09 18:00:00'),
];

class LabPage extends StatefulWidget {
  const LabPage({super.key});

  @override
  State<LabPage> createState() => _LabPageState();
}

class _LabPageState extends State<LabPage> {
  var data = dataList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Lab')),
        body: Column(
          children: [
            TimeseriesLineChart(dataList: data),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  data = dataList2;
                });
              },
              icon: const Icon(Icons.bug_report),
              label: const Text('測試'),
            ),
          ],
        ));
  }
}
