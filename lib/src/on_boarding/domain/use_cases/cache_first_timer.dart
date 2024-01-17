import 'package:tic_tac_connect_app/core/common/domain/usecase/use_case.dart';
import 'package:tic_tac_connect_app/core/utils/typedef.dart';
import 'package:tic_tac_connect_app/src/on_boarding/domain/repositories/on_boarding_repository.dart';

class CacheFirstTimer extends UseCase<void, NoParams>{

  CacheFirstTimer({required OnBoardingRepository repository})
      : _repository = repository;
  final OnBoardingRepository _repository;
  @override
  ResultFuture<void> call(NoParams params) {
    throw UnimplementedError();
    //return _repository.cacheFirstTimer();
  }
}