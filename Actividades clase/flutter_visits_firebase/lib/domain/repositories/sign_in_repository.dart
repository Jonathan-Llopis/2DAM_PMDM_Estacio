import 'package:dartz/dartz.dart';
import 'package:flutter_visits_firebase/core/failure.dart';
import 'package:flutter_visits_firebase/data/models/user_model.dart';

abstract class SignInRepository {
  Future<Either<Failure, UserModel>> signIn(String email, String password);
  Future<Either<Failure, UserModel>> signInGoogle();
  Future<Either<Failure, String>> isLoggedIn();
  Future<Either<Failure, void>> logout();
}
