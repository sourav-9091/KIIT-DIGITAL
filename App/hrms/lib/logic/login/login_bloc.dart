import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(SignInInitialState()) {
    on<SignInTextChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(
          SignInErrorState(
            errorMessage: "ENTER A VALID EMAIL ADDRESS",
          ),
        );
      } else if (event.passwordValue.length <= 7) {
        emit(
          SignInErrorState(
            errorMessage: "ENTER VALID PASSWORD",
          ),
        );
      } else {
        emit(SignInValidState());
      }
    });

    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLodingState());
    });
  }
}
