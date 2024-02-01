import 'package:flutter/material.dart';

class ActivityAdd extends StatelessWidget {
  const ActivityAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('New Page')),
        body: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              SingleChildScrollView(
                  child: Form(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        onSaved: (inputValue) {
                          // console('title inputValue', inputValue);
                        },
                        decoration: const InputDecoration(
                            label: Text('Activity name'),
                            border: InputBorder.none),
                      ),
                      DropdownMenu(
                        expandedInsets: EdgeInsets.zero,
                        width: MediaQuery.of(context).size.width,
                        initialSelection: ColorLabel.green,
                        inputDecorationTheme: const InputDecorationTheme(
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
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              )),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Material(
                    child: Ink(
                      decoration:
                          const BoxDecoration(color: Colors.amberAccent),
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
                  ))
            ],
          ),
        ));
  }
}

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
