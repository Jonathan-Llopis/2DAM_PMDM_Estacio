import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_twitter_copy/domain/repositories/user_repository.dart';
import 'package:flutter_twitter_copy/domain/usecases/get_user_info_usecase.dart';
import 'package:flutter_twitter_copy/domain/usecases/login_usecase.dart';
import 'package:flutter_twitter_copy/domain/usecases/update_user_info_usecase.dart';
import 'package:flutter_twitter_copy/presentations/blocs/auth/auth_event.dart';
import 'package:flutter_twitter_copy/presentations/blocs/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetUserInfoUseCase getUserInfoUseCase;
  final UpdateUserInfoUseCase updateUserInfoUseCase;
  final LoginUseCase loginUseCase;
  final UserRepository userRepository;

  AuthBloc(
      {required this.getUserInfoUseCase,
      required this.loginUseCase,
      required this.updateUserInfoUseCase,
      required this.userRepository})
      : super(AuthState.initial()) {
    on<GetUserInfoUseCaseEvent>(_onGetUserInfoUseCaseEvent);
    on<UpdateUserInfoUseCaseEvent>(_onUpdateUserInfoUseCaseEvent);
    on<LoginUseCaseEvent>(_onLoginUseCaseEvent);
  }

  Future<void> _onGetUserInfoUseCaseEvent(
    GetUserInfoUseCaseEvent event,
    Emitter<AuthState> emit,
  ) async {}

  Future<void> _onUpdateUserInfoUseCaseEvent(
    UpdateUserInfoUseCaseEvent event,
    Emitter<AuthState> emit,
  ) async {
     emit(state.copyWith(isLoading: true));

    final result = await updateUserInfoUseCase(event.userId, event.username, event.avatar);

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
}
