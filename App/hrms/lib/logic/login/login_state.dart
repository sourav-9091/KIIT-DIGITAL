part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class SignInInitialState extends LoginState {}

class SignInValidState extends LoginState {}

class SignInErrorState extends LoginState {
  final String errorMessage;

  SignInErrorState({
    required this.errorMessage,
  });
}

class SignInLodingState extends LoginState {}
