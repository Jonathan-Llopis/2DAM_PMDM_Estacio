import 'package:flutter/material.dart';
import 'package:flutter_dialogos_2/infraestructure/models/usuario.dart';

class MostrarUsuarioAlert extends StatelessWidget {
  final Usuario? usuarioCreado;
  const MostrarUsuarioAlert({
    super.key,
    required this.usuarioCreado,
  });

  @override
  Widget build(BuildContext context) {
    var texto = "";
    if (usuarioCreado == null) {
      texto = "El usuario no se ha creado.";
    } else {
      texto = "Usuario creado: \n ${usuarioCreado!.mostrarUsuario()}";
    }
    return AlertDialog(
      title: const Text("Usuario Creado"),
      content: Text(texto),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Acceptar"))
      ],
    );
  }
}
