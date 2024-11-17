import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_twitter_copy/domain/usecases/create_tweet_usecase.dart';
import 'package:flutter_twitter_copy/domain/usecases/delete_tweet_usecase.dart';
import 'package:flutter_twitter_copy/domain/usecases/get_followuserstweets_usecase.dart';
import 'package:flutter_twitter_copy/domain/usecases/get_tweets_usecase.dart';
import 'package:flutter_twitter_copy/domain/usecases/like_tweet_usecase.dart';
import 'package:flutter_twitter_copy/domain/usecases/update_tweet_usecase.dart';
import 'package:flutter_twitter_copy/presentations/blocs/tweet/tweet_event.dart';
import 'package:flutter_twitter_copy/presentations/blocs/tweet/tweet_state.dart';

class TweetBloc extends Bloc<TweetEvent, TweetState> {
  final GetTweetsUseCase getTweetsUseCase;
  final CreateTweetUseCase createTweetUseCase;
  final DeleteTweetUseCase deleteTweetUseCase;
  final LikeTweetUseCase likeTweetUseCase;
  final UpdateTweetUseCase updateTweetUseCase;
  final GetFollowUsersTweetsUseCase getFollowUsersTweetUseCase;

  TweetBloc(
     { required this.getTweetsUseCase,
      required this.createTweetUseCase,
      required this.deleteTweetUseCase,
      required this.likeTweetUseCase,
      required this.updateTweetUseCase,
      required this.getFollowUsersTweetUseCase})
      : super(TweetState.initial()) {
    on<GetTweetsUseCaseEvent>(_onGetTweetsUseCaseEvent);
    on<CreateTweetUseCaseEvent>(_onCreateTweetUseCaseEvent);
    on<DeleteTweetUseCaseEvent>(_onDeleteTweetUseCaseEvent);
    on<LikeTweetUseCaseEvent>(_onLikeTweetUseCaseEvent);
    on<UpdateTweetUseCaseEvent>(_onUpdateTweetUseCaseEvent);
    on<GetFollowUsersTweetsUseCaseEvent>(_onGetFollowUsersTweetsUseCaseEvent);
  }

  Future<void> _onGetTweetsUseCaseEvent(
    GetTweetsUseCaseEvent event,
    Emitter<TweetState> emit,
  ) async {}

  Future<void> _onCreateTweetUseCaseEvent(
    CreateTweetUseCaseEvent event,
    Emitter<TweetState> emit,
  ) async {}

  Future<void> _onDeleteTweetUseCaseEvent(
    DeleteTweetUseCaseEvent event,
    Emitter<TweetState> emit,
  ) async {}

  Future<void> _onLikeTweetUseCaseEvent(
    LikeTweetUseCaseEvent event,
    Emitter<TweetState> emit,
  ) async {}

  Future<void> _onUpdateTweetUseCaseEvent(
    UpdateTweetUseCaseEvent event,
    Emitter<TweetState> emit,
  ) async {}

  Future<void> _onGetFollowUsersTweetsUseCaseEvent(
    GetFollowUsersTweetsUseCaseEvent event,
    Emitter<TweetState> emit,
  ) async {}

  
}