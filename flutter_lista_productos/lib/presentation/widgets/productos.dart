import 'package:flutter/material.dart';
import '../../../data/products.dart';
import 'package:go_router/go_router.dart';

class Producto extends StatelessWidget {
  const Producto({super.key,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {
                  context.go('/productosReview/$index');
                },
                child: Card(
                  color: Colors.green,
                  margin: const EdgeInsets.all(8),
                  child: Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        products[index]["images"][0],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products[index]["title"]!,
                          textDirection: TextDirection.ltr,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${products[index]["price"]}€",
                          textDirection: TextDirection.ltr,
                        ),
                      ],
                    ),
                  ]),
                ));
          });
  }
}
