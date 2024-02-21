import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:make_big_money/utils/console.dart';
import 'package:go_router/go_router.dart';

class ActivityListView extends StatefulWidget {
  const ActivityListView({super.key});

  @override
  State<ActivityListView> createState() => _ActivityListViewState();
}

class _ActivityListViewState extends State<ActivityListView> {
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
                // Todo: check activityId is valid & chage route
                context.push('/activity/$index');
              },
              onLongPress: () {
                context.pushNamed('activity_edit');
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                height: 68,
                // color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Card ${_items[index]}'),
                    ReorderableDragStartListener(
                        index: index,
                        child: const Icon(Icons.reorder_outlined)),
                  ],
                ),
              ),
            ),
          ),
        ),
    ];

    Widget proxyDecorator(
        Widget child, int index, Animation<double> animation) {
      return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          final double animValue = Curves.easeInOut.transform(animation.value);
          final double elevation = lerpDouble(1, 6, animValue)!;
          final double scale = lerpDouble(1, 1.05, animValue)!;
          const shape = RoundedRectangleBorder(borderRadius: BorderRadius.zero);
          return Transform.scale(
            scale: scale,
            // Create a Card based on the color and the content of the dragged one
            // and set its elevation to the animated value.
            child: Card(
              elevation: elevation,
              shape: shape,
              color: cards[index].color,
              child: cards[index].child,
            ),
          );
        },
        child: child,
      );
    }

    return ReorderableListView(
      buildDefaultDragHandles: false,
      proxyDecorator: proxyDecorator,
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final int item = _items.removeAt(oldIndex);
          _items.insert(newIndex, item);
        });
      },
      children: cards,
    );
  }
}
