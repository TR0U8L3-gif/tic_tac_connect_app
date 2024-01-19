import 'package:equatable/equatable.dart';
import 'package:tic_tac_connect_app/core/common/domain/usecase/use_case.dart';
import 'package:tic_tac_connect_app/core/utils/typedef.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/entities/theme_change.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/repositories/theme_changer_repository.dart';

class CacheThemeData extends UseCase<void, CacheThemeDataParams> {
  CacheThemeData({required ThemeChangerRepository repository})
      : _repository = repository;
  final ThemeChangerRepository _repository;

  @override
  ResultFuture<void> call(CacheThemeDataParams params) {
    return _repository.cacheThemeData(themeChange: params.themeChange);
  }
}

class CacheThemeDataParams extends Equatable {
  const CacheThemeDataParams({required this.themeChange});

  final ThemeChange themeChange;

  @override
  List<Object?> get props => [themeChange];
}
