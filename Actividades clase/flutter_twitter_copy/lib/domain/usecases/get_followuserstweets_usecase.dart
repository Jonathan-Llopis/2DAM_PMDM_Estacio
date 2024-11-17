import 'package:dartz/dartz.dart';
import 'package:flutter_twitter_copy/domain/repositories/tweet_repository.dart';


class GetFollowUsersTweetsUseCase {
  final TweetRepository repository;

  GetFollowUsersTweetsUseCase(this.repository);

  Future<Either<String, void>> call(String userId) {
    return repository.getFollowUsersTweets(userId);
  }
}