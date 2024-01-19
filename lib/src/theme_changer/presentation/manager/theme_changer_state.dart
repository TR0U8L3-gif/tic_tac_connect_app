part of 'theme_changer_bloc.dart';

class ThemeChangerState extends Equatable{
  const ThemeChangerState({required this.themeChange});

  final ThemeChange themeChange;

  @override
  List<Object?> get props => [themeChange];
}
