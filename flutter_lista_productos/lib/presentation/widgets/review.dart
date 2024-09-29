import 'package:flutter/material.dart';
import '../../../data/products.dart';

class Review extends StatelessWidget {
  final int productoId;
  const Review({super.key, required this.productoId});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Card(
              margin: const EdgeInsets.all(20),
              color: Colors.yellow,
              child: Text(products[productoId]['description']),
            ),
          ),
          const Text(
            "Reviews",
            textDirection: TextDirection.ltr,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: products[productoId]['reviews'].length,
                itemBuilder: (BuildContext context, int indexReview) {
                  return SizedBox(
                    height: 100,
                    child: Card(
                      color: Colors.green,
                      margin: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                products[productoId]['reviews'][indexReview]
                                    ["reviewerName"],
                                textDirection: TextDirection.ltr,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Text(
                                "Raiting: ${products[productoId]['reviews'][indexReview]["rating"].toString()}",
                                textDirection: TextDirection.ltr,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Center(
                              child: Text(products[productoId]['reviews']
                                  [indexReview]["comment"]))
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
