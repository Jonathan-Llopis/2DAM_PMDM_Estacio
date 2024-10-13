import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dialogos_2/infraestructure/models/usuario.dart';
import 'package:flutter_dialogos_2/presentation/widgets/errores_alert.dart';

class RegistrarUsuarios extends StatefulWidget {
  const RegistrarUsuarios({super.key});

  @override
  State<RegistrarUsuarios> createState() => _RegistrarUsuarios();
}

class _RegistrarUsuarios extends State<RegistrarUsuarios> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _appellidoController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  int _sexoValue = 1;
  String _sexo = "Hombre";
  bool isCheckedDeporte = false;
  bool isCheckedLectura = false;
  bool isCheckedCocinar = false;
  bool isCheckedJuegos = false;
  bool isCheckedViajar = false;
  final _hobbies = [];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      const Text(
                        'Nombre:',
                        style: TextStyle(fontSize: 20),
                      ),
                      TextFormField(
                        controller: _nomController,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Debe introducir un nombre.';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Introduce tu nombre',
                          labelText: "Nombre: ",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      const Text(
                        'Apellido:',
                        style: TextStyle(fontSize: 20),
                      ),
                      TextFormField(
                        controller: _appellidoController,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Debe introducir un apellido.';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Introduce tu Apellido',
                          labelText: "Apellido: ",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      const Text(
                        'Edad:',
                        style: TextStyle(fontSize: 20),
                      ),
                      TextFormField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                        controller: _edadController,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Debe introducir una edad.';
                          } else {
                            if (int.parse(_edadController.text) < 18) {
                              return 'Debe ser mayor de edad.';
                            }
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Introduce tu Edad',
                          labelText: "Edad: ",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      const Text(
                        'Email:',
                        style: TextStyle(fontSize: 20),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Debe introducir una email.';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Introduce tu Email',
                          labelText: "Email: ",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      const Text(
                        'Sexo:',
                        style: TextStyle(fontSize: 20),
                      ),
                      Row(
                        children: [
                          Radio<int>(
                            value: 1,
                            groupValue: _sexoValue,
                            onChanged: (int? newValue) {
                              _sexo = "Hombre";
                              setState(() {
                                _sexoValue = newValue!;
                              });
                            },
                          ),
                          const Text('Hombre'),
                          Radio<int>(
                            value: 0,
                            groupValue: _sexoValue,
                            onChanged: (int? newValue) {
                              _sexo = "Mujer";
                              setState(() {
                                _sexoValue = newValue!;
                              });
                            },
                          ),
                          const Text('Mujer'),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      const Text(
                        'Aficiones:',
                        style: TextStyle(fontSize: 20),
                      ),
                      CheckboxListTile(
                        title: const Text('Deportes'),
                        value: isCheckedDeporte,
                        onChanged: (bool? value) {
                          setState(() {
                            if (value == true) {
                              _hobbies.add("deporte");
                            } else {
                              _hobbies.remove("deporte");
                            }
                            setState(() {
                              isCheckedDeporte = value!;
                            });
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Lectura'),
                        value: isCheckedLectura,
                        onChanged: (bool? value) {
                          setState(() {
                            if (value == true) {
                              _hobbies.add("lectura");
                            } else {
                              _hobbies.remove("lectura");
                            }
                            setState(() {
                              isCheckedLectura = value!;
                            });
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Deportes'),
                        value: isCheckedCocinar,
                        onChanged: (bool? value) {
                          setState(() {
                            if (value == true) {
                              _hobbies.add("cocinar");
                            } else {
                              _hobbies.remove("cocinar");
                            }
                            setState(() {
                              isCheckedCocinar = value!;
                            });
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('VideoJuegos'),
                        value: isCheckedJuegos,
                        onChanged: (bool? value) {
                          setState(() {
                            if (value == true) {
                              _hobbies.add("juegos");
                            } else {
                              _hobbies.remove("juegos");
                            }
                            setState(() {
                              isCheckedJuegos = value!;
                            });
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Viajar'),
                        value: isCheckedViajar,
                        onChanged: (bool? value) {
                          setState(() {
                            if (value == true) {
                              _hobbies.add("viajar");
                            } else {
                              _hobbies.remove("viajar");
                            }
                            setState(() {
                              isCheckedViajar = value!;
                            });
                          });
                        },
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              String mensajeError =
                                  "";
                              if (!_formKey.currentState!.validate()) {
                                if (_edadController.text.isNotEmpty &&
                                    int.parse(_edadController.text) < 18) {
                                  mensajeError =
                                      "Debes ser mayor de edad para registrarse.";
                                  _mostrarErrores(context, mensajeError);
                                } else {
                                  mensajeError =
                                      "Hay campos requeridos sin completar.";
                                   _mostrarErrores(context, mensajeError);
                                }
                              } else {
                                if (_hobbies.isEmpty) {
                                  mensajeError =
                                      "Debes elegir al menos una afición.";
                                   _mostrarErrores(context, mensajeError);
                                } else {
                                  Usuario nuevoUsuario = Usuario(
                                      _nomController.text,
                                      _appellidoController.text,
                                      int.parse(_edadController.text),
                                      _emailController.text,
                                      _sexo,
                                      _hobbies);
                                  Navigator.pop(context, nuevoUsuario);
                                }
                              }
                            },
                            child: const Text('Registrar Usuario'),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, null);
                              },
                              child: const Text("Cancelar"))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _mostrarErrores(BuildContext context, String error) {
    return showDialog(
        context: context,
        builder: (context) {
          return ErroresAlert(errorCreacion: error);
        });
  }
}
