import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/theme/theme_event.dart';
import 'package:flutter_counter_bloc/presentation/blocs/theme/theme_state.dart';
import 'package:flutter_counter_bloc/presentation/config/theme/app_theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  var appTheme = AppTheme();

  ThemeBloc() : super(ThemeState(color: 0, darkMode: false, themeData: ThemeData())) {
    on<SetInitialTheme>(_onSetInitialTheme);
    on<ChangeTheme>(_onChangeTheme);
    on<ChangeDarkMode>(_onChangeDarkMode);
  }

  void _onSetInitialTheme(SetInitialTheme event, Emitter<ThemeState> emit) async {
    emit(state.copyWith(color: 0, darkMode: false, themeData: appTheme.getTheme(0, false)));
  }

  void _onChangeTheme(ChangeTheme event, Emitter<ThemeState> emit) async {
    ThemeData updatedTheme = appTheme.getTheme(event.color, state.darkMode);
    emit(state.copyWith(color: event.color, themeData: updatedTheme));
  }

  void _onChangeDarkMode(ChangeDarkMode event, Emitter<ThemeState> emit) async {
    ThemeData updatedTheme = appTheme.getTheme(state.color, event.darkMode);
    emit(state.copyWith(darkMode: event.darkMode, themeData: updatedTheme));
  }
}