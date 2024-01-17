import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_tac_connect_app/core/common/domain/errors/exceptions.dart';

abstract class OnBoardingLocalDataSource {
  Future<void> cacheFirstTimer();
  Future<bool> checkIfFirstTimer();
}


const kFirstTimerKey = 'on_boarding_first_timer';

class OnBoardingLocalDataSourceImpl implements OnBoardingLocalDataSource {
  OnBoardingLocalDataSourceImpl({required SharedPreferences preferences})
      : _preferences = preferences;

  final SharedPreferences _preferences;

  @override
  Future<void> cacheFirstTimer() async {
    try {
      await _preferences.setBool(kFirstTimerKey, false);
    } catch (e) {
      throw CacheException(message: '$e', statusCode: '500');
    }
  }

  @override
  Future<bool> checkIfFirstTimer() async {
    try {
      final result = _preferences.getBool(kFirstTimerKey);
      return result ?? true;
    } catch (e) {
      throw CacheException(message: '$e', statusCode: '500');
    }
  }
}