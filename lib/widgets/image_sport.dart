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
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BasketballPage())),
                  child: Container(
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Image.asset(
                            'image/basketball/basketballplay.png',
                            width: 15.5.w,
                            height: 15.5.h,
                          ),
                          Text(
                            'BASKETBALL',
                            style: TextStyle(fontSize: 12.sp),
                          )
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VolleyballPage())),
                  child: Container(
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Image.asset(
                            'image/volleyball/volleyballplay.png',
                            width: 30.w,
                            height: 15.h,
                          ),
                          Text(
                            'VOLLEYBALL',
                            style: TextStyle(fontSize: 12.sp),
                          )
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SoccerPage())),
                  child: Container(
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Image.asset(
                            'image/soccer/soccerplay.png',
                            width: 30.w,
                            height: 15.h,
                          ),
                          Text(
                            'SOCCER',
                            style: TextStyle(fontSize: 12.sp),
                          )
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FutsalPage())),
                  child: Container(
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Image.asset(
                            'image/futsal/futsalplay.png',
                            width: 30.w,
                            height: 15.h,
                          ),
                          Text(
                            'FUTSAL',
                            style: TextStyle(fontSize: 12.sp),
                          )
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BadmintonPage())),
                  child: Container(
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Image.asset(
                            'image/badminton/badmintonplay.png',
                            width: 30.w,
                            height: 15.h,
                          ),
                          Text(
                            'BADMINTON',
                            style: TextStyle(fontSize: 12.sp),
                          )
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TabletennisPage())),
                  child: Container(
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Image.asset(
                            'image/pingpong/pingpongplay.png',
                            width: 30.w,
                            height: 15.h,
                          ),
                          Text(
                            'TABLETENNIS',
                            style: TextStyle(fontSize: 12.sp),
                          )
                        ],
                      )),
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
                              Navigator.pushReplacement(
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
                                fontSize: 15.sp,
                                color: Colors.black,
                              ),
                            ))),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
