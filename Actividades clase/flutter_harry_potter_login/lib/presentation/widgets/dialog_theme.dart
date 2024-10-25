import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_harry_potter_login/presentation/blocs/theme/theme_bloc.dart';
import 'package:flutter_harry_potter_login/presentation/blocs/theme/theme_event.dart';
import 'package:flutter_harry_potter_login/presentation/blocs/theme/theme_state.dart';


int color = 0;
bool darkMode = false;

class DialogoTheme extends StatefulWidget {
  const DialogoTheme({super.key});

  @override
  State<DialogoTheme> createState() => _DialogoThemeState();
}

class _DialogoThemeState extends State<DialogoTheme> {
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
              const ListTile(title: Text("Menu del Tema")),
              BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  return SwitchListTile(
                    title: const Text("Modo Oscuro"),
                    value: darkMode,
                    onChanged: (bool? value) {
                      setState(() {
                        darkMode = value!;
                      });
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Temas de la aplicacion"),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        color: color == 0 ? Colors.black : Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            color = 0;
                            _cambiarDialog(color);
                          });
                        },
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(
                            'Azul',
                            style:
                                TextStyle(color: Colors.white, fontSize: 13.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        color: color == 1 ? Colors.black : Colors.teal,
                        borderRadius: BorderRadius.circular(
                            20),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            color = 1;
                            _cambiarDialog(color);
                          });
                        },
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(
                            'Cian',
                            style:
                                TextStyle(color: Colors.white, fontSize: 13.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        color: color == 2 ? Colors.black : Colors.green,
                        borderRadius: BorderRadius.circular(
                            20),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            color = 2;
                            _cambiarDialog(color);
                          });
                        },
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(
                            'Verde',
                            style:
                                TextStyle(color: Colors.white, fontSize: 13.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        color: color == 3 ? Colors.black : Colors.red,
                        borderRadius: BorderRadius.circular(
                            20), 
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            color = 3;
                            _cambiarDialog(color);
                          });
                        },
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(
                            'Rojo',
                            style:
                                TextStyle(color: Colors.white, fontSize: 13.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        color: color == 4 ? Colors.black : Colors.purple,
                        borderRadius: BorderRadius.circular(
                            20), 
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            color = 4;
                            _cambiarDialog(color);
                          });
                        },
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(
                            'Morado',
                            style:
                                TextStyle(color: Colors.white, fontSize: 13.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        color: color == 5 ? Colors.black : Colors.deepPurple,
                        borderRadius: BorderRadius.circular(
                            20), 
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            color = 5;
                            _cambiarDialog(color);
                          });
                        },
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(
                            'Purpura',
                            style:
                                TextStyle(color: Colors.white, fontSize: 13.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        color: color == 6 ? Colors.black : Colors.orange,
                        borderRadius: BorderRadius.circular(
                            20), 
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            color = 6;
                            _cambiarDialog(color);
                          });
                        },
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(
                            'Naranja',
                            style:
                                TextStyle(color: Colors.white, fontSize: 13.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        color: color == 7 ? Colors.black : Colors.pink,
                        borderRadius: BorderRadius.circular(
                            20),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            color = 7;
                            _cambiarDialog(color);
                          });
                        },
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(
                            'Rosa',
                            style:
                                TextStyle(color: Colors.white, fontSize: 13.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        color: color == 08 ? Colors.black : Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(
                            20), 
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            color = 8;
                            _cambiarDialog(color);
                          });
                        },
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(
                            'Fucsia',
                            style:
                                TextStyle(color: Colors.white, fontSize: 13.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        color: color == 9 ? Colors.black : Colors.grey,
                        borderRadius: BorderRadius.circular(
                            20),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            color = 9;
                            _cambiarDialog(color);
                          });
                        },
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(
                            'Gris',
                            style:
                                TextStyle(color: Colors.white, fontSize: 13.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
                              .add(ChangeTheme(color: color));
                    
                          context
                              .read<ThemeBloc>()
                              .add(ChangeDarkMode(darkMode: darkMode));
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

  Future<void> _cambiarDialog(int color) async {
    context.read<ThemeBloc>().add(ChangeDialog(dialogColor: color));
  }
}
