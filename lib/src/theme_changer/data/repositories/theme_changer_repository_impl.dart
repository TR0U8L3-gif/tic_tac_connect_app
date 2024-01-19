import 'package:tic_tac_connect_app/core/common/data/values/result_or_failure.dart';
import 'package:tic_tac_connect_app/core/utils/typedef.dart';
import 'package:tic_tac_connect_app/src/theme_changer/data/data_sources/theme_changer_local_data_source.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/entities/theme_change.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/repositories/theme_changer_repository.dart';

class ThemeChangerRepositoryImpl implements ThemeChangerRepository {
  ThemeChangerRepositoryImpl({
    required ThemeChangerLocalDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  final ThemeChangerLocalDataSource _localDataSource;

  @override
  ResultFuture<void> cacheThemeData({required ThemeChange themeChange}) {
    return getResultOrCacheFailure<void>(
      () => _localDataSource.cacheThemeData(themeChange: themeChange),
    );
  }

  @override
  ResultFuture<ThemeChange> checkThemeData() {
    return getResultOrCacheFailure<ThemeChange>(
      _localDataSource.checkThemeData,
    );
  }
}
