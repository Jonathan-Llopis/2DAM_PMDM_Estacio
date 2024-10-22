import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_harry_potter_clean_arch/config/theme/app_theme.dart';
import 'package:flutter_harry_potter_clean_arch/presentation/blocs/theme/theme_bloc.dart';
import 'package:flutter_harry_potter_clean_arch/presentation/widgets/dialog_fonts.dart';
import 'package:flutter_harry_potter_clean_arch/presentation/widgets/dialog_theme.dart';




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
                DrawerHeader(
                  child: Text("Menu lateral")),
              ],
            ),
          ),
          TextButton(
              onPressed: () async {
                await _mostrarDialogoTema(context);
                Navigator.pop(context);
              },
              child: const Text("Cambiar Tema", style: TextStyle(fontSize: 18),)),
              TextButton(
              onPressed: () async {
                await _mostrarDialogoFuentes(context);
                Navigator.pop(context);
              },
              child: const Text("Cambiar Fuente",style: TextStyle(fontSize: 18),))
        ],
      ),
    );
  }

  Future<void> _mostrarDialogoTema(BuildContext context) {
    return showDialog(
        context: context, 
        builder: (context) {
          return const DialogoTheme();
        });
  }
  Future<void> _mostrarDialogoFuentes(BuildContext context) {
    return showDialog(
        context: context, 
        builder: (context) {
          return const DialogoFuentes();
        });
  }
}
