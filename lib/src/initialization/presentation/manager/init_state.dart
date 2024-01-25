part of 'init_bloc.dart';

abstract class InitState extends Equatable {
  const InitState();

  @override
  List<Object> get props => [];
}

class InitLoadingState extends InitState {
  const InitLoadingState();
}

class InitAnimatingState extends InitState {
    const InitAnimatingState();
}

class InitEndedState extends InitState {
    const InitEndedState();
}
