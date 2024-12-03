import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_twitter_copy/domain/entities/user.dart';
import 'package:flutter_twitter_copy/presentations/blocs/auth/auth_event.dart';
import 'package:flutter_twitter_copy/presentations/blocs/auth/auth_state.dart';

import '../blocs/auth/auth_bloc.dart';

class UserSearch extends StatefulWidget {
  const UserSearch({
    super.key,
  });

  @override
  State<UserSearch> createState() => _UserSearchState();
}

class _UserSearchState extends State<UserSearch> {
  String? buscador;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state.isLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state.errorMessage.isNotEmpty) {
        return Center(child: Text(state.errorMessage));
      } else {
        return SliverAppBar(
            actions: <Widget>[Container()],
            clipBehavior: Clip.none,
            shape: const StadiumBorder(),
            scrolledUnderElevation: 0.0,
            titleSpacing: 0.0,
            backgroundColor: Colors.lightBlue,
            floating: true,
            iconTheme: IconThemeData(color: Colors.black),
            title: SearchAnchor.bar(
              barHintText: 'Buscar usuarios',
              viewBackgroundColor: Colors.lightBlue,
              suggestionsBuilder:
                  (BuildContext context, SearchController controller) async {
                buscador = controller.text;
                final List<User> usersBuscador = state.users
                    .where((user) => user.username
                        .toLowerCase()
                        .contains(buscador!.toLowerCase()))
                    .toList();
                if (usersBuscador.isEmpty) {
                  return List<ListTile>.generate(1, (int index) {
                    return ListTile(
                      title: Text("No hay resultados para $buscador"),
                    );
                  });
                }
                return usersBuscador.map((user) {
                  return ListTile(
                    title: Text(user.username),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(user.avatar ?? ''),
                    ),
                    trailing: state.user!.following.contains(user.id)
                        ? IconButton(
                            icon: const Icon(Icons.person_pin),
                            onPressed: () {},
                          )
                        : IconButton(
                            icon: const Icon(Icons.person_add_rounded),
                            onPressed: () {
                              context.read<AuthBloc>().add(
                                  FollowUserUseCaseEvent(
                                      user.id, state.user!.id));
                              setState(() {});
                            },
                          ),
                  );
                }).toList();
              },
            ));
      }
    });
  }
}
