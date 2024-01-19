import 'package:tic_tac_connect_app/core/common/data/values/result_or_failure.dart';
import 'package:tic_tac_connect_app/core/utils/typedef.dart';
import 'package:tic_tac_connect_app/src/on_boarding/data/data_sources/on_boarding_local_data_source.dart';
import 'package:tic_tac_connect_app/src/on_boarding/domain/repositories/on_boarding_repository.dart';

class OnBoardingRepositoryImpl implements OnBoardingRepository {
  OnBoardingRepositoryImpl({
    required OnBoardingLocalDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  final OnBoardingLocalDataSource _localDataSource;

  @override
  ResultFuture<void> cacheFirstTimer() async {
    return getResultOrCacheFailure<void>(_localDataSource.cacheFirstTimer);
  }

  @override
  ResultFuture<bool> checkIfFirstTimer() {
    return getResultOrCacheFailure<bool>(
      _localDataSource.checkIfFirstTimer,
    );
  }
}
