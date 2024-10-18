 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/counter/counter_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/counter/counter_event.dart';
import 'package:flutter_counter_bloc/presentation/widgets/dialog_theme.dart';

class MenuLateral extends StatelessWidget {
   const MenuLateral({super.key});
 
   @override
   Widget build(BuildContext context) {
     return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(child: Text("Menu lateral")),
                TextButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(CounterReset());
                       Navigator.pop(context);
                    },
                    child: const Icon(Icons.refresh)),
                TextButton(
                    onPressed: () async {
                      await _mostrarDialogo(context);
                      Navigator.pop(context);
                    },
                    child: const Text("Cambiar Thema"))
              ],
            ),
          );
   }

  Future<void> _mostrarDialogo(BuildContext context) {
    return showDialog(
        context: context, // Proporcionamos el contexto
        builder: (context) {
          // Y la función builder que construye el diálogo
          return const DialogoTheme();
          
        });
  }
 }