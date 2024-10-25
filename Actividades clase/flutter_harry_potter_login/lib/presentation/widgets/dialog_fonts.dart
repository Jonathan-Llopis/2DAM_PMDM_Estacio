import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_harry_potter_login/presentation/blocs/theme/theme_bloc.dart';
import 'package:flutter_harry_potter_login/presentation/blocs/theme/theme_event.dart';
import 'package:flutter_harry_potter_login/presentation/blocs/theme/theme_state.dart';

class DialogoFuentes extends StatefulWidget {
  const DialogoFuentes({super.key});

  @override
  State<DialogoFuentes> createState() => _DialogoFuentesState();
}

class _DialogoFuentesState extends State<DialogoFuentes> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _selectedValue = 1;
  String font = "";
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              const ListTile(
                title: Text("Menu de Fuentes"),
              ),
              const SizedBox(
                width: 20,
              ),
              BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
                return Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Radio(
                                value: 1,
                                groupValue: _selectedValue,
                                onChanged: (int? newValue) {
                                   setState(() {
                                    _selectedValue = newValue!;
                                    font = "Benne";
                                  });
                                }),
                            const Text(
                              "Fuente Benne",
                              style:
                                  TextStyle(fontFamily: "Benne", fontSize: 20),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 2,
                                groupValue: _selectedValue,
                                onChanged: (int? newValue) {
                                   setState(() {
                                    _selectedValue = newValue!;
                                    font = "Dumbledor1";
                                  });
                                }),
                            const Text(
                              "Fuente Dumbledor1",
                              style: TextStyle(
                                  fontFamily: "Dumbledor1", fontSize: 20),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 3,
                                groupValue: _selectedValue,
                                onChanged: (int? newValue) {
                                   setState(() {
                                    _selectedValue = newValue!;
                                    font = "Dumbledor2";
                                  });
                                }),
                            const Text(
                              "Fuente Dumbledor2",
                              style: TextStyle(
                                  fontFamily: "Dumbledor2", fontSize: 20),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 4,
                                groupValue: _selectedValue,
                                onChanged: (int? newValue) {
                                   setState(() {
                                    _selectedValue = newValue!;
                                    font = "Dumbledor3";
                                  });
                                }),
                            const Text(
                              "Fuente Dumbledor3",
                              style: TextStyle(
                                  fontFamily: "Dumbledor3", fontSize: 20),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 5,
                                groupValue: _selectedValue,
                                onChanged: (int? newValue) {
                                   setState(() {
                                    _selectedValue = newValue!;
                                    font = "Harry";
                                  });
                                }),
                            const Text(
                              "Fuente Harry",
                              style:
                                  TextStyle(fontFamily: "Harry", fontSize: 20),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 6,
                                groupValue: _selectedValue,
                                onChanged: (int? newValue) {
                                   setState(() {
                                    _selectedValue = newValue!;
                                    font = "Lumos";
                                  });
                                }),
                            const Text(
                              "Fuente Lumos",
                              style:
                                  TextStyle(fontFamily: "Lumos", fontSize: 20),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 7,
                                groupValue: _selectedValue,
                                onChanged: (int? newValue) {
                                   setState(() {
                                    _selectedValue = newValue!;
                                    font = "MagicSchool1";
                                  });
                                }),
                            const Text(
                              "Fuente MagicSchool1",
                              style: TextStyle(
                                  fontFamily: "MagicSchool1", fontSize: 20),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 8,
                                groupValue: _selectedValue,
                                onChanged: (int? newValue) {
                                  setState(() {
                                    _selectedValue = newValue!;
                                    font = "MagicSchool2";
                                  });
                                }),
                            const Text(
                              "Fuente MagicSchool2",
                              style: TextStyle(
                                  fontFamily: "MagicSchool2", fontSize: 20),
                            )
                          ],
                        ),
                      ],
                    ));
                    
              }),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Container(
                     decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            20,), 
                      ),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancelar")),
                  ),
                  const SizedBox( width: 8,),
                  Container(
                     decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            20),
                      ),

                    child: TextButton(
                        onPressed: () {
                          context
                              .read<ThemeBloc>()
                              .add(ChangeFont(font: font));
                    
                          Navigator.pop(context);
                        },
                        child: const Text("Acceptar")),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
