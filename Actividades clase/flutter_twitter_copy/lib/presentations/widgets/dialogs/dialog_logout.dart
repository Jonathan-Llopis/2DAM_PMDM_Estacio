import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_twitter_copy/presentations/blocs/auth/auth_bloc.dart';
import 'package:flutter_twitter_copy/presentations/blocs/auth/auth_event.dart';
import 'package:flutter_twitter_copy/presentations/blocs/auth/auth_state.dart';
import 'package:go_router/go_router.dart';

class LogOutUser extends StatelessWidget {
  const LogOutUser({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return AlertDialog(
          title: const Text("LogOut del Usuario",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              )),
          content: const Text(
            '¿Estas seguro que quieres salir de la aplicación?',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                context.read<AuthBloc>().add(LogoutEvent());
                context.go('/login');
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}
