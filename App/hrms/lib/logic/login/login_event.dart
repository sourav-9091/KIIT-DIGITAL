part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class SignInTextChangedEvent extends LoginEvent {
  final String emailValue;
  final String passwordValue;

  SignInTextChangedEvent({
    required this.emailValue,
    required this.passwordValue,
  });
}

class SignInSubmittedEvent extends LoginEvent {
  final String email;
  final String password;

  SignInSubmittedEvent({
    required this.email,
    required this.password,
  });
}
