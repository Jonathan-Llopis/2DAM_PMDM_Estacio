import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_visits_firebase/domain/entities/visits.dart';
import 'package:flutter_visits_firebase/presentation/bloc/visits/visits_bloc.dart';
import 'package:flutter_visits_firebase/presentation/bloc/visits/visits_event.dart';
import 'package:flutter_visits_firebase/presentation/utils/utils.dart';

int selectedColor = 0;
bool darkMode = false;
String selectedFont = "DMSerif";

class DialogoAddVisit extends StatefulWidget {
  const DialogoAddVisit({super.key});

  @override
  State<DialogoAddVisit> createState() => _DialogoAddVisitState();
}

class _DialogoAddVisitState extends State<DialogoAddVisit> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int? propositoVisita = 0;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController horaInicioController = TextEditingController();
  final TextEditingController horaFinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Text(
            "Agregar Nueva Visita",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Form(
              key: _formKey,
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 250,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          DropdownButtonFormField<int>(
                            value: propositoVisita,
                            items: tiposVisitas.map((String value) {
                              return DropdownMenuItem<int>(
                                value: tiposVisitas.indexOf(value),
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                propositoVisita = newValue!;
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Por favor, seleccione un estado';
                              }
                              return null;
                            },
                          ),
                          Expanded(
                            child: TextFormField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  hintText: 'Introduce tu nombre',
                                ),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'El nombre es obligatorio';
                                  }
                                  return null;
                                }),
                          ),
                          Expanded(
                            child: TextFormField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                  hintText: 'Introduce tu Email',
                                ),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'El email es obligatorio';
                                  }
                                  return null;
                                }),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                    controller: horaInicioController,
                                    decoration: const InputDecoration(
                                      hintText: 'Hora de inicio',
                                    ),
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'La hora de inicio es obligatoria';
                                      }
                                      final RegExp horaRegex = RegExp(
                                          r'^([01][0-9]|2[0-3]):[0-5][0-9]$');
                                      if (!horaRegex.hasMatch(value)) {
                                        return 'La hora debe tener el formato hh:mm';
                                      }

                                      return null;
                                    }),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: TextFormField(
                                    controller: horaFinController,
                                    decoration: const InputDecoration(
                                      hintText: 'Hora Fin',
                                    ),
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'La hora de fin es obligatoria';
                                      }
                                      final RegExp horaRegex = RegExp(
                                          r'^([01][0-9]|2[0-3]):[0-5][0-9]$');
                                      if (!horaRegex.hasMatch(value)) {
                                        return 'La hora debe tener el formato hh:mm';
                                      }
                                      return null;
                                    }),
                              )
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancelar',
                                    style: TextStyle(color: Colors.white)),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<VisitsBloc>().add(
                                        AddVisitEvent(VisitEntity(
                                            id: DateTime.now().toString(),
                                            nombreVisitante:
                                                nameController.text,
                                            emailVisitante:
                                                emailController.text,
                                            motivoVisita:
                                                tiposVisitas[propositoVisita!],
                                            fechaVisita:
                                                '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',
                                            horaIniVisita:
                                                horaInicioController.text,
                                            horaFinVisita:
                                                horaFinController.text)));
                                    Navigator.pop(context);
                                  }
                                },
                                child: const Text(
                                  'Aceptar',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ]),
                  )))
        ]),
      ),
    );
  }
}
