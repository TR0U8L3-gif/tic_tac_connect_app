part of 'on_boarding_bloc.dart';

abstract class OnBoardingState extends Equatable {
  const OnBoardingState();

  @override
  List<Object> get props => [];
}

class OnBoardingInitialState extends OnBoardingState {
  const OnBoardingInitialState();
}

class OnBoardingLoadingState extends OnBoardingState {
  const OnBoardingLoadingState();
}

class OnBoardingErrorState extends OnBoardingState {
  const OnBoardingErrorState({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

class OnBoardingCachingFirstTimerState extends OnBoardingState {
  const OnBoardingCachingFirstTimerState();
}
class OnBoardingFirstTimerCachedState extends OnBoardingState {
  const OnBoardingFirstTimerCachedState();
}

class OnBoardingStatusState extends OnBoardingState {
  const OnBoardingStatusState({required this.isFirstTimer});

  final bool isFirstTimer;

  @override
  List<Object> get props => [isFirstTimer];
}
