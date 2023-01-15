// import 'package:hive/hive.dart';
// import 'package:test/logic/auth_bloc/auth.dart';
// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:test/logic/email_bloc/email_bloc.dart';
// import 'package:test/style/theme.dart' as Style;

// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   final _mybox = Hive.box('data');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Style.Colors.mainColor,
//         leading: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: CircleAvatar(
//             backgroundImage: NetworkImage(
//                 "https://media.licdn.com/dms/image/C4E03AQFwykLoPhnVTQ/profile-displayphoto-shrink_800_800/0/1630860315538?e=1678320000&v=beta&t=rZ5kF137Z8eK7Y_BchdUMfZ-mno2-ZLdAeh9OHxhonQ"),
//           ),
//         ),
//         title: Text("HRMS"),
//         actions: [
//           IconButton(
//               icon: Icon(EvaIcons.logOutOutline),
//               onPressed: () {
//                 BlocProvider.of<AuthenticationBloc>(context).add(
//                   LoggedOut(),
//                 );
//               })
//         ],
//       ),
//       body: Center(child: getWidget()),
//     );
//   }

//   getWidget() {
//     if (_mybox.get("isVerified").toString() == "null") {
//       return EmailVerify();
//     } else {
//       return Dashboard();
//     }
//   }
// }

// class EmailVerify extends StatefulWidget {
//   EmailVerify({super.key});

//   @override
//   State<EmailVerify> createState() => _EmailVerifyState();
// }

// class _EmailVerifyState extends State<EmailVerify> {
//   final _mybox = Hive.box('data');

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<EmailBloc>(
//       create: (context) => EmailBloc(_mybox.get("email")),
//       child: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("PLEASE VERIFY YOUR EMAIL"),
//               SizedBox(height: 20),
//               Text("isVerified :- ${_mybox.get("isVerified")}"),
//               SizedBox(height: 20),
//               BlocBuilder<EmailBloc, EmailState>(
//                 builder: (context, state) {
//                   return Center(
//                     child: state is EmailVerifiacationLoading
//                         ? Text("hello")
//                         : ElevatedButton(
//                             onPressed: () {
//                               BlocProvider.of<EmailBloc>(context).add(
//                                 VerifyButtonPressed(_mybox.get("email")),
//                               );
//                             },
//                             child: Text(
//                               "VERIFY",
//                             ),
//                             style:
//                                 ElevatedButton.styleFrom(primary: Colors.green),
//                           ),

//                   );
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Dashboard extends StatelessWidget {
//   final _mybox = Hive.box('data');
//   Dashboard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       // child: Text(),
//       child: Column(children: [
//         Text("Email :- ${_mybox.get("email")}"),
//         SizedBox(height: 20),
//         Text("Token :- ${_mybox.get("token")}"),
//         SizedBox(height: 20),
//         Text("isVerified :- ${_mybox.get("isVerified")}"),
//       ]),
//     );
//   }
// }

import 'package:hive/hive.dart';
import 'package:test/logic/auth_bloc/auth.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/logic/email_bloc/email_bloc.dart';
import 'package:test/style/theme.dart' as Style;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _mybox = Hive.box('data');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://media.licdn.com/dms/image/C4E03AQFwykLoPhnVTQ/profile-displayphoto-shrink_800_800/0/1630860315538?e=1678320000&v=beta&t=rZ5kF137Z8eK7Y_BchdUMfZ-mno2-ZLdAeh9OHxhonQ"),
          ),
        ),
        title: Text("HRMS"),
        actions: [
          IconButton(
              icon: Icon(EvaIcons.logOutOutline),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(
                  LoggedOut(),
                );
              })
        ],
      ),
      body: Center(child: getWidget()),
    );
  }

  getWidget() {
    if (_mybox.get("isVerified").toString() == "null") {
      return EmailVerify();
    } else {
      return Dashboard();
    }
  }
}

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("PLEASE VERIFY YOUR EMAIL"),
            SizedBox(height: 20),
            Text("isVerified :- ${_mybox.get("isVerified")}"),
            SizedBox(height: 20),

            BlocBuilder<EmailBloc, EmailState>(
              builder: (context, state) {
                return Center(
                  child: state is EmailVerifiacationLoading
                      ? Text("hello")
                      : ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<EmailBloc>(context)
                                .add(VerifyButtonPressed());
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

class Dashboard extends StatelessWidget {
  final _mybox = Hive.box('data');
  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: Text(),
      child: Column(children: [
        Text("Email :- ${_mybox.get("email")}"),
        SizedBox(height: 20),
        Text("Token :- ${_mybox.get("token")}"),
        SizedBox(height: 20),
        Text("isVerified :- ${_mybox.get("isVerified")}"),
      ]),
    );
  }
}


