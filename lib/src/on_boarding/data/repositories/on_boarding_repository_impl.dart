import 'package:dartz/dartz.dart';
import 'package:tic_tac_connect_app/core/common/domain/errors/exceptions.dart';
import 'package:tic_tac_connect_app/core/common/domain/errors/failure.dart';
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
    return _getResultOrFailure<void>(_localDataSource.cacheFirstTimer);
  }

  @override
  ResultFuture<bool> checkIfFirstTimer() {
    return _getResultOrFailure<bool>(
      _localDataSource.checkIfFirstTimer,
    );
  }

  ResultFuture<Type> _getResultOrFailure<Type>(
    Future<Type> Function() function,
  ) async {
    try {
      final result = await function();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure.fromException(exception: e));
    } catch (e, s) {
      return Left(
        UnknownFailure(
          message: '$e, $s',
        ),
      );
    }
  }
}
