import 'package:flutter/material.dart';
import 'package:scoreboard/models/soccer/quarter.dart';
import 'package:scoreboard/widgets/button_quarter.dart';
import 'package:scoreboard/widgets/button_status.dart';
import 'package:scoreboard/widgets/menu.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/soccer/score.dart';
import 'package:scoreboard/widgets/button_score.dart';
import 'package:scoreboard/widgets/teamname.dart';
import 'package:scoreboard/widgets/button_reset.dart';
import 'package:scoreboard/widgets/button_line.dart';
import 'package:scoreboard/widgets/timer.dart';
import 'package:sizer/sizer.dart';

import '../widgets/bar.dart';

class SoccerPage extends StatefulWidget {
  const SoccerPage({super.key});

  @override
  State<SoccerPage> createState() => _SoccerPageState();
}

class _SoccerPageState extends State<SoccerPage> {
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
        appBar: Titlebar().appBar("S O C C E R"),
        drawer: const MenuDrawer(index: 3),
        backgroundColor: MyBackgroundColor,
        body: WillPopScope(
          onWillPop: onWillPop,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Column(children: <Widget>[
                  Expanded(
                    flex: 25,
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
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
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
                                      '${context.watch<ScoreSoccer>().getScoreTeam1}',
                                      style: TextStyle(
                                          fontSize: 55.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Text("Quater",
                                        style: TextStyle(
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        '${context.watch<QuarterSoccer>().getQuarter}',
                                        style: TextStyle(
                                            fontSize: 35.sp,
                                            fontWeight: FontWeight.bold)),
                                    Text('Time',
                                        style: TextStyle(
                                            fontSize: 23.sp,
                                            fontWeight: FontWeight.bold)),
                                    const TextTime(sport: 3),
                                    const WidgetTimer(sport: 3),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 0.1.h,
                                    ),
                                    const TeamName(team: 2),
                                    Text(
                                      '${context.watch<ScoreSoccer>().getScoreTeam2}',
                                      style: TextStyle(
                                          fontSize: 55.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 45,
                    child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: const AssetImage(
                                "image/soccer/soccerplay.png",
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
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      "A",
                                      style: TextStyle(
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const ButtonScore(
                                        sport: 3,
                                        team: 1,
                                        increment: 1,
                                        decrement: 1),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      "B",
                                      style: TextStyle(
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const ButtonScore(
                                        sport: 3,
                                        team: 2,
                                        increment: 1,
                                        decrement: 1),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const ButtonQuarter(
                              sport: 3,
                              name: 'Quarter',
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            const ButtonSetTime(
                              sport: 3,
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
                                const ButtonReset(sport: 3),
                                SizedBox(
                                  width: 3.w,
                                ),
                                const ButtonLine(),
                              ],
                            ),
                          ],
                        )),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
