import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:tic_tac_connect_app/config/theme/themes.dart';
import 'package:tic_tac_connect_app/core/utils/typedef.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/entities/theme_change.dart';

class ThemeChangeModel extends ThemeChange {
  const ThemeChangeModel({
    required super.themesName,
    required super.themesBrightness,
  });

  factory ThemeChangeModel.first() {
    return ThemeChangeModel(
      themesName: AppThemesNames.values.first,
      themesBrightness: AppThemesBrightness.values.first,
    );
  }

  factory ThemeChangeModel.fromMap(Map<String, dynamic> map) {
    return ThemeChangeModel(
      themesName: AppThemesNames.values.firstWhere(
        (element) => element.name == (map['themesName'] as String),
        orElse: () => AppThemesNames.purple,
      ),
      themesBrightness: AppThemesBrightness.values.firstWhere(
        (element) => element.name == (map['themesBrightness'] as String),
        orElse: () => AppThemesBrightness.light,
      ),
    );
  }

  factory ThemeChangeModel.fromJson(String json) {
    var map = <String, dynamic>{};
    try {
      map = jsonDecode(json) as DataMap;
    } catch (e) {
      debugPrint('$e');
    }
    return ThemeChangeModel.fromMap(map);
  }

  Map<String, dynamic> toMap() {
    return {
      'themesName': themesName.name,
      'themesBrightness': themesBrightness.name,
    };
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  ThemeChangeModel copyWith({
    AppThemesNames? themesName,
    AppThemesBrightness? themesBrightness,
  }) {
    return ThemeChangeModel(
      themesName: themesName ?? this.themesName,
      themesBrightness: themesBrightness ?? this.themesBrightness,
    );
  }
}
