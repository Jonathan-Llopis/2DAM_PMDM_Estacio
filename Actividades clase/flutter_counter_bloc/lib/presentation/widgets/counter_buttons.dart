import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/counter/counter_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/counter/counter_event.dart';
import 'package:flutter_counter_bloc/presentation/blocs/theme/theme_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/theme/theme_event.dart';

var contador = 0;

class CounterButtons extends StatelessWidget {
  const CounterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
            onPressed: () {
              counterBloc.add(const CounterIncreased(1));
              _cambiarFondo(context);
            },
            child: const Icon(Icons.add)),
        const SizedBox(
          height: 15,
        ),
        FloatingActionButton(
          onPressed: () {
            context.read<CounterBloc>().add(const CounterIncreased(-1));
            _cambiarFondo(context);
          },
          child: const Icon(Icons.remove),
        )
      ],
    );
  }
// Se añade un método que si el contador de transferencias es multiplo de 20 este va cambiando el color del fondo.
  void _cambiarFondo(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    final themeBloc = BlocProvider.of<ThemeBloc>(context);
    if (counterBloc.state.transactionCount % 20 == 0) {
      if (contador == 10) {
        contador = 0;
      }
      themeBloc.add(ChangeBackground(colorBackground: contador));
      contador++;
    }
  }
}
