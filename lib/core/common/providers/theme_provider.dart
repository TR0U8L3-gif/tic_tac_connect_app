import 'package:flutter/material.dart';
import 'package:tic_tac_connect_app/config/theme/theme.dart';
import 'package:tic_tac_connect_app/config/theme/themes.dart';

class ThemeProvider extends ChangeNotifier {
  AppTheme _theme = AppThemes.getTheme(0);
  ThemeMode _mode = ThemeMode.system;

  ThemeData get light => _theme.light;
  ThemeData get dark => _theme.dark;
  ThemeMode get mode => _mode;

  void toggleThemeBrightness() {
    if(_mode == ThemeMode.light){
      _mode = ThemeMode.dark;
    } else {
      _mode = ThemeMode.light;
    }
    notifyListeners();
  }

  void setThemeBrightness({required bool isThemeDark}) {
    if(isThemeDark){
      _mode = ThemeMode.dark;
    } else {
      _mode = ThemeMode.light;
    }
    notifyListeners();
  }

  void setTheme(int index){
    _theme = AppThemes.getTheme(index);
  }
}
