import 'package:equatable/equatable.dart';
import 'package:tic_tac_connect_app/core/utils/typedef.dart';

// ignore: one_member_abstracts
abstract class UseCase<Type,Params> {
  ResultFuture<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => List.empty();
}