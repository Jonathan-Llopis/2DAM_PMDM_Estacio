import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_visits_firebase/presentation/bloc/visits/visits_bloc.dart';
import 'package:flutter_visits_firebase/presentation/bloc/visits/visits_event.dart';
import 'package:flutter_visits_firebase/presentation/bloc/visits/visits_state.dart';
import 'package:flutter_visits_firebase/presentation/widgets/app_bar.dart';
import 'package:flutter_visits_firebase/presentation/utils/utils.dart';

String motivoVisitaFilter = "Sin Filtros";

class VisitsScreen extends StatefulWidget {
  const VisitsScreen({super.key});

  @override
  State<VisitsScreen> createState() => _VisitsScreenState();
}

class _VisitsScreenState extends State<VisitsScreen> {
  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBarDefault(scaffoldKey: scaffoldKey),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          mostrarDialogoTema(context);
        },
      ),
      body: BlocBuilder<VisitsBloc, VisitsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.errorMessage != null) {
            return Center(child: Text(state.errorMessage!));
          }
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownMenu<String>(
                      initialSelection: motivoVisitaFilter,
                      onSelected: (String? value) {
                        context.read<VisitsBloc>().add(LoadVisitsEvent(value));
                        setState(() {
                          motivoVisitaFilter = value!;
                        });
                      },
                      dropdownMenuEntries: tiposVisitas
                          .map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(
                            value: value, label: value);
                      }).toList(),
                    ),
                    IconButton(
                        onPressed: () {
                          context.read<VisitsBloc>().add(LoadVisitsEvent(null));
                        },
                        icon: const Icon(Icons.clear_outlined))
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.visits.length,
                    itemBuilder: (context, index) {
                      final visit = state.visits[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    visit.nombreVisitante,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    visit.emailVisitante,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(
                                        "Día: ${visit.fechaVisita}",
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                      const SizedBox(width: 20),
                                      Text(
                                        "(${visit.horaIniVisita} - ${visit.horaFinVisita})",
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: visit.motivoVisita == tiposVisitas[0]
                                        ? Colors.purple
                                        : (visit.motivoVisita == tiposVisitas[1]
                                            ? Colors.lightBlue
                                            : Colors.orange),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                      child: Image(
                                    image: AssetImage(visit.motivoVisita ==
                                            tiposVisitas[0]
                                        ? 'lib/assets/images/reunion.png'
                                        : (visit.motivoVisita == tiposVisitas[1]
                                            ? 'lib/assets/images/conferencia.png'
                                            : 'lib/assets/images/entrevista.png')),
                                  )),
                                ),
                                const SizedBox(height: 12),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () {
                                    context
                                        .read<VisitsBloc>()
                                        .add(DeleteVisitEvent(visit.id));
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
