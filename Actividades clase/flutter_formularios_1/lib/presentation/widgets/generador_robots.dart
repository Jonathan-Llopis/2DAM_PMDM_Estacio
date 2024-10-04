import 'package:flutter/material.dart';

class GeneradorRobots extends StatefulWidget {
  const GeneradorRobots({super.key});

  @override
  State<GeneradorRobots> createState() => _GeneradorRobots();
}

class _GeneradorRobots extends State<GeneradorRobots> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  String rutaRobot = "https://robohash.org/NOMBRE_INTRODUCIDO";
  @override
  Widget build(BuildContext context) {
  

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  const Text("Nombre:", style: TextStyle(fontSize: 20),),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: TextFormField(
                      controller: _nameController,
                      validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Debe introducir un nombre para generar el robot';
                    }
                    return null;
                  },
                      decoration: const InputDecoration(
                        hintText: 'Introduce tu nombre',labelText: "Nombre: ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      String mensajeRespuesta =
                          "Robot actualizado con el nombre ${_nameController.text}";
                      if (!_formKey.currentState!.validate()) {
                        mensajeRespuesta =
                            "Debe introducir un nombre para generar el robot";
                            ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(mensajeRespuesta)),
                      );
                            
                      }else{
                         ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(mensajeRespuesta)),
                      );
                      setState(() {
                        rutaRobot = "https://robohash.org/${_nameController.text}";
                      });
                      }
                     
                    },
                    child: const Text('Generar Robot'),
                  ),
                ],
              ),
              Center(
                child: Image.network(
                  rutaRobot,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Eliminar el controlador cuando el widget desaparece
    _nameController.dispose();
    super.dispose();
  }
}
