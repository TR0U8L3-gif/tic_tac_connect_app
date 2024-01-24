import 'package:flutter/material.dart' show Colors, ThemeMode;
import 'package:tic_tac_connect_app/config/theme/theme.dart';
import 'package:tic_tac_connect_app/core/utils/enums.dart';
class AppThemes {
  static final _config = {
    AppThemesNames.blueGrey: const AppTheme(color: Colors.blueGrey),
    AppThemesNames.red: const AppTheme(color: Colors.red),
    AppThemesNames.pink: const AppTheme(color: Colors.pink),
    AppThemesNames.purple: const AppTheme(color: Colors.purple),
    AppThemesNames.indigo: const AppTheme(color: Colors.indigo),
    AppThemesNames.blue: const AppTheme(color: Colors.blue),
    AppThemesNames.teal: const AppTheme(color: Colors.teal),
    AppThemesNames.green: const AppTheme(color: Colors.green),
    AppThemesNames.lime: const AppTheme(color: Colors.lime),
    AppThemesNames.yellow: const AppTheme(color: Colors.yellow),
    AppThemesNames.orange: const AppTheme(color: Colors.orange),
    AppThemesNames.brown: const AppTheme(color: Colors.brown),
  };

  static Map<AppThemesNames, AppTheme> getAll() => _config;

  static List<AppTheme> getList() => _config.values.toList();

  static List<AppThemesNames> getListNames() => _config.keys.toList();
  static AppTheme getTheme(AppThemesNames name) =>
      _config[name] ?? _config.values.first;
  static ThemeMode getMode(AppThemesBrightness brightness){
    switch(brightness){
      case AppThemesBrightness.light:
        return ThemeMode.light;
      case AppThemesBrightness.dark:
        return ThemeMode.dark;
    }
  }
}
