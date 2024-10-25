import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_harry_potter_login/presentation/blocs/login/login_bloc.dart';
import 'package:flutter_harry_potter_login/presentation/blocs/login/login_event.dart';
import 'package:flutter_harry_potter_login/presentation/blocs/login/login_state.dart';
import 'package:go_router/go_router.dart';

class LogOutUser extends StatelessWidget {
  const LogOutUser({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return AlertDialog(
        title: const Text("LogOut del Usuario"),
        content:
            const Text('¿Estas seguro que quieres salir de la aplicación?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context); 
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              context.read<LoginBloc>().add(LogoutButtonPressed());
              context.go('/login');
              Navigator.pop(context); 
            },
            child: const Text('Aceptar'),
          ),
        ],
      );
    });
  }
}
