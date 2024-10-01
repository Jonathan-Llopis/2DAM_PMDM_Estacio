import 'package:flutter/material.dart';
import 'package:flutter_ejemplo_gestion_tema/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double _currentSliderValue = 0;
  bool darkMode = false;
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme(
        selectedColor: _currentSliderValue.round(), isDarkmode: darkMode);

    return MaterialApp(
      theme: appTheme.getTheme(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Ejemplo con ThemeData",
            textDirection: TextDirection.ltr,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Slider(
                value: _currentSliderValue,
                max: 8,
                divisions: 9,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                    appTheme.selectedColor = _currentSliderValue.round();
                  });
                },
              ),
              SwitchListTile(
                  title: const Text("Modo Oscuro"),
                  value: darkMode,
                  onChanged: (bool? value) {
                    setState(() {
                      darkMode = value!;
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
