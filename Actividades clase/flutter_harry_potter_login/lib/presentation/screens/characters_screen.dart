import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_harry_potter_login/presentation/blocs/characters/characters_bloc.dart';
import 'package:flutter_harry_potter_login/presentation/blocs/characters/characters_state.dart';
import 'package:flutter_harry_potter_login/presentation/widgets/characters_list.dart';
import 'package:flutter_harry_potter_login/presentation/widgets/dialog_logout.dart';
import 'package:flutter_harry_potter_login/presentation/widgets/menu_lateral.dart';

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
          actions: [
            IconButton(
                onPressed: () {
                  _mostrarLogOut(context);
                },
                icon: const Icon(Icons.exit_to_app))
          ],
        ),
        body: const CharactersList(),
        drawer: const MenuLateral(),
      );
    });
  }

  Future<void> _mostrarLogOut(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return const LogOutUser();
        });
  }
}
