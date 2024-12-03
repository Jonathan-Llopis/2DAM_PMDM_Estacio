import 'package:dartz/dartz.dart';
import 'package:flutter_twitter_copy/domain/entities/user.dart';
import 'package:flutter_twitter_copy/domain/repositories/user_repository.dart';


class GetUserInfoUseCase {
  final UserRepository repository;

  GetUserInfoUseCase(this.repository);

  Future<Either<String, User>> call(String userId) {
    return repository.getUserInfo(userId);
  }
}