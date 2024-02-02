import 'package:flutter/material.dart';
import 'expense_from_whom.dart';

enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Orange', Colors.orange),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;
}

class ExpenseAdd extends StatelessWidget {
  const ExpenseAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Expense Add')),
        body: Container(
          color: Colors.grey[100],
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Form(
                      child: Column(
                        children: [
                          Card(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Purpose'),
                                    Row(
                                      children: [
                                        const CategoryPopMenu(), // Add some spacing between CategoryPopMenu and TextFormField
                                        Expanded(
                                          child: TextFormField(
                                            autofocus: true,
                                            onSaved: (inputValue) {
                                              // console('title inputValue', inputValue);
                                            },
                                            decoration: InputDecoration(
                                              hintText: 'Expense name',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[500]),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                          Card(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Pay by'),
                                    DropdownMenu(
                                        expandedInsets: EdgeInsets.zero,
                                        // width: MediaQuery.of(context).size.width,
                                        initialSelection: ColorLabel.green,
                                        inputDecorationTheme:
                                            const InputDecorationTheme(
                                                border: InputBorder.none),
                                        onSelected: (ColorLabel? color) {},
                                        dropdownMenuEntries: ColorLabel.values
                                            .map<DropdownMenuEntry<ColorLabel>>(
                                                (ColorLabel color) {
                                          return DropdownMenuEntry<ColorLabel>(
                                            value: color,
                                            label: color.label,
                                            enabled: color.label != 'Grey',
                                            style: MenuItemButton.styleFrom(
                                              foregroundColor: color.color,
                                            ),
                                          );
                                        }).toList())
                                  ]),
                            ),
                          ),
                          const ExpenseFromWhom(),
                          Card(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Datetime'),
                                    Row(
                                      children: [
                                        const CategoryPopMenu(), // Add some spacing between CategoryPopMenu and TextFormField
                                        Expanded(
                                          child: TextFormField(
                                            autofocus: true,
                                            onSaved: (inputValue) {
                                              // console('title inputValue', inputValue);
                                            },
                                            decoration: InputDecoration(
                                              hintText: 'Expense name',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[500]),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
              ),
              Material(
                child: Ink(
                  decoration: const BoxDecoration(color: Colors.amberAccent),
                  child: InkWell(
                    onTap: () {},
                    child: const SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: Center(
                            child: Text(
                          'Save',
                          style: TextStyle(fontSize: 16.0),
                        ))),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

enum SampleItem { itemOne, itemTwo, itemThree }

class CategoryPopMenu extends StatefulWidget {
  const CategoryPopMenu({super.key});

  @override
  State<CategoryPopMenu> createState() => _CategoryPopMenuState();
}

class _CategoryPopMenuState extends State<CategoryPopMenu> {
  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SampleItem>(
      icon: const Icon(Icons.format_list_bulleted_outlined),
      initialValue: selectedMenu,
      // Callback that sets the selected popup menu item.
      onSelected: (SampleItem item) {
        setState(() {
          selectedMenu = item;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemOne,
          child: Text('Item 1'),
        ),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemTwo,
          child: Text('Item 2'),
        ),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemThree,
          child: Text('Item 3'),
        ),
      ],
    );
  }
}
