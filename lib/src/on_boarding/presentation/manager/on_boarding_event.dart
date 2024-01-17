part of 'on_boarding_bloc.dart';

abstract class OnBoardingEvent extends Equatable {
  const OnBoardingEvent();

  @override
  List<Object> get props => [];
}

class CacheFirstTimerEvent extends OnBoardingEvent {
    const CacheFirstTimerEvent();
}

class CheckIfFirstTimerEvent extends OnBoardingEvent {
    const CheckIfFirstTimerEvent();
}
