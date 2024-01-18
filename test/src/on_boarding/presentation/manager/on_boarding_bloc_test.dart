import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tic_tac_connect_app/core/common/domain/errors/failure.dart';
import 'package:tic_tac_connect_app/core/common/domain/usecase/use_case.dart';
import 'package:tic_tac_connect_app/src/on_boarding/domain/use_cases/cache_first_timer.dart';
import 'package:tic_tac_connect_app/src/on_boarding/domain/use_cases/check_if_first_timer.dart';
import 'package:tic_tac_connect_app/src/on_boarding/presentation/manager/on_boarding_bloc.dart';

class MockCacheFirstTimer extends Mock implements CacheFirstTimer {}

class MockCheckIfFirstTimer extends Mock implements CheckIfFirstTimer {}

void main() {
  late CacheFirstTimer cacheFirstTimer;
  late CheckIfFirstTimer checkIfFirstTimer;
  late OnBoardingBloc onBoardingBloc;

  setUp(() {
    cacheFirstTimer = MockCacheFirstTimer();
    checkIfFirstTimer = MockCheckIfFirstTimer();
    onBoardingBloc = OnBoardingBloc(
      cacheFirstTimer: cacheFirstTimer,
      checkIfFirstTimer: checkIfFirstTimer,
    );
  });

  setUpAll(() {
    registerFallbackValue(NoParams());
  });

  tearDown(() {
    onBoardingBloc.close();
  });

  const tCacheFailure = CacheFailure(
    message: 'message',
    statusCode: 'statusCode',
  );

  test('initial state should be [OnBoardingInitialState]', () {
    expect(onBoardingBloc.state, const OnBoardingInitialState());
  });

  group('cacheFirstTimer', () {
    blocTest<OnBoardingBloc, OnBoardingState>(
      'should emit [OnBoardingFirstTimerCachedState] '
      'when method call is successful',
      build: () {
        when(() => cacheFirstTimer(any()))
            .thenAnswer((_) async => const Right(null));
        return onBoardingBloc;
      },
      act: (bloc) => bloc.add(const CacheFirstTimerEvent()),
      expect: () => [
        const OnBoardingCachingFirstTimerState(),
        const OnBoardingFirstTimerCachedState(),
      ],
      verify: (bloc) {
        verify(() => cacheFirstTimer(NoParams())).called(1);
        verifyNoMoreInteractions(cacheFirstTimer);
      },
    );

    blocTest<OnBoardingBloc, OnBoardingState>(
      'should emit [OnBoardingErrorState] '
      'when method call is unsuccessful',
      build: () {
        when(() => cacheFirstTimer(any()))
            .thenAnswer((_) async => const Left(tCacheFailure));
        return onBoardingBloc;
      },
      act: (bloc) => bloc.add(const CacheFirstTimerEvent()),
      expect: () => [
        const OnBoardingCachingFirstTimerState(),
        OnBoardingErrorState(message: tCacheFailure.errorMessage),
      ],
      verify: (bloc) {
        verify(() => cacheFirstTimer(NoParams())).called(1);
        verifyNoMoreInteractions(cacheFirstTimer);
      },
    );
  });

  group('ShowOnBoardingEvent', () {
    const tIsFirstTimer = false;

    blocTest<OnBoardingBloc, OnBoardingState>(
      'should emit [OnBoardingStatusState()] '
      'when  called method successfully with [checkIfFirstTimer: true]',
      build: () {
        when(() => checkIfFirstTimer(any()))
            .thenAnswer((_) async => const Right(tIsFirstTimer));
        return onBoardingBloc;
      },
      act: (bloc) => bloc.add(
        const ShowOnBoardingEvent(checkIfFirstTimer: true),
      ),
      expect: () => [
        const OnBoardingLoadingState(),
        const OnBoardingStatusState(isFirstTimer: tIsFirstTimer),
      ],
      verify: (bloc) {
        verify(() => checkIfFirstTimer(NoParams())).called(1);
        verifyNoMoreInteractions(checkIfFirstTimer);
      },
    );

    blocTest<OnBoardingBloc, OnBoardingState>(
      'should emit [OnBoardingStatusState(isFirstTimer: true)] '
      'when  called method unsuccessfully with [checkIfFirstTimer: true]',
      build: () {
        when(() => checkIfFirstTimer(any()))
            .thenAnswer((_) async => const Left(tCacheFailure));
        return onBoardingBloc;
      },
      act: (bloc) => bloc.add(
        const ShowOnBoardingEvent(checkIfFirstTimer: true),
      ),
      expect: () => [
        const OnBoardingLoadingState(),
        const OnBoardingStatusState(isFirstTimer: true),
      ],
      verify: (bloc) {
        verify(() => checkIfFirstTimer(NoParams())).called(1);
        verifyNoMoreInteractions(checkIfFirstTimer);
      },
    );

    blocTest<OnBoardingBloc, OnBoardingState>(
      'should emit [OnBoardingStatusState()] '
          'when  called method successfully with [checkIfFirstTimer: false]',
      build: () {
        when(() => checkIfFirstTimer(any()))
            .thenAnswer((_) async => const Right(tIsFirstTimer));
        return onBoardingBloc;
      },
      act: (bloc) => bloc.add(
        const ShowOnBoardingEvent(checkIfFirstTimer: false),
      ),
      expect: () => [
        const OnBoardingStatusState(isFirstTimer: true),
      ],
      verify: (bloc) {
        verifyZeroInteractions(checkIfFirstTimer);
        verifyNoMoreInteractions(checkIfFirstTimer);
      },
    );
  });
}
