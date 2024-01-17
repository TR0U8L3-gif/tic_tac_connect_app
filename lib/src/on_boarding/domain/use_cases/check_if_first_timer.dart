import 'package:tic_tac_connect_app/core/common/domain/usecase/use_case.dart';
import 'package:tic_tac_connect_app/core/utils/typedef.dart';
import 'package:tic_tac_connect_app/src/on_boarding/domain/repositories/on_boarding_repository.dart';

class CheckIfFirstTimer extends UseCase<bool, NoParams> {
  CheckIfFirstTimer({required OnBoardingRepository repository})
      : _repository = repository;
  final OnBoardingRepository _repository;

  @override
  ResultFuture<bool> call(NoParams params) {
    return _repository.checkIfFirstTimer();
  }
}
