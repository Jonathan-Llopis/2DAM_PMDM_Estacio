import 'package:flutter/material.dart';
import '../../../data/products.dart';
import 'package:flutter_lista_productos/presentation/widgets/review.dart';
import 'package:go_router/go_router.dart';

class ProductoReview extends StatelessWidget {
  final int productoId;
  const ProductoReview({super.key, required this.productoId});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            title: Row(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.go('/');
                  },
                  child: const Icon(Icons.arrow_back),
                ),
                const SizedBox(
                                width: 40,
                              ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      products[productoId]["title"]!,
                      textDirection: TextDirection.ltr,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text("${products[productoId]["price"]}€",
                        textDirection: TextDirection.ltr),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    products[productoId]["images"][0],
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          body: Review(productoId: productoId)),
    );
  }
}
