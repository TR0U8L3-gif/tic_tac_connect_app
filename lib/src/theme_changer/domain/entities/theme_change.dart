import 'package:equatable/equatable.dart';
import 'package:tic_tac_connect_app/config/theme/themes.dart';

class ThemeChange extends Equatable {
  const ThemeChange({required this.name, required this.brightness});

  final AppThemesNames name;

  final AppThemesBrightness brightness;

  ThemeChange copyWith({
    AppThemesNames? name,
    AppThemesBrightness? brightness,
  }) {
    return ThemeChange(
      name: name ?? this.name,
      brightness: brightness ?? this.brightness,
    );
  }

  @override
  List<Object?> get props => [name.name, brightness.name];
}
