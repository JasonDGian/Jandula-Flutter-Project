import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 68, 0, 57);

List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.orange,
  Colors.pink,
  Colors.red
];

class AppTheme {
  final int selectedColor;

  AppTheme({required this.selectedColor})
      : assert(selectedColor >= 0 && selectedColor < _colorThemes.length,
            'Color index out of bounds');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: false, colorSchemeSeed: _colorThemes[selectedColor]);
  }
}
