import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:hrms/logic/auth/auth_event.dart';
import 'package:meta/meta.dart';

import 'package:hrms/logic/auth/auth_bloc.dart';
import 'package:hrms/repositories/repositories.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;
  LoginBloc({
    required this.userRepository,
    required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null),
        super(SignInInitialState()) {
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

    on<SignInSubmittedEvent>((event, emit) async {
      emit(SignInLodingState());

      try {
        final token = await userRepository.login(
          event.email,
          event.password,
        );
        authenticationBloc.add(LoggedIn(token: token));
        emit(SignInInitialState());
      } catch (e) {
        emit(SignInErrorState(errorMessage: e.toString()));
      }
    });
  }
}
