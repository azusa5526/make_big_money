import 'package:flutter/material.dart';
import 'activity_theme_selector.dart';

class ActivityEdit extends StatelessWidget {
  const ActivityEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Edit')),
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
                      const ActivityThemeSelector(),
                      ListTile(
                        onTap: () {},
                        title: const Text(
                          'Delete activity',
                          style: TextStyle(color: Colors.red),
                        ),
                      )
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
