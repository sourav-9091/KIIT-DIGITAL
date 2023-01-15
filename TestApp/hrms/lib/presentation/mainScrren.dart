import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms/logic/auth/auth_bloc.dart';
import 'package:hrms/logic/auth/auth_event.dart';
import 'package:hrms/logic/auth/auth_state.dart';
import 'package:hrms/presentation/dashBoard.dart';
import 'package:hrms/presentation/introScreen.dart';
import 'package:hrms/repositories/repositories.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class SimpleBlocDelegate extends BlocObserver {
//   @override
//   void onEvent(Bloc bloc, Object event) {
//     super.onEvent(bloc, event);
//     print(event);
//   }

//   @override
//   void onTransition(Bloc bloc, Transition transition) {
//     super.onTransition(bloc, transition);
//     print(transition);
//   }

//   @override
//   void onError(Bloc bloc, Object error, StackTrace stacktrace) {
//     super.onError(bloc, error, stacktrace);
//     print(error);
//   }
// }

void main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox('data');
  //BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..add(AppStarted());
      },
      child: MyApp(userRepository: userRepository),
    ),
  );
}

class MyApp extends StatelessWidget {
//   Future<bool> emailVerified() async {
//     final FlutterSecureStorage storage = new FlutterSecureStorage();
//     var value = await storage.read(key: 'token');
//     if (value != null) {
//       var response = await http
//           .post(Uri.parse("http://192.168.121.192/index2.php"), body: {
//         'token': value,
//       });

//       if (response.statusCode == 200) {
//         var jsondata = json.decode(response.body);
//         if (jsondata['verify'] == '0') {
//           return false;
//         } else {
//           return true;
//         }
//       }
//     } else {
//       return false;
//     }
//     return false;
//   }

  final UserRepository userRepository;

  MyApp({Key? key, required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('mn', 'MN'),
      theme: ThemeData(
        fontFamily: 'Rubik',
        primarySwatch: Colors.blueGrey,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            // Future<Widget> meth() async {
            //   if (await emailVerified()) {
            //     return VerifyScreen();
            //   }
            //   return MainScreen();
            // }

            return MainScreen();
          }
          if (state is AuthenticationUnauthenticated) {
            return IntroPage(userRepository: userRepository);
          }
          if (state is AuthenticationLoading) {
            return Scaffold(
              body: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 25.0,
                      width: 25.0,
                      child: CircularProgressIndicator(
                        // valueColor: new AlwaysStoppedAnimation<Color>(
                        //     Style.Colors.mainColor),
                        strokeWidth: 4.0,
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return Scaffold(
            body: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 25.0,
                    width: 25.0,
                    child: CircularProgressIndicator(
                      // valueColor: new AlwaysStoppedAnimation<Color>(
                      //     Style.Colors.mainColor),
                      strokeWidth: 4.0,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
