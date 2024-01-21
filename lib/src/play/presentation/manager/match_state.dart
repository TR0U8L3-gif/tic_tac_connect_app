part of 'match_bloc.dart';

abstract class MatchState extends Equatable {
  const MatchState();

  @override
  List<Object> get props => [];
}

class MatchInitial extends MatchState {}

class MatchOnGoingState extends MatchState {
  const MatchOnGoingState({
    required this.gameData,
  });

  final GameData gameData;
}

class MatchEndedState extends MatchState {
  const MatchEndedState({
    required this.winner,
    required this.gameData,
  });

  final Figure? winner;
  final GameData gameData;
}
