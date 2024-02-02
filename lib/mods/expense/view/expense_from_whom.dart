import 'package:flutter/material.dart';
import 'package:flutter_iflood/utils/console.dart';

class ExpenseFromWhom extends StatefulWidget {
  const ExpenseFromWhom({super.key});

  @override
  State<ExpenseFromWhom> createState() => _ExpenseFromWhomState();
}

class _ExpenseFromWhomState extends State<ExpenseFromWhom> {
  List<bool> list = [
    true,
    false,
    true,
    true,
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('123456'),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return FromWhomItem(
                  index: index,
                  onChanged: (index, isChecked) {
                    list[index] = isChecked;
                  },
                );
              },
              itemCount: list.length,
            ),
          ],
        ),
      ),
    );
  }
}

class FromWhomItem extends StatefulWidget {
  const FromWhomItem({super.key, required this.index, required this.onChanged});

  final void Function(int, bool) onChanged;
  final int index;

  @override
  State<FromWhomItem> createState() => _FromWhomItemState();
}

class _FromWhomItemState extends State<FromWhomItem> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isChecked,
      onChanged: (checked) {
        console(checked);
        setState(() {
          if (checked is bool) {
            isChecked = checked;
            widget.onChanged(widget.index, checked);
          }
        });
      },
      title: Text('${widget.index}'),
    );
  }
}
