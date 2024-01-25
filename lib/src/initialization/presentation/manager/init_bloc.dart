import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'init_event.dart';

part 'init_state.dart';

class InitBloc extends Bloc<InitEvent, InitState> {
  InitBloc() : super(const InitLoadingState()) {
    on<InitLoadingEndedEvent>((
      event,
      emit,
    ) {
      emit(const InitAnimatingState());
    });
    on<InitAnimationEndedEvent>((
      event,
      emit,
    ) {
      emit(const InitEndedState());
    });
  }
}
