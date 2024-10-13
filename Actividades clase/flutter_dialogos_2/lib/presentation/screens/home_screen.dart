import 'package:flutter/material.dart';
import 'package:flutter_dialogos_2/infraestructure/models/usuario.dart';
import 'package:flutter_dialogos_2/presentation/widgets/mostrar_usuario_alert.dart';
import 'package:flutter_dialogos_2/presentation/widgets/registrar_usuarios.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Registrar Usuarios'),
          ),
          body: Center(
              child: ElevatedButton(
                  onPressed: () async {
                    Usuario? nuevoUsuario = await _crearUsuario(context);
                    _mostrarUsuario(context, nuevoUsuario);
                  },
                  child: const Text("Crear nuevo usuario")))),
    );
  }

  Future<Usuario?> _crearUsuario(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const RegistrarUsuarios();
        });
  }

  _mostrarUsuario(BuildContext context, Usuario? usuarioCreado) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return MostrarUsuarioAlert(
          usuarioCreado: usuarioCreado,
        );
      },
    );
  }
}
