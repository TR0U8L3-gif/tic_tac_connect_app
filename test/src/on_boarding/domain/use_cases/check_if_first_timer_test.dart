import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tic_tac_connect_app/core/common/domain/errors/failure.dart';
import 'package:tic_tac_connect_app/core/common/domain/usecase/use_case.dart';
import 'package:tic_tac_connect_app/src/on_boarding/domain/repositories/on_boarding_repository.dart';
import 'package:tic_tac_connect_app/src/on_boarding/domain/use_cases/check_if_first_timer.dart';

import 'mock_on_boarding_repository.mock.dart';

void main() {
  late OnBoardingRepository repository;
  late CheckIfFirstTimer useCase;

  setUp(() {
    repository = MockOnBoardingRepository();
    useCase = CheckIfFirstTimer(repository: repository);
  });

  const tUserId = '1';
  const tResponseSuccessful = true;
  const tResponseFailure = ServerFailure(
    message: 'message',
    statusCode: 500,
  );

  test(
    'should call [OnBoardingRepository.checkIfUserIsFirstTimer] '
    'and return successful response',
    () async {
      // arrange
      when(
        () => repository.checkIfFirstTimer(),
      ).thenAnswer((invocation) async => const Right(tResponseSuccessful));
      // act
      final result = await useCase(NoParams());
      // assert
      expect(result, const Right<Failure, bool>(tResponseSuccessful));
      verify(() => repository.checkIfFirstTimer())
          .called(1);
      verifyNoMoreInteractions(repository);
    },
  );

  test(
    'should call [OnBoardingRepository.checkIfUserIsFirstTimer] '
    'and return unsuccessful response',
    () async {
      // arrange
      when(
        () => repository.checkIfFirstTimer(),
      ).thenAnswer((invocation) async => const Left(tResponseFailure));
      // act
      final result =
          await useCase(NoParams());
      // assert
      expect(result, const Left<Failure, void>(tResponseFailure));
      verify(() => repository.checkIfFirstTimer())
          .called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
