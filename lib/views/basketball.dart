import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/basketball/quarter.dart';
import 'package:scoreboard/widgets/timer.dart';
import 'package:scoreboard/widgets/bar.dart';
import 'package:scoreboard/widgets/button_reset.dart';
import 'package:scoreboard/widgets/button_status.dart';
import 'package:scoreboard/widgets/menu.dart';
import 'package:scoreboard/models/basketball/score.dart';
import 'package:scoreboard/widgets/button_score.dart';
import 'package:scoreboard/widgets/button_foul.dart';
import 'package:scoreboard/widgets/button_quarter.dart';
import 'package:scoreboard/widgets/teamname.dart';
import 'package:scoreboard/widgets/image_foul.dart';
import 'package:scoreboard/widgets/button_line.dart';
import 'package:sizer/sizer.dart';

class BasketballPage extends StatefulWidget {
  const BasketballPage({super.key});

  @override
  State<BasketballPage> createState() => _BasketballPageState();
}

class _BasketballPageState extends State<BasketballPage> {
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
    return Scaffold(
        appBar: Titlebar().appBar("B A S K E T B A L L"),
        drawer: const MenuDrawer(index: 1),
        backgroundColor: MyBackgroundColor,
        body: WillPopScope(
          onWillPop: onWillPop,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 28,
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
                                  '${context.watch<ScoreBasketball>().getScoreTeam1}',
                                  style: TextStyle(
                                      fontSize: 55.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                const ImageFoul(imagesport: 1, team: 1),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text("Quarter",
                                    style: TextStyle(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                    '${context.watch<QuarterBasketball>().getQuarter}',
                                    style: TextStyle(
                                        fontSize: 35.sp,
                                        fontWeight: FontWeight.bold)),
                                Text('Time',
                                    style: TextStyle(
                                        fontSize: 23.sp,
                                        fontWeight: FontWeight.bold)),
                                const TextTime(
                                  sport: 1,
                                ),
                                const WidgetTimer(sport: 1),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 0.1.h,
                                ),
                                const TeamName(team: 2),
                                Text(
                                  '${context.watch<ScoreBasketball>().getScoreTeam2}',
                                  style: TextStyle(
                                      fontSize: 55.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                const ImageFoul(imagesport: 1, team: 2),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
                            "image/basketball/basketballplay.png",
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
                    child: SingleChildScrollView(
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
                                  Text(
                                    "A",
                                    style: TextStyle(
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const ButtonScore(
                                      sport: 1,
                                      team: 1,
                                      increment: 1,
                                      decrement: 1),
                                  const ButtonScore(
                                      sport: 1,
                                      team: 1,
                                      increment: 2,
                                      decrement: 2),
                                  const ButtonScore(
                                      sport: 1,
                                      team: 1,
                                      increment: 3,
                                      decrement: 3),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  const ButtonFoul(sport: 1, team: 1),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 0.1.h,
                                  ),
                                  Text(
                                    "B",
                                    style: TextStyle(
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const ButtonScore(
                                      sport: 1,
                                      team: 2,
                                      increment: 1,
                                      decrement: 1),
                                  const ButtonScore(
                                      sport: 1,
                                      team: 2,
                                      increment: 2,
                                      decrement: 2),
                                  const ButtonScore(
                                      sport: 1,
                                      team: 2,
                                      increment: 3,
                                      decrement: 3),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  const ButtonFoul(sport: 1, team: 2),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          const ButtonQuarter(
                            sport: 1,
                            name: 'Quarter',
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          const ButtonSetTime(
                            sport: 1,
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
                              const ButtonReset(sport: 1),
                              SizedBox(
                                width: 3.w,
                              ),
                              const ButtonLine(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
