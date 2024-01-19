import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_tac_connect_app/config/theme/themes.dart';
import 'package:tic_tac_connect_app/core/common/domain/errors/exceptions.dart';
import 'package:tic_tac_connect_app/src/theme_changer/data/data_sources/theme_changer_local_data_source.dart';
import 'package:tic_tac_connect_app/src/theme_changer/data/models/theme_change_model.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/entities/theme_change.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late SharedPreferences preferences;
  late ThemeChangerLocalDataSource dataSource;

  const tThemeChange = ThemeChange(
    name: AppThemesNames.red,
    brightness: AppThemesBrightness.dark,
  );

  final tThemeChangeModel = ThemeChangeModel(
    name: tThemeChange.name,
    brightness: tThemeChange.brightness,
  );

  final tThemeChangeModelDefault = ThemeChangeModel(
    name: AppThemesNames.values.first,
    brightness: AppThemesBrightness.values.first,
  );

  setUp(() {
    preferences = MockSharedPreferences();
    dataSource = ThemeChangerLocalDataSourceImpl(preferences: preferences);
  });

  setUpAll(() {
    registerFallbackValue(tThemeChange);
  });

  group('cacheThemeData', () {
    test(
      'should call [SharedPreferences] to cache a data successfully',
          () async {
        // arrange
        when(() => preferences.setString(any(), any()))
            .thenAnswer((invocation) async => true);
        // act
        await dataSource.cacheThemeData(themeChange: tThemeChange);
        // assert
        verify(
              () =>
              preferences.setString(
                kThemeChangKey,
                tThemeChangeModel.toJson(),
              ),
        ).called(1);
        verifyNoMoreInteractions(preferences);
      },
    );

    test(
      'should call [SharedPreferences] to cache a data '
          'unsuccessfully [CacheException]',
          () async {
        // arrange
        when(() => preferences.setString(any(), any())).thenThrow(Exception());
        // act
        final methodCall = dataSource.cacheThemeData(themeChange: tThemeChange);
        // assert
        expect(methodCall, throwsA(isA<CacheException>()));
        verify(
              () =>
              preferences.setString(
                kThemeChangKey,
                tThemeChangeModel.toJson(),
              ),
        ).called(1);
        verifyNoMoreInteractions(preferences);
      },
    );
  });

  group('checkThemeData', ()
  {
    test(
      'should call [SharedPreferences] to get a data',
          () async {
        // arrange
        when(() => preferences.getString(any())).thenReturn(
          tThemeChangeModel.toJson(),);
        // act
        final result = await dataSource.checkThemeData();
        // assert
        expect(result, tThemeChangeModel);
        verify(() => preferences.getString(kThemeChangKey)).called(1);
        verifyNoMoreInteractions(preferences);
      },
    );
    test(
      'should call [SharedPreferences] unsuccessfully [null] '
          'and get a data [ThemeChangeModel.first]',
          () async {
        // arrange
        when(() => preferences.getString(any())).thenReturn(null);
        // act
        final result = await dataSource.checkThemeData();
        // assert
        expect(result, tThemeChangeModelDefault,);
        verify(() => preferences.getString(kThemeChangKey)).called(1);
        verifyNoMoreInteractions(preferences);
      },
    );
    test(
      'should call [SharedPreferences] unsuccessfully [Exception] '
          'and get a data [ThemeChangeModel.first]',
          () async {
        // arrange
        when(() => preferences.getString(any())).thenThrow(Exception());
        // act
        final result = await dataSource.checkThemeData();
        // assert
        expect(result, ThemeChangeModel.first());
        verify(() => preferences.getString(kThemeChangKey)).called(1);
        verifyNoMoreInteractions(preferences);
      },
    );

  });
}
