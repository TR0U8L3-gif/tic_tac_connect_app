import 'package:flutter/material.dart' show Colors;
import 'package:tic_tac_connect_app/config/theme/theme.dart';

enum AppThemesNames {
  blueGrey,
  red,
  pink,
  purple,
  indigo,
  blue,
  teal,
  green,
  lime,
  yellow,
  orange,
  brown,
}

enum AppThemesBrightness {
  light,
  dark,
}

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
}
