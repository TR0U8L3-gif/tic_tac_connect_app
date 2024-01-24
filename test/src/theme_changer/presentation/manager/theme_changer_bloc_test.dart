import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tic_tac_connect_app/core/common/domain/usecase/use_case.dart';
import 'package:tic_tac_connect_app/core/utils/enums.dart';
import 'package:tic_tac_connect_app/src/theme_changer/data/models/theme_change_model.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/entities/theme_change.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/use_cases/cache_theme_data.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/use_cases/check_theme_data.dart';
import 'package:tic_tac_connect_app/src/theme_changer/presentation/manager/theme_changer_bloc.dart';

class MockCacheThemeData extends Mock implements CacheThemeData {}

class MockCheckThemeData extends Mock implements CheckThemeData {}

void main() {
  late CacheThemeData cacheThemeData;
  late CheckThemeData checkThemeData;
  late ThemeChangerBloc themeBloc;

  const tThemeChange = ThemeChange(
    name: AppThemesNames.purple,
    brightness: AppThemesBrightness.light,
  );
  final tThemeChangeModel = ThemeChangeModel.first();

  setUp(() {
    cacheThemeData = MockCacheThemeData();
    checkThemeData = MockCheckThemeData();
    themeBloc = ThemeChangerBloc(
      cacheThemeData: cacheThemeData,
      checkThemeData: checkThemeData,
    );
  });

  setUpAll(() {
    registerFallbackValue(NoParams());
    registerFallbackValue(
        const CacheThemeDataParams(themeChange: tThemeChange),);
  });

  test(
      'initial state should be [ThemeChangerState] '
      'with themeChange equal to [ThemeChangeModel.first()]', () {
    expect(themeBloc.state, isA<ThemeChangerState>());
    expect(themeBloc.state.themeChange, ThemeChangeModel.first());
  });

  blocTest(
    'emits [ThemeChangerState] when ThemeChangerChangeThemeEvent is added',
    build: () {
      when(() => cacheThemeData(any())).thenAnswer(
            (invocation) async => const Right(null),
      );
      return themeBloc;
    },
    act: (bloc) => bloc.add(
      ThemeChangerChangeThemeEvent(
        brightness: tThemeChange.brightness,
        name: tThemeChange.name,
      ),
    ),
    expect: () => [
      ThemeChangerState(
        themeChange: ThemeChange(
          brightness: tThemeChange.brightness,
          name: tThemeChange.name,
        ),
      ),
    ],
  );

  blocTest(
    'emits [ThemeChangerState] when ThemeChangerChangeThemeEvent '
    'is added with null values',
    build: () {
      when(() => cacheThemeData(any())).thenAnswer(
        (invocation) async => const Right(null),
      );
      return themeBloc;
    },
    act: (bloc) => bloc.add(const ThemeChangerChangeThemeEvent()),
    expect: () => [],
  );
}
