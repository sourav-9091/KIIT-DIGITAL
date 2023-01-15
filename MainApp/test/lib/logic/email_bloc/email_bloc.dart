import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test/repositories/repositories.dart';

part 'email_event.dart';
part 'email_state.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  final UserRepository userRepository;
  EmailBloc(
    this.userRepository,
  ) : super(EmailInitial()) {
    on<VerifyButtonPressed>((event, emit) async {
      emit(EmailVerifiacationLoading());

      try {
        final result = await userRepository.email("adityasubham03@gmail.com");

        if (result == "success") {
          emit(EmailVerificationLoadedSuccess());
        } else {
          emit(EmailVerificationLoadedFail());
        }
      } catch (e) {
        emit(EmailVerificationLoadedFail());
      }
    });
  }
}
