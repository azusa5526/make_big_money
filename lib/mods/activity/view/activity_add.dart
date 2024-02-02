import 'package:flutter/material.dart';
import 'activity_theme_selector.dart';

class ActivityAdd extends StatelessWidget {
  const ActivityAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Add')),
        body: SizedBox(
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                    child: Form(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextFormField(
                          autofocus: true,
                          onSaved: (inputValue) {
                            // console('title inputValue', inputValue);
                          },
                          decoration: const InputDecoration(
                              label: Text('Activity name'),
                              border: InputBorder.none),
                        ),
                        const ActivityThemeSelector(),
                      ],
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
