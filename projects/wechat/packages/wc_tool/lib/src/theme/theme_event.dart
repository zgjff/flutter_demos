part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent {}

class InitThemeEvent extends ThemeEvent {}

class ChangeThemeEvent extends ThemeEvent {
  ChangeThemeEvent({required this.themeMode});

  final ThemeMode themeMode;
}
