import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tic_tac_connect_app/src/play/domain/entities/figure.dart';
import 'package:tic_tac_connect_app/src/play/domain/entities/game_data.dart';
import 'package:tic_tac_connect_app/src/play/domain/entities/position.dart';

part 'match_event.dart';
part 'match_state.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  MatchBloc() : super(MatchInitial()) {
    on<MatchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
