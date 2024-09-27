import 'package:flutter/material.dart';
import 'package:flutter_app_votacion/presentation/Widget/yes_no.dart';
import 'package:go_router/go_router.dart';

class YesNoScreen extends StatelessWidget {
  final bool votacion;
  const YesNoScreen({required this.votacion, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Votación",
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Row(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.go('/');
                  },
                  child: const Icon(Icons.arrow_back),
                ),
                
                const Text(
                  "Has Votado:",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(fontFamily: 'Oswald',fontSize: 40),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: YesNo(votacion: votacion),
        ),
      ),
    );
  }
}
