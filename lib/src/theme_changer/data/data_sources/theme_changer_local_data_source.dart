import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_tac_connect_app/config/theme/themes.dart';
import 'package:tic_tac_connect_app/core/common/domain/errors/exceptions.dart';
import 'package:tic_tac_connect_app/core/utils/typedef.dart';
import 'package:tic_tac_connect_app/src/theme_changer/data/models/theme_change_model.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/entities/theme_change.dart';

abstract class ThemeChangerLocalDataSource {
  Future<void> cacheThemeData({required ThemeChange themeChange});

  Future<ThemeChangeModel> checkThemeData();
}

const kThemeChangKey = 'theme_change';

class ThemeChangerLocalDataSourceImpl implements ThemeChangerLocalDataSource {
  ThemeChangerLocalDataSourceImpl({required SharedPreferences preferences})
      : _preferences = preferences;
  final SharedPreferences _preferences;

  @override
  Future<void> cacheThemeData({required ThemeChange themeChange}) async {
    final themeChangeModel = ThemeChangeModel(
      themesName: themeChange.themesName,
      themesBrightness: themeChange.themesBrightness,
    );
    try {
      await _preferences.setString(kThemeChangKey, themeChangeModel.toJson());
    } catch (e) {
      throw CacheException(message: '$e', statusCode: '500');
    }
  }

  @override
  Future<ThemeChangeModel> checkThemeData() async {
    try {
      final result = _preferences.getString(kThemeChangKey);
      final map = jsonDecode(result ?? '{}') as DataMap;
      return ThemeChangeModel.fromMap(
        map,
      );
    } catch (e) {
      debugPrint('ThemeChangerLocalDataSource[checkThemeData] error: $e');
      return ThemeChangeModel.first();
    }
  }
}
