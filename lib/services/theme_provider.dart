import 'package:flutter/material.dart';
import 'theme_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemePreferences themePreferences = ThemePreferences();
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  ThemeProvider() {
    _loadTheme();
  }

  _loadTheme() async {
    _isDarkTheme = await themePreferences.getTheme();
    notifyListeners();
  }

  setDarkTheme(bool value) {
    _isDarkTheme = value;
    themePreferences.setDarkTheme(value);
    notifyListeners();
  }
}
