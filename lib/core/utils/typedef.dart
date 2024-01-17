import 'package:dartz/dartz.dart';
import 'package:tic_tac_connect_app/core/common/domain/errors/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef DataMap = Map<String, dynamic>;
