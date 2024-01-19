import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tic_tac_connect_app/config/theme/themes.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/entities/theme_change.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/repositories/theme_changer_repository.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/use_cases/cache_theme_data.dart';

import 'theme_changer_repository.mock.dart';

void main() {
  late CacheThemeData usecase;
  late ThemeChangerRepository repository;

  const tThemeChange = ThemeChange(
    themesName: AppThemesNames.purple,
    themesBrightness: AppThemesBrightness.light,
  );

  setUp(() {
    repository = MockThemeChangerRepository();
    usecase = CacheThemeData(repository: repository);
  });

  setUpAll(() {
    registerFallbackValue(tThemeChange);
  });

  test(
    'should call repository with [ThemeChange] parameter',
    () async {
      // arrange
      when(
        () => repository.cacheThemeData(
          themeChange: any(named: 'themeChange'),
        ),
      ).thenAnswer((_) async => const Right(null));
      // act
      final call = usecase(const CacheThemeDataParams(themeChange: tThemeChange));
      // assert
      expect(call, completes);
      verify(() => repository.cacheThemeData(themeChange: tThemeChange));
    },
  );
}
