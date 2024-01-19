import 'package:equatable/equatable.dart';
import 'package:tic_tac_connect_app/config/theme/themes.dart';

class ThemeChange extends Equatable {
  const ThemeChange({required this.themesName, required this.themesBrightness});

  final AppThemesNames themesName;

  final AppThemesBrightness themesBrightness;

  @override
  List<Object?> get props => [themesName.name, themesBrightness.name];
}
