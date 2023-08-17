import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:scoreboard/models/tabletennis/quarter.dart';
import 'package:scoreboard/widgets/button_status.dart';
import 'package:scoreboard/widgets/menu.dart';
import 'package:scoreboard/widgets/teamname.dart';
import 'package:scoreboard/models/tabletennis/score.dart';
import 'package:scoreboard/widgets/button_score.dart';
import 'package:scoreboard/widgets/button_set.dart';
import 'package:scoreboard/widgets/button_quarter.dart';
import 'package:scoreboard/widgets/button_reset.dart';
import 'package:scoreboard/widgets/image_set.dart';
import 'package:scoreboard/widgets/button_line.dart';

import '../widgets/bar.dart';

class TabletennisPage extends StatefulWidget {
  const TabletennisPage({super.key});

  @override
  State<TabletennisPage> createState() => _TabletennisPageState();
}

class _TabletennisPageState extends State<TabletennisPage> {
  DateTime? currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 1)) {
      currentBackPressTime = now;
      showToastExit(context);
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Titlebar().appBar("T A B L E T E N N I S"),
        drawer: const MenuDrawer(index: 6),
        backgroundColor: MyBackgroundColor,
        body: WillPopScope(
          onWillPop: onWillPop,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 6,
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(40),
                                bottomLeft: Radius.circular(40)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 5,
                                  offset: Offset(2, 10))
                            ]),
                        child: Column(children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 0.1.h,
                                  ),
                                  const TeamName(team: 1),
                                  Text(
                                      '${context.watch<ScoreTabletennis>().getScoreTeam1}',
                                      style: TextStyle(
                                          fontSize: 55.sp,
                                          fontWeight: FontWeight.bold)),
                                  const ImageSet(imagesport: 6, team: 1),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text("Set",
                                      style: TextStyle(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      '${context.watch<QuarterTabletennis>().getQuarter}',
                                      style: TextStyle(
                                          fontSize: 35.sp,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 0.1.h,
                                  ),
                                  const TeamName(team: 2),
                                  Text(
                                      '${context.watch<ScoreTabletennis>().getScoreTeam2}',
                                      style: TextStyle(
                                          fontSize: 55.sp,
                                          fontWeight: FontWeight.bold)),
                                  const ImageSet(imagesport: 6, team: 2),
                                ],
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 15,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: const AssetImage(
                                "image/pingpong/pingpongplay.png",
                              ),
                              opacity: 0.15,
                              scale: 2.5.sp),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40)),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 5,
                                offset: Offset(-2, -10))
                          ],
                        ),
                        child: Column(children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    "A",
                                    style: TextStyle(
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const ButtonScore(
                                      sport: 6,
                                      team: 1,
                                      increment: 1,
                                      decrement: 1),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  const ButtonSet(sport: 6, team: 1),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    "B",
                                    style: TextStyle(
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const ButtonScore(
                                      sport: 6,
                                      team: 2,
                                      increment: 1,
                                      decrement: 1),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  const ButtonSet(sport: 6, team: 2),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          const ButtonQuarter(
                            sport: 6,
                            name: 'Time',
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const ButtonStatus(),
                              SizedBox(
                                width: 3.w,
                              ),
                              const ButtonReset(sport: 6),
                              SizedBox(
                                width: 3.w,
                              ),
                              const ButtonLine(),
                            ],
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
