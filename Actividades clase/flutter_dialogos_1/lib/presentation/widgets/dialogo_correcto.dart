import 'package:flutter/material.dart';

class DialogoRobot extends StatelessWidget {
  final bool resultado;
  const DialogoRobot({super.key, required this.resultado});

  @override
  Widget build(BuildContext context) {
    var imagen = "";
    var texto = "";
    if (resultado) {
      texto = "Generación Satisfactoria.";
      imagen =
          "./assets/images/ok.jpg";
    } else {
      texto = "Generación erronea.";
      imagen =
          "./assets/images/no.jpg";
    
    }
    return SimpleDialog(
      title: const Center(child: Text('Generacion de robot finalizada.')),
      children: <Widget>[
            Column(
          children: [
            Text(texto),
            Image.asset(imagen,width: 200,height: 200,)
          ],
        ),
      ],
    );
  }
}
