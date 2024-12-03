import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetUserInfoUseCaseEvent extends AuthEvent {
  final String userId;

  GetUserInfoUseCaseEvent(this.userId);

  @override
  List<Object?> get props => [userId];
}

class UpdateUserInfoUseCaseEvent extends AuthEvent {
  final String userId;
  final String? username;
  final String? avatar;

  UpdateUserInfoUseCaseEvent(this.userId, this.avatar, this.username);

  @override
  List<Object?> get props => [userId, username, avatar];
}

class LoginUseCaseEvent extends AuthEvent {
  final String username;
  final String password;

  LoginUseCaseEvent(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}

class GetUserCaseEvent extends AuthEvent {}
class GetAllUsersEvent extends AuthEvent {}
class LogoutEvent extends AuthEvent {}
class FollowUserUseCaseEvent extends AuthEvent {
  final String userToFollow;
  final String userId;

  FollowUserUseCaseEvent(this.userToFollow,this.userId);

  @override
  List<Object?> get props => [userToFollow,userId];
}
