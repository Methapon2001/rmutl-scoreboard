import 'package:flutter/material.dart';
import 'package:scoreboard/views/badminton.dart';
import 'package:scoreboard/views/basketball.dart';
import 'package:scoreboard/views/futsal.dart';
import 'package:scoreboard/views/soccer.dart';
import 'package:scoreboard/views/tabletennis.dart';
import 'package:scoreboard/views/setting.dart';
import 'package:scoreboard/views/volleyball.dart';
import 'package:sizer/sizer.dart';

class ImageSports extends StatefulWidget {
  const ImageSports({super.key});

  @override
  State<ImageSports> createState() => _ImageSportsState();
}

class _ImageSportsState extends State<ImageSports> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: 75.h,
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(15),
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 20,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 23, 36, 113),
                          width: 8.0),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40),
                      ),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 5,
                            offset: Offset(1, 7))
                      ]),
                  child: Stack(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 18.h,
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const BasketballPage()));
                              },
                              icon: Image.asset(
                                  'image/basketball/basketballplay.png'))),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'BASKETBALL',
                          style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 23, 36, 113),
                          width: 8.0),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40),
                      ),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 5,
                            offset: Offset(1, 7))
                      ]),
                  child: Stack(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 17.h,
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const VolleyballPage()));
                              },
                              icon: Image.asset(
                                  'image/volleyball/volleyballplay.png'))),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'VOLLEYBALL',
                          style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 23, 36, 113),
                          width: 8.0),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40),
                      ),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 5,
                            offset: Offset(1, 7))
                      ]),
                  child: Stack(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 17.h,
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SoccerPage()));
                              },
                              icon:
                                  Image.asset('image/soccer/soccerplay.png'))),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'SOCCER',
                          style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 23, 36, 113),
                          width: 8.0),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40),
                      ),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 5,
                            offset: Offset(1, 7))
                      ]),
                  child: Stack(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 17.h,
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const FutsalPage()));
                              },
                              icon:
                                  Image.asset('image/futsal/futsalplay.png'))),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'FUTSAL',
                          style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 23, 36, 113),
                          width: 8.0),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40),
                      ),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 5,
                            offset: Offset(1, 7))
                      ]),
                  child: Stack(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 17.h,
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const BadmintonPage()));
                              },
                              icon: Image.asset(
                                  'image/badminton/badmintonplay.png'))),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'BADMINTON',
                          style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 23, 36, 113),
                          width: 8.0),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40),
                      ),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 5,
                            offset: Offset(1, 7))
                      ]),
                  child: Stack(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 17.h,
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TabletennisPage()));
                              },
                              icon: Image.asset(
                                  'image/pingpong/pingpongplay.png'))),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'TABLETENNIS',
                          style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              height: 40.h,
              child: ListView(
                padding: const EdgeInsets.all(15),
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 23, 36, 113),
                            width: 8.0),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 5,
                              offset: Offset(1, 7))
                        ]),
                    child: Center(
                        child: TextButton.icon(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SettingPage()));
                            },
                            icon: Icon(
                              Icons.settings,
                              size: 26.sp,
                              color: Colors.black,
                            ),
                            label: Text(
                              'S E T T I N G',
                              style: TextStyle(
                                  fontSize: 15.sp, color: Colors.black,fontWeight: FontWeight.bold),
                            ))),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
