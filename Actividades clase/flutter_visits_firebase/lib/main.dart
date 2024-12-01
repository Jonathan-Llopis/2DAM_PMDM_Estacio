import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_visits_firebase/config/router/routes.dart';
import 'package:flutter_visits_firebase/firebase_options.dart';
import 'package:flutter_visits_firebase/injection.dart';
import 'package:flutter_visits_firebase/presentation/bloc/auth/login_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  injectDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginBloc>(),
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        title: 'Ejemplo de Login con Firebase',
        theme: ThemeData(primarySwatch: Colors.blue),
      ),
    );
  }
}
