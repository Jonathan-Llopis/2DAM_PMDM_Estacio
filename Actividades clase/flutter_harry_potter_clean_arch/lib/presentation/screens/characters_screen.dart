import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_harry_potter_clean_arch/presentation/blocs/characters/characters_bloc.dart';
import 'package:flutter_harry_potter_clean_arch/presentation/blocs/characters/characters_state.dart';
import 'package:flutter_harry_potter_clean_arch/presentation/widgets/characters_list.dart';
import 'package:flutter_harry_potter_clean_arch/presentation/widgets/menu_lateral.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharactersScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Personajes de Harry Potter'),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.zero,
            child: Text(
              "Total de Personajes ${state.characters.length}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
        body: const CharactersList(),
        drawer: const MenuLateral(),
      );
    });
  }
}
