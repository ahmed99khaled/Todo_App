import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String language = 'en';

  void changeTHeme(ThemeMode newTheme) {
    currentTheme = newTheme;
    notifyListeners();
  }

  void changeLanguage(String newLanguage) {
    language = newLanguage;
    notifyListeners();
  }
}
