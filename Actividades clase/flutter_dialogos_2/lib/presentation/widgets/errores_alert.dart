import 'package:flutter/material.dart';

class ErroresAlert extends StatelessWidget {
  final String errorCreacion;
  const ErroresAlert({
    super.key,
    required this.errorCreacion,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Usuario Creado"),
      content: Text(errorCreacion),
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
