part of 'init_bloc.dart';

abstract class InitEvent extends Equatable {
  const InitEvent();

  @override
  List<Object?> get props => [];
}
class InitLoadingEndedEvent extends InitEvent {
    const InitLoadingEndedEvent();
}
class InitAnimationEndedEvent extends InitEvent {
    const InitAnimationEndedEvent();
}
