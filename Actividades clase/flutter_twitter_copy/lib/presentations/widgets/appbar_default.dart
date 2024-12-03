import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_twitter_copy/presentations/blocs/auth/auth_bloc.dart';
import 'package:flutter_twitter_copy/presentations/blocs/auth/auth_state.dart';

class AppBarDefault extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const AppBarDefault({
    super.key,
    required this.scaffoldKey,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state.isLoading) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return AppBar(
          title: Row(
            children: [
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Incidencies',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "IES l'Estació",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                scaffoldKey.currentState?.openEndDrawer();
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(16),
              ),
              child: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage(state.user!.avatar!),
                          ),
            ),
          ],
        );
      }
    });
  }
}
