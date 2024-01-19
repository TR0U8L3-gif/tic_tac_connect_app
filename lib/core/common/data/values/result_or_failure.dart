import 'package:dartz/dartz.dart';
import 'package:tic_tac_connect_app/core/common/domain/errors/exceptions.dart';
import 'package:tic_tac_connect_app/core/common/domain/errors/failure.dart';
import 'package:tic_tac_connect_app/core/utils/typedef.dart';

ResultFuture<Type> getResultOrCacheFailure<Type>(
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