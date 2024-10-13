import 'package:flutter/material.dart';
import 'package:flutter_lista_productos/presentation/widgets/productos.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista Productos'),
      ),
      body: const Producto()
    );
  }
}
