import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_visits_firebase/presentation/bloc/auth/login_bloc.dart';
import 'package:flutter_visits_firebase/presentation/bloc/auth/login_event.dart';
import 'package:flutter_visits_firebase/presentation/bloc/auth/login_state.dart';
import 'package:go_router/go_router.dart';

class LogOutUser extends StatelessWidget {
  const LogOutUser({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return AlertDialog(
        backgroundColor: Colors.green,
        title: const Text("LogOut del Usuario", style: TextStyle(color: Colors.white, fontSize: 30,)),
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
              backgroundColor: Colors.greenAccent,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              context.read<LoginBloc>().add(LogoutButtonPressed());
              context.go('/login');
            },
            child: const Text('Aceptar'),
          ),
        ],
      );
    });
  }
}