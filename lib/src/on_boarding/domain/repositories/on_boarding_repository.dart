import 'package:tic_tac_connect_app/core/utils/typedef.dart';

abstract class OnBoardingRepository {
  ResultFuture<void> cacheFirstTimer();
  ResultFuture<bool> checkIfFirstTimer();

}