import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms/logic/login/login_bloc.dart';
import 'package:hrms/repositories/repositories.dart';

class LoginForm extends StatefulWidget {
  final UserRepository userRepository;
  LoginForm({Key? key, required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState(userRepository);
}

class _LoginFormState extends State<LoginForm> {
  final UserRepository userRepository;
  _LoginFormState(this.userRepository);
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        SignInSubmittedEvent(
          email: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is SignInValidState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("An Error Occured!"),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                'LOGIN',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30),
                              )),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              onChanged: (value) {
                                BlocProvider.of<LoginBloc>(context).add(
                                  SignInTextChangedEvent(
                                    emailValue: _usernameController.text,
                                    passwordValue: _passwordController.text,
                                  ),
                                );
                              },
                              controller: _usernameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'User Name',
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: TextField(
                              onChanged: (value) {
                                BlocProvider.of<LoginBloc>(context).add(
                                  SignInTextChangedEvent(
                                    emailValue: _usernameController.text,
                                    passwordValue: _passwordController.text,
                                  ),
                                );
                              },
                              obscureText: true,
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              //forgot password screen
                            },
                            child: const Text(
                              'Forgot Password',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                              height: 45,
                              child: state is SignInLodingState
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Center(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 25.0,
                                              width: 25.0,
                                              child:
                                                  CupertinoActivityIndicator(),
                                            )
                                          ],
                                        ))
                                      ],
                                    )
                                  : ElevatedButton(
                                      onPressed: _onLoginButtonPressed,
                                      child: Text("LOG IN",
                                          style: new TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)))),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            padding: EdgeInsets.only(bottom: 30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Don't have an account?",
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 5.0),
                                ),
                                GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      "Register",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
