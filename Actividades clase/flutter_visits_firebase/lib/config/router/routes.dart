import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_visits_firebase/domain/repositories/sign_in_repository.dart';
import 'package:flutter_visits_firebase/injection.dart';
import 'package:flutter_visits_firebase/presentation/bloc/visits/visits_bloc.dart';
import 'package:flutter_visits_firebase/presentation/bloc/visits/visits_event.dart';
import 'package:flutter_visits_firebase/presentation/screens/login_page.dart';
import 'package:flutter_visits_firebase/presentation/screens/main_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/visits',
      builder: (context, state) => BlocProvider(
        create: (_) {
          VisitsBloc visitsBloc = getIt<VisitsBloc>();
          visitsBloc.add(StreamVisitsEvent());
          return visitsBloc;
        },
        child: const VisitsScreen(),
      ),
    )
  ],
  redirect: (context, state) async {
    final isLoggedIn = await getIt<SignInRepository>().isLoggedIn();
    return isLoggedIn.fold((_) => '/login', (loggedIn) {
      if (loggedIn == "NO_USER" && !state.matchedLocation.contains("/login")) {
        return "/login";
      } else {
        return state.matchedLocation;
      }
    });
  },
);
