// import 'package:animated_theme_switcher/animated_theme_switcher.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:profile_screen/model/user.dart';
// import 'package:profile_screen/page/edit_profile_page.dart';
// import 'package:profile_screen/utils/user_preferences.dart';
// import 'package:profile_screen/widget/appbar_widget.dart';
// import 'package:profile_screen/widget/button_widget.dart';
// import 'package:profile_screen/widget/numbers_widget.dart';
// import 'package:profile_screen/widget/profile_widget.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     final user = UserPreferences.myUser;

//     return ThemeSwitchingArea(
//       child: Builder(
//         builder: (context) => Scaffold(
//           appBar: buildAppBar(context),
//           body: ListView(
//             physics: BouncingScrollPhysics(),
//             children: [
//               ProfileWidget(
//                 imagePath: user.imagePath,
//                 onClicked: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) => EditProfilePage()),
//                   );
//                 },
//               ),
//               const SizedBox(height: 24),
//               buildName(user),
//               const SizedBox(height: 24),
//               Row(
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: 138,
//                   ),
//                   Text(
//                     '1357574',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 25,
//                     ),
//                   ),
//                   Image.asset(
//                     "assets/TwitterTick.png",
//                     height: 60,
//                     width: 60,
//                   ),
//                 ],
//               ),
//               Text(
//                 'CSE',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 25,
//                 ),
//               ),
//               const SizedBox(height: 24),
//               Center(child: buildUpgradeButton()),
//               const SizedBox(height: 24),
//               // NumbersWidget(),
//               const SizedBox(height: 48),
//               // buildAbout(user),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildName(User user) => Column(
//         children: [
//           Text(
//             user.name,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             user.email,
//             style: TextStyle(color: Colors.grey),
//           )
//         ],
//       );

//   Widget buildUpgradeButton() => ButtonWidget(
//         text: 'Logout',
//         onClicked: () {},
//       );

//   Widget buildAbout(User user) => Container(
//         padding: EdgeInsets.symmetric(horizontal: 48),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'About',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               user.about,
//               style: TextStyle(fontSize: 16, height: 1.4),
//             ),
//           ],
//         ),
//       );
// }

// import 'dart:js';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/logic/auth_bloc/auth_bloc.dart';
import 'package:test/logic/auth_bloc/auth_event.dart';
import 'package:test/screens/model/user.dart';
import 'package:test/screens/nav_bar/edit_profile_page.dart';
import 'package:test/screens/utils/user_preferences.dart';
import 'package:test/screens/widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = UserPreferences.myUser;
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          // SizedBox(
          //   height: 30,
          // ),
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              );
            },
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 138,
              ),
              Text(
                '1357574',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Image.asset(
                "assets/TwitterTick.png",
                height: 60,
                width: 60,
              ),
            ],
          ),
          Text(
            'CSE',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 210),
          Center(
              child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              onPrimary: Colors.white,
              backgroundColor: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            child: Text("LOGOUT"),
            onPressed: (() {
              //Add Logout Bloc Here
              BlocProvider.of<AuthenticationBloc>(context).add(
                LoggedOut(),
              );
            }),
          )),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // SizedBox(
              //   width: 20,
              // ),
              Image.asset(
                "assets/facebook.png",
                height: 35,
                width: 35,
              ),
              Image.asset(
                "assets/instagram.png",
                height: 35,
                width: 35,
              ),
              Image.asset(
                "assets/twitter.png",
                height: 35,
                width: 35,
              ),
              Image.asset(
                "assets/youtube.png",
                height: 35,
                width: 35,
              ),
            ],
          )
          // const SizedBox(height: 24),
          // // NumbersWidget(),
          // const SizedBox(height: 48),
          // // buildAbout(user),
        ],
      ),
    );
  }
}

Widget buildName(User user) => Column(
      children: [
        Text(
          user.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text(
          user.email,
          style: TextStyle(color: Colors.grey),
        )
      ],
    );

// Widget buildUpgradeButton() => ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         shape: StadiumBorder(),
//         onPrimary: Colors.white,
//         backgroundColor: Colors.red,
//         padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
//       ),
//       child: Text("LOGOUT"),
//       onPressed: (() {
//         //Add Logout Bloc Here
//         BlocProvider.of<AuthenticationBloc>(context).add(
//           LoggedOut(),
//         );
//       }),
//     );

Widget buildAbout(User user) => Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            user.about,
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
        ],
      ),
    );
