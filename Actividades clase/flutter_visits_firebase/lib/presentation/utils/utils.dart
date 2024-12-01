import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_visits_firebase/presentation/bloc/visits/visits_bloc.dart';
import 'package:flutter_visits_firebase/presentation/widgets/dialog_add_visit.dart';
import 'package:flutter_visits_firebase/presentation/widgets/dialog_logout.dart';

const List<String> tiposVisitas = <String>[
  'Reunion',
  'Presentación',
  'Entrevista'
];

Future<void> mostrarDialogoTema(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return BlocProvider.value(
        value: BlocProvider.of<VisitsBloc>(context),
        child: const DialogoAddVisit(),
      );
    },
  );
}


Future<void> mostrarLogOut(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return const LogOutUser();
      });
}