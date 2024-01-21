part of 'match_bloc.dart';

abstract class MatchEvent extends Equatable {
  const MatchEvent();
  @override
  List<Object> get props => [];
}

class MatchPlayerMoveEvent extends MatchEvent {
  const MatchPlayerMoveEvent({required this.position});

  final Position position;

  @override
  List<Object> get props => [position];
}

class MatchResetEvent extends MatchEvent {
}

class MatchBackEvent extends MatchEvent {
    const MatchBackEvent();
}