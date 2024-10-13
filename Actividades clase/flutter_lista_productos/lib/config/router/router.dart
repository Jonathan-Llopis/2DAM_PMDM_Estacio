import 'package:flutter_lista_productos/presentation/screens/home_screen.dart';
import 'package:flutter_lista_productos/presentation/screens/producto_review.dart';
import 'package:go_router/go_router.dart';

// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
         builder: (context, state) => const HomeScreen(),),
   GoRoute(
      name: 'productosReview',
      path: '/productosReview/:productoId', // Ruta raíz o Home
      builder: (context, state){
        final int productoId =  int.parse(state.pathParameters['productoId']!);
        return ProductoReview(productoId: productoId);
      },
    ),
  ],
);