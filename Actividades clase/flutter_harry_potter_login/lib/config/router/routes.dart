import 'package:flutter_harry_potter_login/presentation/screens/login_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_harry_potter_login/domain/repositories/login_repository.dart';
import 'package:flutter_harry_potter_login/presentation/screens/characters_screen.dart';
import 'package:flutter_harry_potter_login/injection_container.dart'
    as di;

final GoRouter router = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      name:"login",
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
     GoRoute(
      name:"home",
      path: '/home',
      builder: (context, state) => const CharactersScreen(),
    ),
  ],
  redirect: (context, state) async {
    final isLoggedIn = await di.sl<LoginRepository>().isLoggedIn();
    return isLoggedIn.fold((_) => '/login', (loggedIn) {
      if (!loggedIn && !state.matchedLocation.contains("/login")) {
        return "/login";
      } else {
        return state.matchedLocation;
      }
    });
  },
);
