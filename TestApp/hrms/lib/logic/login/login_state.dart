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




// {
//     on<LoginTextChangedEvent>((event, emit) async*{
//       if (EmailValidator.validate(event.emailValue) == false) {
//         if (event.emailValue.length <= 2) {
//         yield(
//           LoginErrorState(error: "ENTER A VALID EMAIL ADDRESS")
//         );
//       } else if (event.passwordValue.length <= 7) {
//         yield(
//           LoginErrorState(
//             error: "ENTER VALID PASSWORD",
//           )
//         );
//       } else {
//         emit(LoginFailure(error: 'Hello'));
//       }
//     });
//   }