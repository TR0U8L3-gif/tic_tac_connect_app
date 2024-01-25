import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tic_tac_connect_app/core/common/domain/usecase/use_case.dart';
import 'package:tic_tac_connect_app/core/utils/enums.dart';
import 'package:tic_tac_connect_app/src/theme_changer/data/models/theme_change_model.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/entities/theme_change.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/use_cases/cache_theme_data.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/use_cases/check_theme_data.dart';

part 'theme_changer_event.dart';

part 'theme_changer_state.dart';

class ThemeChangerBloc extends Bloc<ThemeChangerEvent, ThemeChangerState> {
  ThemeChangerBloc({
    required CacheThemeData cacheThemeData,
    required CheckThemeData checkThemeData,
  })  : _checkThemeData = checkThemeData,
        _cacheThemeData = cacheThemeData,
        super(ThemeChangerState(themeChange: ThemeChangeModel.first())) {
    on<ThemeChangerGetThemeEvent>(_getThemeHandler);
    on<ThemeChangerChangeThemeEvent>(_changeThemeHandler);
  }

  final CacheThemeData _cacheThemeData;
  final CheckThemeData _checkThemeData;

  Future<void> _getThemeHandler(
    ThemeChangerGetThemeEvent event,
    Emitter<ThemeChangerState> emit,
  ) async {
    final result = await _checkThemeData(NoParams());
    result.fold(
      (l) =>
          emit(ThemeChangerLoadedState(themeChange: ThemeChangeModel.first())),
      (r) =>
          emit(ThemeChangerLoadedState(themeChange: r)),
    );
  }

  Future<void> _changeThemeHandler(
    ThemeChangerChangeThemeEvent event,
    Emitter<ThemeChangerState> emit,
  ) async {
    if (event.brightness == null && event.name == null) return;
    if (state.themeChange.brightness == event.brightness &&
        state.themeChange.name == event.name) return;

    final themeChange = state.themeChange.copyWith(
      name: event.name,
      brightness: event.brightness,
    );

    emit(ThemeChangerState(themeChange: themeChange));

    await _cacheThemeData(CacheThemeDataParams(themeChange: themeChange));
  }
}
