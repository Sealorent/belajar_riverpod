import 'package:belajar_riverpod/features/authentication/domain/repositories/auth_repository.dart';
import 'package:belajar_riverpod/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:belajar_riverpod/services/user_cache_service/domain/repositories/user_cache_repository.dart';
import 'package:belajar_riverpod/shared/domain/models/login/login_model.dart';
import 'package:belajar_riverpod/shared/domain/models/register/register_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthState> {

  final AuthenticationRepository authRepository;
  final UserRepository userRepository;

  AuthNotifier({
    required this.authRepository,
    required this.userRepository,
  }) : super(const AuthState.initial());


  Future<void> loginUser(String email, String password , String token_fcm) async {
    state = state.copyWith(
      state: AuthConcreteState.loading,
    );

    final response = await authRepository.loginUser(
      login: LoginModel(email: email, password: password, fcmToken: token_fcm),
    );
    print('response $response');
    state = await response.fold(
      (failure) => state.copyWith(
        state: AuthConcreteState.failure,
        message: failure.message,
      ),
      (user) async { 
        print('user $user');
        final hasSavedUser = await userRepository.saveUser(user: user);
        print('hasSavedUser $hasSavedUser');
        if (hasSavedUser) {
          return state.copyWith(
            state: AuthConcreteState.signInSuccess,
            message: 'Login Success',
            
          );
        }
        return state.copyWith(
          state: AuthConcreteState.failure,
          message: 'Failed to save user',
        );
      },
    );
  }

  Future<void> registerUser(String name, String email , String password) async {
    state = state.copyWith(
      state: AuthConcreteState.loading,
    );

    final response = await authRepository.registerUser(
      register: RegisterModel(name: name, email: email, password: password),
    );
    print('response $response');
    state = await response.fold(
      (failure) => state.copyWith(
        state: AuthConcreteState.failure,
        message: failure.message,
      ),
      (result) async { 

        if (result.success == true) {
          return state.copyWith(
            state: AuthConcreteState.signUpSuccess,
            message: 'Register Success', 
          );
        }
        return state.copyWith(
          state: AuthConcreteState.failure,
          message: result.message,
        );
      },
    );
  }
}