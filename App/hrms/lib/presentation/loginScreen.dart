import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms/logic/login/login_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'HRMS';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: const MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.center,
                //padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/kiitLogo.png',
                  height: 200,
                  width: 200,
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  onChanged: (value) {
                    BlocProvider.of<LoginBloc>(context).add(
                      SignInTextChangedEvent(
                        emailValue: emailController.text,
                        passwordValue: passwordController.text,
                      ),
                    );
                  },
                  controller: emailController,
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
                        emailValue: emailController.text,
                        passwordValue: passwordController.text,
                      ),
                    );
                  },
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    labelText: 'Password',
                  ),
                ),
              ),
              // BlocBuilder<LoginBloc, LoginState>(
              //   builder: (context, state) {
              //     if (state is SignInErrorState)
              //       return Text(
              //         state.errorMessage,
              //         style: TextStyle(
              //           color: Colors.red,
              //         ),
              //       );
              //     else {
              //       return Container();
              //     }
              //   },
              // ),
              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is SignInValidState) {
                    return Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                          child: const Text('Login'),
                          onPressed: () {
                            print(emailController.text);
                            print(passwordController.text);
                          },
                        ));
                  } else {
                    return Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.grey),
                          child: const Text('Login'),
                          onPressed: () {
                            print(emailController.text);
                            print(passwordController.text);
                          },
                        ));
                  }
                },
              ),
              Row(
                children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                      ),
                    ),
                    onPressed: () {
                      //signup screen
                    },
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              SizedBox(
                height: 125,
              ),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is SignInErrorState)
                    return Text(
                      state.errorMessage,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    );
                  else {
                    return Container();
                  }
                },
              ),
            ],
          )),
    );
  }
}
