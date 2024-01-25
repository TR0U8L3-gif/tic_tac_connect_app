import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tic_tac_connect_app/core/common/domain/usecase/use_case.dart';
import 'package:tic_tac_connect_app/core/common/providers/init_provider.dart';
import 'package:tic_tac_connect_app/core/utils/enums.dart';
import 'package:tic_tac_connect_app/src/on_boarding/domain/use_cases/cache_first_timer.dart';
import 'package:tic_tac_connect_app/src/on_boarding/domain/use_cases/check_if_first_timer.dart';
import 'package:tic_tac_connect_app/src/on_boarding/presentation/manager/on_boarding_bloc.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/entities/theme_change.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/use_cases/cache_theme_data.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/use_cases/check_theme_data.dart';
import 'package:tic_tac_connect_app/src/theme_changer/presentation/manager/theme_changer_bloc.dart';

class MockCheckThemeData extends Mock implements CheckThemeData {}

class MockCacheThemeData extends Mock implements CacheThemeData {}

class MockCheckIfFirstTimer extends Mock implements CheckIfFirstTimer {}

class MockCacheFirstTimer extends Mock implements CacheFirstTimer {}

void main() {
  late InitProvider initProvider;

  late ThemeChangerBloc blocTheme;
  late CheckThemeData checkThemeData;
  late CacheThemeData cacheThemeData;

  late OnBoardingBloc blocOnBoarding;
  late CheckIfFirstTimer checkIfFirstTimer;
  late CacheFirstTimer cacheFirstTimer;

  const tInitElements = 2;

  setUp(() {
    checkThemeData = MockCheckThemeData();
    cacheThemeData = MockCacheThemeData();
    blocTheme = ThemeChangerBloc(
      cacheThemeData: cacheThemeData,
      checkThemeData: checkThemeData,
    );

    checkIfFirstTimer = MockCheckIfFirstTimer();
    cacheFirstTimer = MockCacheFirstTimer();
    blocOnBoarding = OnBoardingBloc(
      cacheFirstTimer: cacheFirstTimer,
      checkIfFirstTimer: checkIfFirstTimer,
    );
  });

  void runTestsWithoutInitialization(Function body) {
    group('run tests without initialization', () {
      setUp(() {
        initProvider = InitProvider(
          initialization: {},
        );
      });
      body();
    });
  }

  void runTestsWithInitialization(Function body) {
    group('run tests with initialization', () {
      setUp(() {
        initProvider = InitProvider(
          initialization: {
            blocTheme: ThemeChangerLoadedState,
            blocOnBoarding: OnBoardingStatusState,
          },
        );
      });
      body();
    });
  }

  runTestsWithoutInitialization(() {
    test('should return [initialized] true and [done] null', () {
      expect(initProvider.done, null);
      expect(initProvider.initialized, true);
    });
  });

  runTestsWithInitialization(() {
    test(
        'should return [done] as List of length $tInitElements '
        'and create initialization map with the same length', () {
      expect(initProvider.initialized, false);
      expect(initProvider.done!.length, tInitElements);
      expect(initProvider.initialization.keys.length, tInitElements);
    });

    test(
        'should return [done] as List of length $tInitElements '
        'and one value of list as true', () async {
      when(() => checkThemeData(NoParams())).thenAnswer(
        (invocation) async => const Right(
          ThemeChange(
            name: AppThemesNames.yellow,
            brightness: AppThemesBrightness.dark,
          ),
        ),
      );

      blocTheme.add(const ThemeChangerGetThemeEvent());

      await Future<void>.delayed(Duration.zero);

      expect(initProvider.done, [true, false]);
      expect(initProvider.initialized, false);
    });

    test(
        'should return [done] as List of length $tInitElements '
        'and all values of list as true', () async {
      when(() => checkThemeData(NoParams())).thenAnswer(
        (invocation) async => const Right(
          ThemeChange(
            name: AppThemesNames.yellow,
            brightness: AppThemesBrightness.dark,
          ),
        ),
      );

      when(() => checkIfFirstTimer(NoParams()))
          .thenAnswer((invocation) async => const Right(true));

      blocTheme.add(const ThemeChangerGetThemeEvent());
      blocOnBoarding.add(const ShowOnBoardingEvent(checkIfFirstTimer: true));

      await Future<void>.delayed(Duration.zero);

      expect(initProvider.done, [true, true]);
      expect(initProvider.initialized, true);
    });
  });
}
