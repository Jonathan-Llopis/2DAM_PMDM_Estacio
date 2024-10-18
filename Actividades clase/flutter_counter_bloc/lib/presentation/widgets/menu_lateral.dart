import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/counter/counter_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/counter/counter_event.dart';
import 'package:flutter_counter_bloc/presentation/blocs/theme/theme_bloc.dart';
import 'package:flutter_counter_bloc/presentation/config/theme/app_theme.dart';

import 'package:flutter_counter_bloc/presentation/widgets/dialog_theme.dart';



class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
     final themeBloc = BlocProvider.of<ThemeBloc>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
             decoration: BoxDecoration(
                color: AppTheme.colorList[themeBloc.state.color],
                      ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DrawerHeader(child: Text("Menu lateral")),
              ],
            ),
          ),
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
        context: context, 
        builder: (context) {
          return const DialogoTheme();
        });
  }
}
