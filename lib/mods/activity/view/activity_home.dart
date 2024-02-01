import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'activity_list_view.dart';

class ActivityHome extends StatelessWidget {
  const ActivityHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Activity Home')),
        body: SafeArea(
          child: Container(
              color: Colors.grey[100],
              padding: const EdgeInsets.all(12.0),
              child: const ActivityListView()),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pushNamed('add_activity');
          },
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ));
  }
}
