import 'package:flutter/material.dart';

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;

  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static Color? get tapBarIndicatorColor {
    return const Color(0xFFDB8677);
  }

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: Color(0xffedf3f7),
        textTheme: const TextTheme(
    ));
  }
}
