import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/theme/theme_event.dart';
import 'package:flutter_counter_bloc/presentation/blocs/theme/theme_state.dart';
import 'package:flutter_counter_bloc/presentation/config/theme/app_theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  var appTheme = AppTheme();

  ThemeBloc()
      : super(ThemeState(
            color: 0,
            darkMode: false,
            colorBackground: 9,
            themeData: ThemeData(),
            dialogColor: 0)) {
    on<SetInitialTheme>(_onSetInitialTheme);
    on<ChangeTheme>(_onChangeTheme);
    on<ChangeDarkMode>(_onChangeDarkMode);
    on<ChangeBackground>(_onChangeBackGround);
    on<ChangeDialog>(_onChageDialog);
  }

  void _onSetInitialTheme(
      SetInitialTheme event, Emitter<ThemeState> emit) async {
    emit(state.copyWith(
        color: 0,
        darkMode: false,
        colorBackground: 10,
        themeData: appTheme.getTheme(0, false, 10,0)));
  }

  void _onChangeTheme(ChangeTheme event, Emitter<ThemeState> emit) async {
    ThemeData updatedTheme =
        appTheme.getTheme(event.color, state.darkMode, state.colorBackground, state.dialogColor);
    emit(state.copyWith(color: event.color, themeData: updatedTheme));
  }
void _onChangeDarkMode(ChangeDarkMode event, Emitter<ThemeState> emit) async {
    ThemeData updatedTheme = appTheme.getTheme(
        state.color, event.darkMode, state.colorBackground != 10 && state.colorBackground != 11 ? state.colorBackground : event.darkMode ? 11 : 10, state.dialogColor);
    emit(state.copyWith(darkMode: event.darkMode, themeData: updatedTheme));
}
  void _onChangeBackGround(
      ChangeBackground event, Emitter<ThemeState> emit) async {
    ThemeData updatedTheme =
        appTheme.getTheme(state.color, state.darkMode, event.colorBackground,state.dialogColor);
    emit(state.copyWith(
        colorBackground: event.colorBackground, themeData: updatedTheme));
  }
  void _onChageDialog(
      ChangeDialog event, Emitter<ThemeState> emit) async {
    ThemeData updatedTheme =
        appTheme.getTheme(state.color, state.darkMode, state.colorBackground, event.dialogColor);
    emit(state.copyWith(
        dialogColor: event.dialogColor, themeData: updatedTheme));
  }
}
