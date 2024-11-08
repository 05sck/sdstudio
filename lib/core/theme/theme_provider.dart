import 'package:flutter/material.dart';
import 'package:sdstudio/core/theme/default_theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = defaultMode;
  ThemeData get themeData => _themeData;

  set themeData(ThemeData newThemeData) {
    _themeData = newThemeData;
    notifyListeners();
  }
}
