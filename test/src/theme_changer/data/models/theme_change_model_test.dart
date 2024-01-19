import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_connect_app/config/theme/themes.dart';
import 'package:tic_tac_connect_app/core/helpers/strings.dart';
import 'package:tic_tac_connect_app/core/utils/typedef.dart';
import 'package:tic_tac_connect_app/src/theme_changer/data/models/theme_change_model.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/entities/theme_change.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tThemeChangeModel = ThemeChangeModel(
    name: AppThemesNames.red,
    brightness: AppThemesBrightness.dark,
  );

  test('should be a subclass of [ThemeChange]', () {
    expect(tThemeChangeModel, isA<ThemeChange>());
  });

  group('fromJson', () {
    test(
      'should return valid model',
          () async {
        // arrange
        final data = fixture('theme_change/theme_change.json');
        // act
        final result = ThemeChangeModel.fromJson(data);
        // assert
        expect(result, tThemeChangeModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return valid String',
          () async {
        // arrange
            final data = fixture('theme_change/theme_change.json');
        // act
            final result = tThemeChangeModel.toJson();
        // assert
            expect(removeSpacesAndNewlines(result), removeSpacesAndNewlines(data));
      },
    );
  });

  group('from Map', () {
    test('should return valid model', () {
      final jsonMap = jsonDecode(fixture('theme_change/theme_change.json')) as DataMap;
      // act
      final result = ThemeChangeModel.fromMap(jsonMap);
      // assert
      expect(result, tThemeChangeModel);
    });
    

  });

  group('to Map', () {
    test('should return valid Map', () {
      final jsonMap = jsonDecode(fixture('theme_change/theme_change.json')) as DataMap;
      // act
      final result = tThemeChangeModel.toMap();
      // assert
      expect(result, jsonMap);
    });
  });


}
