import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_twitter_copy/presentations/blocs/auth/auth_bloc.dart';
import 'package:flutter_twitter_copy/presentations/blocs/auth/auth_event.dart';
import 'package:flutter_twitter_copy/presentations/blocs/auth/auth_state.dart';
import 'package:flutter_twitter_copy/presentations/blocs/tweet/tweet_bloc.dart';
import 'package:flutter_twitter_copy/presentations/blocs/tweet/tweet_event.dart';
import 'package:flutter_twitter_copy/presentations/functions/show_dialogs_functions.dart';
import 'package:flutter_twitter_copy/presentations/widgets/appbar_default.dart';
import 'package:flutter_twitter_copy/presentations/widgets/menu_lateral.dart';
import 'package:flutter_twitter_copy/presentations/widgets/tweets_list.dart';
import 'package:flutter_twitter_copy/presentations/widgets/users_search.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(GetUserCaseEvent());
    context.read<TweetBloc>().add(GetTweetsUseCaseEvent());
    context.read<AuthBloc>().add(GetAllUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      context.read<AuthBloc>().add(GetAllUsersEvent());
      if (state.user == null || state.isLoading) {
        context.read<AuthBloc>().add(GetUserCaseEvent());
        return const CircularProgressIndicator();
      } else if (state.errorMessage.isNotEmpty) {
        return Text(state.errorMessage);
      } else {
        return Scaffold(
          key: scaffoldKey,
          body: CustomScrollView(slivers: <Widget>[
            UserSearch(),
            SliverFillRemaining(
              child: UserList(),
            ),
          ]),
          appBar: AppBarDefault(scaffoldKey: scaffoldKey),
          endDrawer: MenuLateral(),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              mostrarEditTweet(context, null);
            },
            backgroundColor: Colors.blue,
            icon: Icon(Icons.add),
            label: Text('Tweetar'),
            elevation: 4,
            highlightElevation: 8,
          ),
        );
      }
    });
  }
}
