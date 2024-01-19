import 'package:tic_tac_connect_app/core/utils/typedef.dart';
import 'package:tic_tac_connect_app/src/theme_changer/domain/entities/theme_change.dart';

abstract class ThemeChangerRepository {
  ResultFuture<void> cacheThemeData({required ThemeChange themeChange});
  ResultFuture<ThemeChange> checkThemeData();
}
