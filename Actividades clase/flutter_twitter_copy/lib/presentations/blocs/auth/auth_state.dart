import 'package:equatable/equatable.dart';
import 'package:flutter_twitter_copy/domain/entities/user.dart';

class AuthState extends Equatable {
  final User? user;
  final User? userBrowser;
  final List<User> users;
  final bool isLoading;
  final String errorMessage;

  const AuthState({
    required this.user,
    required this.userBrowser,
    required this.isLoading,
    required this.errorMessage,
    required this.users,
  });

  factory AuthState.initial() {
    return AuthState(
      user: null,
      userBrowser: null,
      isLoading: false,
      errorMessage: '',
      users: [],
    );
  }

  AuthState copyWith({
    User? user,
    User? userBrowser,
    bool? isLoading,
    String? errorMessage,
    List<User>? users,
  }) {
    return AuthState(
      user: user ?? this.user,
      userBrowser: userBrowser ?? this.userBrowser,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      users: users ?? this.users,
    );
  }

  @override
  List<Object?> get props => [user, userBrowser, isLoading, errorMessage, users];
}
