import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class SetInitialTheme extends ThemeEvent {
  const SetInitialTheme();

  @override
  List<Object> get props => [];
}

class ChangeTheme extends ThemeEvent {
  final int color;

  
  const ChangeTheme({required this.color});

  @override
  List<Object> get props => [color];
}

class ChangeDarkMode extends ThemeEvent {
  final bool darkMode;

  const ChangeDarkMode({required this.darkMode});

  @override
  List<Object> get props => [darkMode];
}