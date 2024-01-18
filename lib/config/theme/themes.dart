import 'package:flutter/material.dart' show Colors;
import 'package:tic_tac_connect_app/config/theme/theme.dart';

class AppThemes {
  static final _config = [
    const AppTheme(color: Colors.blueGrey),
    const AppTheme(color: Colors.red),
    const AppTheme(color: Colors.pink),
    const AppTheme(color: Colors.purple),
    const AppTheme(color: Colors.indigo),
    const AppTheme(color: Colors.blue),
    const AppTheme(color: Colors.teal),
    const AppTheme(color: Colors.green),
    const AppTheme(color: Colors.lime),
    const AppTheme(color: Colors.yellow),
    const AppTheme(color: Colors.orange),
    const AppTheme(color: Colors.brown),

  ];

  static AppTheme getTheme(int index) {
    if(index < 0 || index >= _config.length) return _config.first;
    return _config[index];
  }

  static List<AppTheme> getAll() => _config;
}
