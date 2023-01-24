// import 'package:flutter/material.dart';
// import 'package:moony_nav_bar/moony_nav_bar.dart';
// import 'package:profile_screen/page/edit_profile_page.dart';

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   Widget _screen1 = Screen1();
//   Widget _screen2 = Screen2();
//   Widget _screen3 = Screen3();
//   Widget _screen4 = EditProfilePage();
//   int selectedIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Moony navigation bar'),
//         ),
//         body: getBody(),
//         bottomNavigationBar: MoonyNavigationBar(
//           items: <NavigationBarItem>[
//             NavigationBarItem(
//                 icon: Icons.home_rounded,
//                 onTap: () {
//                   onTapHandler(0);
//                 }),
//             NavigationBarItem(
//                 icon: Icons.favorite_border_outlined,
//                 activeIcon: Icons.favorite,
//                 color: Colors.pink,
//                 indicatorColor: Colors.pink,
//                 onTap: () {
//                   onTapHandler(1);
//                 }),
//             NavigationBarItem(
//                 icon: Icons.search,
//                 onTap: () {
//                   onTapHandler(2);
//                 }),
//             NavigationBarItem(
//                 icon: Icons.person_outline,
//                 onTap: () {
//                   onTapHandler(3);
//                 })
//           ],
//           style: MoonyNavStyle(
//             activeColor: Theme.of(context).primaryColor,
//             indicatorPosition: IndicatorPosition.TOP,
//             indicatorType: IndicatorType.POINT,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(10),
//               topRight: Radius.circular(10),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget getBody() {
//     if (this.selectedIndex == 0) {
//       return this._screen1;
//     } else if (this.selectedIndex == 1) {
//       return this._screen2;
//     } else if (this.selectedIndex == 2) {
//       return this._screen3;
//     }
//     return this._screen4;
//   }

//   void onTapHandler(int index) {
//     this.setState(() {
//       this.selectedIndex = index;
//     });
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // to get size
    var size = MediaQuery.of(context).size;

    // style
    var cardTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        color: Color.fromRGBO(63, 63, 63, 1));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          // Container(
          //   height: size.height * .3,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //         alignment: Alignment.topCenter,
          //         image: AssetImage('assets/images/top_header.png')),
          //   ),
          // ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  // Container(
                  //   height: 64,
                  //   margin: EdgeInsets.only(bottom: 20),
                  //   child: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: <Widget>[
                  //       // CircleAvatar(
                  //       //   radius: 32,
                  //       //   backgroundImage: NetworkImage(
                  //       //       'https://i.pinimg.com/originals/78/07/03/78070395106fcd1c3e66e3b3810568bb.jpg'),
                  //       // ),
                  //       SizedBox(
                  //         width: 16,
                  //       ),
                  //       Column(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: <Widget>[
                  //           Text(
                  //             'John Richardo',
                  //             style: TextStyle(
                  //                 fontFamily: "Montserrat Medium",
                  //                 color: Colors.white,
                  //                 fontSize: 20),
                  //           ),
                  //           Text(
                  //             '4101410141',
                  //             style: TextStyle(
                  //                 fontSize: 14,
                  //                 color: Colors.white,
                  //                 fontFamily: "Montserrat Regular"),
                  //           )
                  //         ],
                  //       )
                  //     ],
                  //   ),
                  // ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // SvgPicture.network(
                              //   'https://image.flaticon.com/icons/svg/1904/1904425.svg',
                              //   height: 128,
                              // ),
                              Image.asset(
                                'assets/student.png',
                                height: 100,
                              ),
                              Text(
                                'KIIT',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),

                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // SvgPicture.network(
                              //   'https://image.flaticon.com/icons/svg/1904/1904565.svg',
                              //   height: 128,
                              // ),
                              Image.asset(
                                'assets/kiss.png',
                                height: 100,
                              ),
                              Text(
                                'KISS',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),

                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // SvgPicture.network(
                              //   'https://image.flaticon.com/icons/svg/1904/1904527.svg',
                              //   height: 128,
                              // ),
                              Image.asset(
                                'assets/hospitality.png',
                                height: 80,
                              ),
                              Text(
                                'HOSPITALITY',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),

                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // SvgPicture.network(
                              //   'https://image.flaticon.com/icons/svg/1904/1904437.svg',
                              //   height: 128,
                              // ),
                              Image.asset(
                                'assets/hospital.png',
                                height: 100,
                              ),
                              Text(
                                'KIMS',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),

                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // SvgPicture.network(
                              //   'https://image.flaticon.com/icons/svg/1904/1904235.svg',
                              //   height: 128,
                              // ),
                              Image.asset(
                                'assets/temple.png',
                                height: 100,
                              ),
                              Text(
                                'TEMPLE TRUST',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),

                        // Card(
                        //   shape:RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(8)
                        //   ),
                        //   elevation: 4,
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: <Widget>[
                        //       SvgPicture.network(
                        //         'https://image.flaticon.com/icons/svg/1904/1904221.svg',
                        //         height: 128,
                        //       ),
                        //       Text(
                        //         'Course Plan',
                        //         style: cardTextStyle,
                        //       )
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
