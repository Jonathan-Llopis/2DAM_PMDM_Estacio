import 'package:flutter/material.dart';
import 'package:flutter_lista_productos/config/router/router.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Future.delayed(const Duration(seconds:5),(){
    FlutterNativeSplash.remove();
  });

  runApp(MaterialApp.router(
    routerConfig: router, // Configuración de `go_router`
  ));
}
