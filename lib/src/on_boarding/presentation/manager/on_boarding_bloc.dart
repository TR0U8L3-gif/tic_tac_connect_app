import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tic_tac_connect_app/core/common/domain/usecase/use_case.dart';
import 'package:tic_tac_connect_app/src/on_boarding/domain/use_cases/cache_first_timer.dart';
import 'package:tic_tac_connect_app/src/on_boarding/domain/use_cases/check_if_first_timer.dart';

part 'on_boarding_event.dart';

part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  OnBoardingBloc({
    required CacheFirstTimer cacheFirstTimer,
    required CheckIfFirstTimer checkIfFirstTimer,
  })  : _cacheFirstTimer = cacheFirstTimer,
        _checkIfFirstTimer = checkIfFirstTimer,
        super(const OnBoardingInitialState()) {
    on<CacheFirstTimerEvent>(_cacheFirstTimerHandler);
    on<ShowOnBoardingEvent>(_checkIfFirstTimerHandler);
  }

  final CacheFirstTimer _cacheFirstTimer;
  final CheckIfFirstTimer _checkIfFirstTimer;

  Future<void> _cacheFirstTimerHandler(
    CacheFirstTimerEvent event,
    Emitter<OnBoardingState> emit,
  ) async {
    emit(const OnBoardingCachingFirstTimerState());

    final result = await _cacheFirstTimer(
      NoParams(),
    );

    result.fold(
      (l) => emit(
        OnBoardingErrorState(
          message: l.errorMessage,
        ),
      ),
      (r) => emit(
        const OnBoardingFirstTimerCachedState(),
      ),
    );
  }

  Future<void> _checkIfFirstTimerHandler(
    ShowOnBoardingEvent event,
    Emitter<OnBoardingState> emit,
  ) async {
    if (!event.checkIfFirstTimer) {
      emit(const OnBoardingStatusState(isFirstTimer: true));
      return;
    }

    emit(const OnBoardingLoadingState());

    final result = await _checkIfFirstTimer(
      NoParams(),
    );

    result.fold(
      (l) => emit(const OnBoardingStatusState(isFirstTimer: true)),
      (r) => emit(OnBoardingStatusState(isFirstTimer: r)),
    );
  }
}
