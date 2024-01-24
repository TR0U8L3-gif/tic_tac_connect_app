import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:tic_tac_connect_app/core/utils/enums.dart';
import 'package:tic_tac_connect_app/core/utils/typedef.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/entities/theme_change.dart';

class ThemeChangeModel extends ThemeChange {
  const ThemeChangeModel({
    required super.name,
    required super.brightness,
  });

  factory ThemeChangeModel.first() {
    return ThemeChangeModel(
      name: AppThemesNames.values.first,
      brightness: AppThemesBrightness.values.first,
    );
  }

  factory ThemeChangeModel.fromMap(Map<String, dynamic> map) {
    return ThemeChangeModel(
      name: AppThemesNames.values.firstWhere(
        (element) => element.name == (map['name'] as String),
        orElse: () => AppThemesNames.purple,
      ),
      brightness: AppThemesBrightness.values.firstWhere(
        (element) => element.name == (map['brightness'] as String),
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
      'name': name.name,
      'brightness': brightness.name,
    };
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
