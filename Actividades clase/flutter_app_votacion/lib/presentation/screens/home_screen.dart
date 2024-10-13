import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Votación",
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Ejemplo go_router",
              textDirection: TextDirection.ltr,
              style: TextStyle(fontFamily: 'Oswald',fontSize: 24),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  context.go('/yesNoScreen/true');
                },
                child: Container(
                  color: Colors.blue,
                  width: 200,
                  height: 100,
                  child: const Center(
                    child: Text(
                      "SI",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(fontFamily: 'Oswald',fontSize: 40),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  context.go('/yesNoScreen/false');
                },
                child: Container(
                  color: Colors.red,
                  width: 200,
                  height: 100,
                  child: const Center(
                    child: Text(
                      "NO",
                      textDirection: TextDirection.ltr,
                       style: TextStyle(fontFamily: 'Oswald',fontSize: 40),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
