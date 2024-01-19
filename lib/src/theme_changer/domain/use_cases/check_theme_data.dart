import 'package:tic_tac_connect_app/core/common/domain/usecase/use_case.dart';
import 'package:tic_tac_connect_app/core/utils/typedef.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/entities/theme_change.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/repositories/theme_changer_repository.dart';

class CheckThemeData extends UseCase<ThemeChange, NoParams> {
  CheckThemeData({required ThemeChangerRepository repository})
      : _repository = repository;
  final ThemeChangerRepository _repository;

  @override
  ResultFuture<ThemeChange> call(NoParams params) {
    return _repository.checkThemeData();
  }
}
