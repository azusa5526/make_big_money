import 'package:flutter/material.dart';

class Activity extends StatelessWidget {
  const Activity({super.key, required this.activityId});

  final String activityId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Activity')),
      body: Text(activityId),
    );
  }
}
