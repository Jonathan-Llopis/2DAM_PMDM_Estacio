import 'package:flutter/material.dart';
import 'package:flutter_formularios_1/presentation/widgets/generador_robots.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text("Generador de Robots")),
          body: const Center(
            child: GeneradorRobots()
          
          )),
    );
  }
}
