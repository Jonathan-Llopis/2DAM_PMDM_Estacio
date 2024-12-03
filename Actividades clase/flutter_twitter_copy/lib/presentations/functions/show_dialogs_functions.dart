import 'package:flutter/material.dart';
import 'package:flutter_twitter_copy/domain/entities/tweet.dart';
import 'package:flutter_twitter_copy/presentations/widgets/dialogs/dialog_tweet.dart';
import 'package:flutter_twitter_copy/presentations/widgets/dialogs/dialog_logout.dart';
import 'package:flutter_twitter_copy/presentations/widgets/dialogs/dialog_user_settings.dart';


Future<void> mostrarDialogoUsuario(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return const DialogoUserSettings();
      });
}

Future<void> mostrarLogOut(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return const LogOutUser();
      });
}

Future<void> mostrarEditTweet(BuildContext context, Tweet? tweet) {
  return showDialog(
      context: context,
      builder: (context) {
        return DialogoEditTweet(tweet: tweet,);
      });
}


