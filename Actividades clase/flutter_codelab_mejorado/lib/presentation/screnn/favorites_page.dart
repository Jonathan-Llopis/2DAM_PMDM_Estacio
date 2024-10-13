import 'package:flutter/material.dart';
import 'package:flutter_colab_mejorado/presentation/widgets/my_app_state.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var listaFavoritos = context.watch<MyAppState>().favorites;
    if (listaFavoritos.isEmpty) {
      return Center(
        child: Text("No hay favoritos."),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text("Tienes ${listaFavoritos.length} favoritos."),
        ),
        for (var fav in listaFavoritos)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(fav.asLowerCase),
          )
      ],
    );
  }
}
