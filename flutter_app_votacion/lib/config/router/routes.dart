
import 'package:flutter_app_votacion/presentation/screens/home_screen.dart';
import 'package:flutter_app_votacion/presentation/screens/yes_no_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: 'home',
      path: '/', // Ruta raíz o Home
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: 'yesNoScreen',
      path: '/yesNoScreen/:votacion', // Ruta raíz o Home
      builder: (context, state){
        final bool votacion = state.pathParameters['votacion'] == 'true';
        return YesNoScreen(votacion: votacion);
      },
    ),
  ],
);
