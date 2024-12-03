import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_twitter_copy/data/models/user_model.dart';
import 'package:flutter_twitter_copy/domain/entities/tweet.dart';
import 'package:flutter_twitter_copy/domain/entities/user.dart';
import 'package:flutter_twitter_copy/presentations/blocs/auth/auth_bloc.dart';
import 'package:flutter_twitter_copy/presentations/blocs/tweet/tweet_bloc.dart';
import 'package:flutter_twitter_copy/presentations/blocs/tweet/tweet_event.dart';
import 'package:flutter_twitter_copy/presentations/functions/functions.dart';
import 'package:flutter_twitter_copy/presentations/functions/show_dialogs_functions.dart';

class ItemListTweet extends StatefulWidget {
  const ItemListTweet({
    super.key,
    required this.tweet,
  });

  final Tweet tweet;

  @override
  State<ItemListTweet> createState() => _ItemListTweetState();
}

class _ItemListTweetState extends State<ItemListTweet> {
  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);

    if (authBloc.state.users.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    } else {
      User? usuario = authBloc.state.users.firstWhere(
        (user) => user.id == widget.tweet.userId,
        orElse: () =>
            UserModel(id: '', username: '', following: [], avatar: ''),
      );

      return Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey[300]!, width: 0.8),
          ),
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.black
              : Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    widget.tweet.userAvatar ?? '',
                  ),
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        usuario.username,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '@${usuario.username}',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '• ${getDate(widget.tweet.createdAt.toString())}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (usuario.id == authBloc.state.user!.id)
                  IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                      color: Colors.grey[600],
                      size: 20,
                    ),
                    onPressed: () {
                      mostrarEditTweet(context, widget.tweet);
                    },
                  ),
                if (usuario.id != authBloc.state.user!.id)
                  IconButton(
                    icon: Icon(
                      Icons.share,
                      color: Colors.grey[600],
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              widget.tweet.content,
              style: TextStyle(
                fontSize: 15,
                height: 1.4,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey[300]
                    : Colors.black,
              ),
            ),
            if (widget.tweet.image != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  widget.tweet.image!,
                  errorBuilder: (context, error, stackTrace) {
                    return Text('Error al cargar la imagen');
                  },
                ),
              ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: () {
                    context.read<TweetBloc>().add(LikeTweetUseCaseEvent(
                        widget.tweet.id, authBloc.state.user!.id));
                    context.read<TweetBloc>().add(GetTweetsUseCaseEvent());
                  },
                  icon: widget.tweet.likes.contains(authBloc.state.user!.id)
                      ? Icon(Icons.favorite, color: Colors.redAccent, size: 20)
                      : Icon(Icons.favorite_border,
                          color: Colors.redAccent, size: 20),
                  label: Text(
                    widget.tweet.likes.length.toString(),
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                ),
                if (usuario.id == authBloc.state.user!.id)
                  TextButton.icon(
                    onPressed: () {
                      context
                          .read<TweetBloc>()
                          .add(DeleteTweetUseCaseEvent(widget.tweet.id));
                    },
                    icon: Icon(Icons.delete, color: Colors.grey[600], size: 20),
                    label: Text(
                      'Eliminar',
                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    ),
                  )
              ],
            ),
          ],
        ),
      );
    }
  }
}
