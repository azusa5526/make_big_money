import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../expense/view/expense_list_view.dart';

class Activity extends StatelessWidget {
  const Activity({super.key, required this.activityId});

  final String activityId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Activity')),
        body: Container(
          color: Colors.grey[100],
          padding: EdgeInsets.all(12.0),
          child: ExpenseListView(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pushNamed('expense_add');
          },
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ));
  }
}
