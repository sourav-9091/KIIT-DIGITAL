import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms/logic/auth/auth_bloc.dart';
import 'package:hrms/logic/login/login_bloc.dart';
import 'package:hrms/repositories/repositories.dart';
import 'loginScreen.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository userRepository;

  LoginScreen({Key? key, required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: LoginScreen(
          userRepository: userRepository,
        ),
      ),
    );
  }
}
