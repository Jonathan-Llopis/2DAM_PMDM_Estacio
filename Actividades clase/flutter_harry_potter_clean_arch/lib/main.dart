import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_harry_potter_clean_arch/presentation/blocs/characters/characters_bloc.dart';
import 'package:flutter_harry_potter_clean_arch/presentation/blocs/theme/theme_bloc.dart';
import 'package:flutter_harry_potter_clean_arch/presentation/blocs/theme/theme_event.dart';
import 'package:flutter_harry_potter_clean_arch/presentation/blocs/theme/theme_state.dart';
import 'package:flutter_harry_potter_clean_arch/presentation/screens/characters_screen.dart';
import 'injection_container.dart' as injection_container;

void main() async {
 await injection_container.init();
 runApp( MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider<CharacterBloc>(
          create: (context) => injection_container.sl<CharacterBloc>(),
        ),
      ], child: const MyApp(),),
      );
}

class MyApp extends StatelessWidget {
 const MyApp({super.key});

 @override
 Widget build(BuildContext context) {
  final themeBloc = BlocProvider.of<ThemeBloc>(context);
    themeBloc.add(const SetInitialTheme());
   return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: state.themeData,
          home: const CharactersScreen(),
        );
      },
    );
 }
}