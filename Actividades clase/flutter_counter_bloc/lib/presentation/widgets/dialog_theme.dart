import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/theme/theme_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/theme/theme_event.dart';
import 'package:flutter_counter_bloc/presentation/blocs/theme/theme_state.dart';

class DialogoTheme extends StatefulWidget {
  const DialogoTheme({super.key});

  @override
  State<DialogoTheme> createState() => _DialogoThemeState();
}

class _DialogoThemeState extends State<DialogoTheme> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 300, vertical: 300),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              const Text("Menu del Tema"),
              BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  return SwitchListTile(
                    title: const Text("Modo Oscuro"),
                    value: darkMode,
                    onChanged: (bool? value) {
                      setState(() {
                        darkMode = value!;
                        context
                            .read<ThemeBloc>()
                            .add(ChangeDarkMode(darkMode: darkMode));
                      });
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Temas de la aplicacion"),
              Wrap(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(
                          20), // Ajusta el radio para hacer los bordes más redondeados
                    ),
                    child: TextButton(
                      onPressed: () {
                        context
                            .read<ThemeBloc>()
                            .add(const ChangeTheme(color: 0));
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(
                          'Azul',
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                      ),
                    ),
                  ),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(
                          20), // Ajusta el radio para hacer los bordes más redondeados
                    ),
                    child: TextButton(
                      onPressed: () {
                        context
                            .read<ThemeBloc>()
                            .add(const ChangeTheme(color: 1));
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(
                          'Azul',
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(
                          20), // Ajusta el radio para hacer los bordes más redondeados
                    ),
                    child: TextButton(
                      onPressed: () {
                        context
                            .read<ThemeBloc>()
                            .add(const ChangeTheme(color: 2));
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(
                          'Azul',
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(
                          20), // Ajusta el radio para hacer los bordes más redondeados
                    ),
                    child: TextButton(
                      onPressed: () {
                        context
                            .read<ThemeBloc>()
                            .add(const ChangeTheme(color: 3));
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(
                          'Azul',
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(
                          20), // Ajusta el radio para hacer los bordes más redondeados
                    ),
                    child: TextButton(
                      onPressed: () {
                        context
                            .read<ThemeBloc>()
                            .add(const ChangeTheme(color: 4));
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(
                          'Azul',
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(
                          20), // Ajusta el radio para hacer los bordes más redondeados
                    ),
                    child: TextButton(
                      onPressed: () {
                        context
                            .read<ThemeBloc>()
                            .add(const ChangeTheme(color: 5));
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(
                          'Azul',
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(
                          20), // Ajusta el radio para hacer los bordes más redondeados
                    ),
                    child: TextButton(
                      onPressed: () {
                        context
                            .read<ThemeBloc>()
                            .add(const ChangeTheme(color: 6));
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(
                          'Azul',
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(
                          20), // Ajusta el radio para hacer los bordes más redondeados
                    ),
                    child: TextButton(
                      onPressed: () {context
                            .read<ThemeBloc>()
                            .add(const ChangeTheme(color: 7));},
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(
                          'Azul',
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(
                          20), // Ajusta el radio para hacer los bordes más redondeados
                    ),
                    child: TextButton(
                      onPressed: () {
                        context
                            .read<ThemeBloc>()
                            .add(const ChangeTheme(color: 8));
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(
                          'Azul',
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text("Acceptar"))
            ],
          ),
        ),
      ),
    );
  }
}
