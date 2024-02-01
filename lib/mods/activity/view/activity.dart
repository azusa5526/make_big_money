import 'package:flutter/material.dart';
import 'activity_list_view.dart';

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Activity')),
        body: SafeArea(
          child: Container(
              color: Colors.grey[100],
              padding: const EdgeInsets.all(12.0),
              child: const ActivityListView()),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ));
  }
}
