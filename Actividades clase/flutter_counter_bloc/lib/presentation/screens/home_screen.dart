import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/counter/counter_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/counter/counter_event.dart';
import 'package:flutter_counter_bloc/presentation/blocs/counter/counter_state.dart';

import 'package:flutter_counter_bloc/presentation/config/theme/app_theme.dart';
import 'package:flutter_counter_bloc/presentation/widgets/counter_buttons.dart';
import 'package:flutter_counter_bloc/presentation/widgets/dialog_theme.dart';
import 'package:flutter_counter_bloc/presentation/widgets/menu_lateral.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final appTheme = AppTheme();
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
              return Text("Total de transaciones ${state.transactionCount}");
            }),
          ),
          body: Center(child:
              BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
            return Text("Cuenta ${state.counter}");
          })),
          floatingActionButton: const CounterButtons(),
          drawer: const MenuLateral(),
        );
  }

}
