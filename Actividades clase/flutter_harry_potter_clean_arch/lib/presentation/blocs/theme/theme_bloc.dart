import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_harry_potter_clean_arch/config/theme/app_theme.dart';
import 'package:flutter_harry_potter_clean_arch/presentation/blocs/theme/theme_event.dart';
import 'package:flutter_harry_potter_clean_arch/presentation/blocs/theme/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  var appTheme = AppTheme();

  ThemeBloc()
      : super(ThemeState(
            color: 0,
            darkMode: false,
            themeData: ThemeData(),
            dialogColor: 0,
            font: "",)) {
    on<SetInitialTheme>(_onSetInitialTheme);
    on<ChangeTheme>(_onChangeTheme);
    on<ChangeDarkMode>(_onChangeDarkMode);
    on<ChangeDialog>(_onChageDialog);
    on<ChangeFont>(_onChangeFont);
  }

  void _onSetInitialTheme(
      SetInitialTheme event, Emitter<ThemeState> emit) async {
    emit(state.copyWith(
        color: 0, darkMode: false, themeData: appTheme.getTheme(0, false, 0, "")));
  }

  void _onChangeTheme(ChangeTheme event, Emitter<ThemeState> emit) async {
    ThemeData updatedTheme =
        appTheme.getTheme(event.color, state.darkMode, state.dialogColor, state.font);
    emit(state.copyWith(color: event.color, themeData: updatedTheme));
  }

  void _onChangeDarkMode(ChangeDarkMode event, Emitter<ThemeState> emit) async {
    ThemeData updatedTheme =
        appTheme.getTheme(state.color, event.darkMode, state.dialogColor, state.font);
    emit(state.copyWith(darkMode: event.darkMode, themeData: updatedTheme));
  }

  void _onChageDialog(ChangeDialog event, Emitter<ThemeState> emit) async {
    ThemeData updatedTheme =
        appTheme.getTheme(state.color, state.darkMode, event.dialogColor, state.font);
    emit(state.copyWith(
        dialogColor: event.dialogColor, themeData: updatedTheme));
  }

  void _onChangeFont(ChangeFont event, Emitter<ThemeState> emit) async {
    ThemeData updatedTheme =
        appTheme.getTheme(state.color, state.darkMode, state.dialogColor, event.font);
    emit(state.copyWith(
        font: event.font, themeData: updatedTheme));
  }
}
