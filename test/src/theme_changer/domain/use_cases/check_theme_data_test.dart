import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tic_tac_connect_app/config/theme/themes.dart';
import 'package:tic_tac_connect_app/core/common/domain/errors/failure.dart';
import 'package:tic_tac_connect_app/core/common/domain/usecase/use_case.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/entities/theme_change.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/repositories/theme_changer_repository.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/use_cases/check_theme_data.dart';

import 'theme_changer_repository.mock.dart';

void main() {
  late CheckThemeData usecase;
  late ThemeChangerRepository repository;

  setUp(() {
    repository = MockThemeChangerRepository();
    usecase = CheckThemeData(repository: repository);
  });

  const tThemeChange = ThemeChange(
    themesName: AppThemesNames.purple,
    themesBrightness: AppThemesBrightness.light,
  );

  test(
    'should call [repository.checkThemeData] and get successful result',
    () async {
      // arrange
      when(() => repository.checkThemeData())
          .thenAnswer((_) async => const Right(tThemeChange));
      // act
      final result = await usecase(NoParams());
      // assert
      expect(result, const Right<dynamic, ThemeChange>(tThemeChange));
      verify(() => repository.checkThemeData()).called(1);
      verifyNoMoreInteractions(repository);
    },
  );

  const tCacheFailure = CacheFailure(
    message: 'message',
    statusCode: 'statusCode',
  );

  test(
    'should call [repository.checkThemeData] and get [CacheFailure] result',
    () async {
      // arrange
      when(() => repository.checkThemeData())
          .thenAnswer((_) async => const Left(tCacheFailure));
      // act
      final result = await usecase(NoParams());
      // assert
      expect(result, const Left<Failure, dynamic>(tCacheFailure));
      verify(() => repository.checkThemeData()).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
