import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/assets/themes/bright_theme/bright_theme_three/bright_theme_three.dart';
import 'package:surf_flutter_courses_template/assets/themes/bright_theme/bright_theme_one/bright_theme_one.dart';
import 'package:surf_flutter_courses_template/assets/themes/bright_theme/bright_theme_two/bright_theme_two.dart';
import 'package:surf_flutter_courses_template/assets/themes/dark_theme/dark_theme_one/dark_theme_one.dart';
import 'package:surf_flutter_courses_template/assets/themes/dark_theme/dark_theme_three/dark_theme_three.dart';
import 'package:surf_flutter_courses_template/assets/themes/dark_theme/dark_theme_two/dark_theme_two.dart';


class AppTheme with ChangeNotifier {
  late String themeName;
  late ThemeMode themeMode;
  late int brightThemeScheme;
  late ThemeData brightTheme;
  late int darkThemeScheme;
  late ThemeData darkTheme;

  AppTheme();

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    themeName = prefs.getString('appTheme') ?? AppStrings.systemTheme;
    await setAppTheme(themeName);
    brightThemeScheme = prefs.getInt('lightThemeScheme') ?? 1;
    await setBrightThemeScheme(brightThemeScheme);
    darkThemeScheme = prefs.getInt('darkThemeScheme') ?? 1;
    await setDarkThemeScheme(darkThemeScheme);
  }

  Future<void> setAppTheme(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('appTheme', value);
    themeName = value;
    switch (themeName) {
      case AppStrings.systemTheme:
        themeMode = ThemeMode.system;
      case AppStrings.brightTheme:
        themeMode = ThemeMode.light;
      case AppStrings.darkTheme:
        themeMode = ThemeMode.dark;
    }
    notifyListeners();
  }

  Future<void> setBrightThemeScheme(int value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('lightThemeScheme', value);
    brightThemeScheme = value;
    switch (brightThemeScheme) {
      case 1:
        brightTheme = brightThemeOne;
      case 2:
        brightTheme = brightThemeTwo;
      case 3:
        brightTheme = brightThemeThree;
    }
    notifyListeners();
  }

  Future<void> setDarkThemeScheme(int value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('darkThemeScheme', value);
    darkThemeScheme = value;
    switch (darkThemeScheme) {
      case 1:
        darkTheme = darkThemeOne;
      case 2:
        darkTheme = darkThemeTwo;
      case 3:
        darkTheme = darkThemeThree;
    }
    notifyListeners();
  }
}
