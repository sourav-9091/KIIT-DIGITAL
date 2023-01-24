import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test/logic/auth_bloc/auth_bloc.dart';
import 'package:test/logic/auth_bloc/auth_event.dart';
import 'package:test/logic/email_bloc/email_bloc.dart';

class EmailVerify extends StatefulWidget {
  EmailVerify({super.key});

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  final _mybox = Hive.box('data');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
              "assets/emailLogo.png",
              height: 200,
              width: 200,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "PLEASE VERIFY YOUR EMAIL",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "EMAIL :- ${_mybox.get("email")}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            // SizedBox(height: 20),
            // Text("isVerified :- ${_mybox.get("isVerified")}"),
            SizedBox(height: 280),
            BlocBuilder<EmailBloc, EmailState>(
              builder: (context, state) {
                return Center(
                  child: state is EmailVerifiacationLoading
                      ? Text("hello")
                      : ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<EmailBloc>(context)
                                .add(VerifyButtonPressed());
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text(
                                  "EMAIL SEND SUCCESSFULLY",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                content: const Text(
                                  "Please Login Again",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      BlocProvider.of<AuthenticationBloc>(
                                              context)
                                          .add(
                                        LoggedOut(),
                                      );
                                      Navigator.of(ctx).pop();
                                    },
                                    child: Center(
                                      child: Container(
                                        color: Colors.green,
                                        padding: const EdgeInsets.all(14),
                                        child: const Text(
                                          "lOGOUT",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Text(
                            "VERIFY",
                          ),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                        ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
