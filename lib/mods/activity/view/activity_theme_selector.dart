import 'package:flutter/material.dart';

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

class ActivityThemeSelector extends StatefulWidget {
  const ActivityThemeSelector({super.key});

  @override
  State<ActivityThemeSelector> createState() => _ActivityThemeSelectorState();
}

class _ActivityThemeSelectorState extends State<ActivityThemeSelector> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        expandedInsets: EdgeInsets.zero,
        width: MediaQuery.of(context).size.width,
        initialSelection: ColorLabel.green,
        inputDecorationTheme:
            const InputDecorationTheme(border: InputBorder.none),
        onSelected: (ColorLabel? color) {},
        dropdownMenuEntries: ColorLabel.values
            .map<DropdownMenuEntry<ColorLabel>>((ColorLabel color) {
          return DropdownMenuEntry<ColorLabel>(
            value: color,
            label: color.label,
            enabled: color.label != 'Grey',
            style: MenuItemButton.styleFrom(
              foregroundColor: color.color,
            ),
          );
        }).toList());
  }
}
