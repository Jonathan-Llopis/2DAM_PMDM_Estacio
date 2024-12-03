import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_login/core/failure.dart';
import 'package:flutter_firebase_login/core/use_case.dart';
import '../repositories/sign_in_repository.dart';

class SigninUserGoogleUseCase implements UseCase<void, LoginParamsGoogle> {
  final SignInRepository repository;
  SigninUserGoogleUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(LoginParamsGoogle params) async {
    return repository.signInGoogle();
  }
}
class LoginParamsGoogle {

  LoginParamsGoogle();
}

