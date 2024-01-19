import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tic_tac_connect_app/config/theme/themes.dart';
import 'package:tic_tac_connect_app/core/common/domain/errors/exceptions.dart';
import 'package:tic_tac_connect_app/core/common/domain/errors/failure.dart';
import 'package:tic_tac_connect_app/src/theme_changer/data/data_sources/theme_changer_local_data_source.dart';
import 'package:tic_tac_connect_app/src/theme_changer/data/models/theme_change_model.dart';
import 'package:tic_tac_connect_app/src/theme_changer/data/repositories/theme_changer_repository_impl.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/entities/theme_change.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/repositories/theme_changer_repository.dart';

class MockThemeChangerLocalDataSource extends Mock
    implements ThemeChangerLocalDataSource {}

void main() {
  late ThemeChangerLocalDataSource dataSource;
  late ThemeChangerRepository repository;

  const tThemeChange = ThemeChange(
    name: AppThemesNames.red,
    brightness: AppThemesBrightness.dark,
  );

  setUp(() {
    dataSource = MockThemeChangerLocalDataSource();
    repository = ThemeChangerRepositoryImpl(localDataSource: dataSource);
  });

  setUpAll(() {
    registerFallbackValue(tThemeChange);
  });

  group('cacheThemeData', () {
    test(
      'should call [ThemeChangerRepository.cacheThemeData] '
      'with successful result',
      () async {
        // arrange
        when(() => dataSource.cacheThemeData(
                themeChange: any(named: 'themeChange')))
            .thenAnswer((invocation) async => Future.value());
        // act
        final result =
            await repository.cacheThemeData(themeChange: tThemeChange);
        // assert
        expect(result, const Right<Failure, void>(null));
        verify(() => dataSource.cacheThemeData(themeChange: tThemeChange))
            .called(1);
        verifyNoMoreInteractions(dataSource);
      },
    );

    const tException = CacheException(
      message: 'message',
      statusCode: 'statusCode',
    );

    final tFailure = CacheFailure.fromException(exception: tException);

    test(
      'should call [ThemeChangerRepository.cacheThemeData] '
      'with unsuccessful result [CacheException]',
      () async {
        // arrange
        when(() => dataSource.cacheThemeData(
            themeChange: any(named: 'themeChange'))).thenThrow(tException);
        // act
        final result =
            await repository.cacheThemeData(themeChange: tThemeChange);
        // assert
        expect(result, Left<Failure, void>(tFailure));
        verify(() => dataSource.cacheThemeData(themeChange: tThemeChange))
            .called(1);
        verifyNoMoreInteractions(dataSource);
      },
    );
  });

  group('checkThemeData', () {
    const tThemeChangeModel = ThemeChangeModel(
      name: AppThemesNames.red,
      brightness: AppThemesBrightness.dark,
    );
    test(
      'should call [ThemeChangerRepository.checkThemeData] '
      'with successful result',
      () async {
        // arrange
        when(
          () => dataSource.checkThemeData(),
        ).thenAnswer((invocation) async => tThemeChangeModel);
        // act
        final result = await repository.checkThemeData();
        // assert
        expect(result, const Right<Failure, ThemeChangeModel>(tThemeChangeModel));
        verify(() => dataSource.checkThemeData()).called(1);
        verifyNoMoreInteractions(dataSource);
      },
    );

    const tException = CacheException(
      message: 'message',
      statusCode: 'statusCode',
    );

    final tFailure = CacheFailure.fromException(exception: tException);

    test(
      'should call [ThemeChangerRepository.checkThemeData] '
      'with unsuccessful result [CacheException]',
      () async {
        // arrange
        when(
          () => dataSource.checkThemeData(),
        ).thenThrow(tException);
        // act
        final result = await repository.checkThemeData();
        // assert
        expect(result, Left<Failure, ThemeChangeModel>(tFailure));
        verify(() => dataSource.checkThemeData()).called(1);
        verifyNoMoreInteractions(dataSource);
      },
    );
  });
}
