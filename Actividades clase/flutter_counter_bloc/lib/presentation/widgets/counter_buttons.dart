import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/counter/counter_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/counter/counter_event.dart';

class CounterButtons extends StatelessWidget {
  const CounterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(onPressed: () {context.read<CounterBloc>().add(const CounterIncreased(1));} , child: const Icon(Icons.add)),

                const SizedBox(height: 15,),
                FloatingActionButton(onPressed: (){context.read<CounterBloc>().add(const CounterIncreased(-1));},
                child: const Icon(Icons.remove),)
              ],
            );
  }
}