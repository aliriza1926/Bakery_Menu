import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

class AppTheme {
  static ThemeData lighttheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFfaedcd),
      onPrimary: Color(0xFFfca311),
      secondary: Color(0xFFca6702),
      onSecondary: Colors.white,
      surface: Colors.white,
      onSurface: Color(0xFFca6702),
    ),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.roboto(),
      bodyMedium: GoogleFonts.roboto(),
      bodyLarge: GoogleFonts.roboto(),
      labelSmall: GoogleFonts.roboto(),
      labelMedium: GoogleFonts.roboto(),
      labelLarge: GoogleFonts.roboto(),
      titleSmall: GoogleFonts.pattaya(),
      titleMedium: GoogleFonts.roboto(),
      titleLarge: GoogleFonts.pattaya(),
      headlineSmall: GoogleFonts.aBeeZee(),
      headlineMedium: GoogleFonts.aBeeZee(),
      headlineLarge: GoogleFonts.aBeeZee(),
      displaySmall: GoogleFonts.abrilFatface(),
      displayMedium: GoogleFonts.pattaya(),
      displayLarge: GoogleFonts.pattaya(),
    ),
  );
  static ThemeData darktheme = ThemeData(
    colorScheme: ColorScheme.dark(
      primary: Colors.teal.shade400,
      onPrimary: Colors.white,
      secondary: Colors.orangeAccent,
      onSecondary: Colors.black,
      tertiary: const Color.fromARGB(179, 158, 69, 49),
      onTertiary: Colors.black,
      surface: Colors.grey.shade900,
      onSurface: Colors.white,
    ),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.roboto(),
      bodyMedium: GoogleFonts.roboto(),
      bodyLarge: GoogleFonts.roboto(),
      labelSmall: GoogleFonts.roboto(),
      labelMedium: GoogleFonts.roboto(),
      labelLarge: GoogleFonts.roboto(),
      titleSmall: GoogleFonts.pattaya(),
      titleMedium: GoogleFonts.roboto(),
      titleLarge: GoogleFonts.pattaya(),
      headlineSmall: GoogleFonts.aBeeZee(),
      headlineMedium: GoogleFonts.aBeeZee(),
      headlineLarge: GoogleFonts.aBeeZee(),
      displaySmall: GoogleFonts.abrilFatface(),
      displayMedium: GoogleFonts.pattaya(),
      displayLarge: GoogleFonts.pattaya(),
    ),
  );
}
