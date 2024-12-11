import 'package:flutter/material.dart';

class AppThemes {
  static final light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.orange,
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.orange,
  );

  static Color text(bool isDark) => isDark ? Colors.white : Colors.black;
  static Color accent(bool isDark) => isDark ? Colors.orange : Colors.brown;
}
