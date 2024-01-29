
import 'package:belajar_riverpod/shared/domain/models/login/login_response_model.dart';
import 'package:flutter/widgets.dart';

enum AuthConcreteState {
  initial,
  loading,
  failure,
  signInSuccess,
  signUpSuccess
}

class AuthState {
  // required
  final AuthConcreteState state;
  final bool isLoading;
  final String message;
  // 
  final LoginResponseModel? user;

  const AuthState({
    this.isLoading = false,
    this.state = AuthConcreteState.initial,
    this.message = '',
    this.user,
  });

  const AuthState.initial({
    this.isLoading = false,
    this.state = AuthConcreteState.initial,
    this.message = '',
    this.user,
  });


  Widget map({
    Widget Function()? initial,
    Widget Function()? loading,
    Widget Function(String)? failure,
    Widget Function()? signInSuccess,
    Widget Function()? signUpSuccess,
    Widget Function()? orElse,
  }) {
    switch (state) {
      case AuthConcreteState.initial:
        return initial?.call() ?? Container();
      case AuthConcreteState.loading:
        return loading?.call() ?? Container();
      case AuthConcreteState.failure:
        return failure?.call(message) ?? Container();
      case AuthConcreteState.signInSuccess:
        return signInSuccess?.call() ?? Container();
      case AuthConcreteState.signUpSuccess:
        return signUpSuccess?.call() ?? Container();
      default:
        return orElse?.call() ?? Container();
    }
  }

  // Widget map({
  //   Widget Function()? initial,
  //   Widget Function()? loading,
  //   Widget Function(String)? failure,
  //   Widget Function()? signInSuccess,
  //   Widget Function()? signUpSuccess,
  //   Widget Function()? orElse,
  // }) {
  //   switch (state) {
  //     case AuthConcreteState.initial:
  //       return initial?.call() ?? Container();
  //     case AuthConcreteState.loading:
  //       return loading?.call() ?? Container();
  //     case AuthConcreteState.failure:
  //       return failure?.call(message) ?? Container();
  //     case AuthConcreteState.signInSuccess:
  //       return signInSuccess?.call() ?? Container();
  //     case AuthConcreteState.signUpSuccess:
  //       return signUpSuccess?.call() ?? Container();
  //     default:
  //       return orElse?.call() ?? Container();
  //   }
  // }


  AuthState copyWith({
    AuthConcreteState? state,
    String? message,
    LoginResponseModel? user,
  }) {
    return AuthState(
      state: state ?? this.state,
      message: message ?? this.message,
      user: user ?? this.user,
    );
  }

   @override
  String toString() {
    return 'Auth State(isLoading:$isLoading, state:$state, message:$message, user:$user)';
  }

  @override
  List<Object?> get props => [ user, state, message];
}