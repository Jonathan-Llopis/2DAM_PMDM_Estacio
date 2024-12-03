import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_twitter_copy/domain/entities/tweet.dart';
import 'package:flutter_twitter_copy/presentations/blocs/tweet/tweet_bloc.dart';
import 'package:flutter_twitter_copy/presentations/blocs/tweet/tweet_state.dart';
import 'package:flutter_twitter_copy/presentations/widgets/item_list_tweet.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TweetBloc, TweetState>(builder: (context, state) {
      if (state.isLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state.errorMessage.isNotEmpty) {
        return Center(child: Text(state.errorMessage));
      } else if (state.tweets.isNotEmpty) {
        List<Tweet> listaTweets = state.tweets.reversed.toList();
        return ListView.builder(
          itemCount: listaTweets.length,
          itemBuilder: (context, index) {
            final tweet = listaTweets[index];
            return Builder(
                builder: (context) => ItemListTweet(
                      tweet: tweet,
                    ));
          },
        );
      }
      return Container();
    });
  }
}
