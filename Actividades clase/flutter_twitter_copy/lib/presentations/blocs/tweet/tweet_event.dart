import 'package:equatable/equatable.dart';

abstract class TweetEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetTweetsUseCaseEvent extends TweetEvent {}
class CreateTweetUseCaseEvent extends TweetEvent {}
class DeleteTweetUseCaseEvent extends TweetEvent {}
class LikeTweetUseCaseEvent extends TweetEvent {}
class UpdateTweetUseCaseEvent extends TweetEvent {}
class GetFollowUsersTweetsUseCaseEvent extends TweetEvent {}

