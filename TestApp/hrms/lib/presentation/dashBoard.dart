import 'dart:convert';

import 'package:hive/hive.dart';

import 'package:hrms/logic/auth/auth_bloc.dart';
import 'package:hrms/logic/auth/auth_event.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:http/http.dart' as http;

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
        backgroundColor: Colors.white,
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
      body: Center(
        // child: Text(),
        child: Column(children: [
          Text("Email :- ${_mybox.get("email")}"),
          SizedBox(height: 20),
          Text("Token :- ${_mybox.get("token")}"),
        ]),
      ),
    );
  }
}

class EmailVerify extends StatelessWidget {
  const EmailVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("PLEASE VERIFY YOUR EMAIL"),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
