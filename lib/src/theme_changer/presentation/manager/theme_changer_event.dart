part of 'theme_changer_bloc.dart';

abstract class ThemeChangerEvent extends Equatable {
  const ThemeChangerEvent();
  @override
  List<Object?> get props => [];
}

class ThemeChangerGetThemeEvent extends ThemeChangerEvent {
    const ThemeChangerGetThemeEvent();
}

class ThemeChangerChangeThemeEvent extends ThemeChangerEvent {
  const ThemeChangerChangeThemeEvent({this.name, this.brightness});

  final AppThemesNames? name;
  final AppThemesBrightness? brightness;
}
