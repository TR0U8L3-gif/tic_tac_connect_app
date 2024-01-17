import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tic_tac_connect_app/core/common/domain/errors/exceptions.dart';
import 'package:tic_tac_connect_app/core/common/domain/errors/failure.dart';
import 'package:tic_tac_connect_app/src/on_boarding/data/data_sources/on_boarding_local_data_source.dart';
import 'package:tic_tac_connect_app/src/on_boarding/data/repositories/on_boarding_repository_impl.dart';
import 'package:tic_tac_connect_app/src/on_boarding/domain/repositories/on_boarding_repository.dart';

class MockOnBoardingLocalDataSource extends Mock
    implements OnBoardingLocalDataSource {}

void main() {
  late OnBoardingLocalDataSource dataSource;
  late OnBoardingRepository repository;

  setUp(() {
    dataSource = MockOnBoardingLocalDataSource();
    repository = OnBoardingRepositoryImpl(
      localDataSource: dataSource,
    );
  });

  group('cacheFirstTimer', () {
    test(
      'should call [OnBoardingRepository.cacheFirstTimer] '
      'with successful result',
      () async {
        // arrange
        when(() => dataSource.cacheFirstTimer())
            .thenAnswer((invocation) async => Future.value());
        // act
        final result = await repository.cacheFirstTimer();
        // assert
        expect(result, const Right<Failure, void>(null));
        verify(() => dataSource.cacheFirstTimer()).called(1);
        verifyNoMoreInteractions(dataSource);
      },
    );

    const tException = CacheException(
      message: 'message',
      statusCode: 'statusCode',
    );

    final tFailure = CacheFailure.fromException(exception: tException);

    test(
      'should call [OnBoardingRepository.cacheFirstTimer] '
      'with unsuccessful result [CacheException]',
      () async {
        // arrange
        when(() => dataSource.cacheFirstTimer()).thenThrow(tException);
        // act
        final result = await repository.cacheFirstTimer();
        // assert
        expect(result, Left<Failure, void>(tFailure));
        verify(() => dataSource.cacheFirstTimer()).called(1);
        verifyNoMoreInteractions(dataSource);
      },
    );
  });

  group('checkIfUserIsFirstTimer', () {
    test(
      'should call [OnBoardingRepository.checkIfUserIsFirstTimer] '
      'with successful result',
      () async {
        // arrange
        when(
          () => dataSource.checkIfFirstTimer(),
        ).thenAnswer((invocation) async => Future.value(true));
        // act
        final result = await repository.checkIfFirstTimer();
        // assert
        expect(result, const Right<Failure, bool>(true));
        verify(() => dataSource.checkIfFirstTimer()).called(1);
        verifyNoMoreInteractions(dataSource);
      },
    );

    const tException = CacheException(
      message: 'message',
      statusCode: 'statusCode',
    );

    final tFailure = CacheFailure.fromException(exception: tException);

    test(
      'should call [OnBoardingRepository.checkIfUserIsFirstTimer] '
      'with unsuccessful result [CacheException]',
      () async {
        // arrange
        when(
          () => dataSource.checkIfFirstTimer(),
        ).thenThrow(tException);
        // act
        final result = await repository.checkIfFirstTimer();
        // assert
        expect(result, Left<Failure, bool>(tFailure));
        verify(() => dataSource.checkIfFirstTimer()).called(1);
        verifyNoMoreInteractions(dataSource);
      },
    );
  });
}
