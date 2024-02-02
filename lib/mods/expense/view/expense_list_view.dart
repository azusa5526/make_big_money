import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_iflood/utils/console.dart';
import 'package:go_router/go_router.dart';

class ExpenseListView extends StatefulWidget {
  const ExpenseListView({super.key});

  @override
  State<ExpenseListView> createState() => _ExpenseListViewState();
}

class _ExpenseListViewState extends State<ExpenseListView> {
  final List<int> _items = List<int>.generate(3, (int index) => index);

  @override
  Widget build(BuildContext context) {
    final List<Card> cards = <Card>[
      for (int index = 0; index < _items.length; index += 1)
        Card(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          key: Key('$index'),
          child: Ink(
            decoration: const BoxDecoration(color: Colors.white),
            child: InkWell(
              onTap: () {
                context.push('/expense/edit');
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                height: 68,
                // color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Card ${_items[index]}'),
                  ],
                ),
              ),
            ),
          ),
        ),
    ];

    return ListView.builder(
      itemBuilder: (context, index) {
        return cards[index];
      },
      itemCount: 3,
    );
  }
}
