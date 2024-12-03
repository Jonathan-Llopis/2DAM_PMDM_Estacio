import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_twitter_copy/domain/repositories/user_repository.dart';
import 'package:flutter_twitter_copy/domain/usecases/follow_user.dart';
import 'package:flutter_twitter_copy/domain/usecases/get_all_users.dart';
import 'package:flutter_twitter_copy/domain/usecases/get_user_info_usecase.dart';
import 'package:flutter_twitter_copy/domain/usecases/get_user_usecase.dart';
import 'package:flutter_twitter_copy/domain/usecases/login_usecase.dart';
import 'package:flutter_twitter_copy/domain/usecases/update_user_info_usecase.dart';
import 'package:flutter_twitter_copy/presentations/blocs/auth/auth_event.dart';
import 'package:flutter_twitter_copy/presentations/blocs/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetUserInfoUseCase getUserInfoUseCase;
  final UpdateUserInfoUseCase updateUserInfoUseCase;
  final LoginUseCase loginUseCase;
  final GetUserUseCase getUserUseCase;
  final UserRepository userRepository;
  final GetAllUsersUseCase getAllUsersUseCase;
  final FollowUserUseCase followUserUseCase;

  AuthBloc(
      {required this.getUserInfoUseCase,
      required this.loginUseCase,
      required this.updateUserInfoUseCase,
      required this.userRepository,
      required this.getUserUseCase,
      required this.getAllUsersUseCase,
      required this.followUserUseCase})
      : super(AuthState.initial()) {
    on<GetUserInfoUseCaseEvent>(_onGetUserInfoUseCaseEvent);
    on<UpdateUserInfoUseCaseEvent>(_onUpdateUserInfoUseCaseEvent);
    on<LoginUseCaseEvent>(_onLoginUseCaseEvent);
    on<GetUserCaseEvent>(_onGetUserEvent);
    on<GetAllUsersEvent>(_onGetAllUsersEvent);
    on<LogoutEvent>(_onLogoutEvent);
    on<FollowUserUseCaseEvent>(_onFollowUserUseCaseEvent);
  }

  Future<void> _onGetUserInfoUseCaseEvent(
    GetUserInfoUseCaseEvent event,
    Emitter<AuthState> emit,
  ) async {
    final userBrowser = await getUserInfoUseCase(event.userId);
    userBrowser.fold(
      (error) {
        emit(state.copyWith(user: null));
      },
      (user) {
        emit(state.copyWith(userBrowser: user));
      },
    );
  }

  Future<void> _onLogoutEvent(
    LogoutEvent event,
    Emitter<AuthState> emit,
  ) async {
    await userRepository.logout();
  }

  Future<void> _onGetAllUsersEvent(
    GetAllUsersEvent event,
    Emitter<AuthState> emit,
  ) async {
    final getAllUsers = await getAllUsersUseCase();
    getAllUsers.fold(
      (error) {
        emit(state.copyWith(users: null));
      },
      (users) {
        emit(state.copyWith(users: users));
      },
    );
  }

  Future<void> _onUpdateUserInfoUseCaseEvent(
    UpdateUserInfoUseCaseEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result =
        await updateUserInfoUseCase(event.userId, event.username, event.avatar);

    result.fold(
      (error) => emit(
          state.copyWith(isLoading: false, errorMessage: error.toString())),
      (inventory) {
        emit(state.copyWith(
          isLoading: false,
        ));
      },
    );
  }

  Future<void> _onLoginUseCaseEvent(
    LoginUseCaseEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await loginUseCase(event.username, event.password);
    result.fold(
      (error) => emit(
          state.copyWith(isLoading: false, errorMessage: error.toString())),
      (user) => emit(state.copyWith(isLoading: false, user: user)),
    );
  }

  Future<void> _onGetUserEvent(
    GetUserCaseEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await getUserUseCase();
    result.fold(
      (error) => emit(
          state.copyWith(isLoading: false, errorMessage: error.toString())),
      (user) => emit(state.copyWith(isLoading: false, user: user)),
    );
  }

  Future<void> _onFollowUserUseCaseEvent(
    FollowUserUseCaseEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await followUserUseCase(event.userToFollow, event.userId);
    result.fold(
      (error) => emit(state.copyWith(isLoading: false, errorMessage: error)),
      (tweets) {
        add(GetUserCaseEvent());
        emit(state.copyWith(
          isLoading: false,
        ));
      },
    );
  }
}
