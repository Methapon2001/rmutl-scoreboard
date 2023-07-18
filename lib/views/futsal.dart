import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/futsal/quarter.dart';
import 'package:scoreboard/models/futsal/score.dart';
import 'package:scoreboard/widgets/button_status.dart';
import 'package:scoreboard/widgets/menu.dart';
import 'package:scoreboard/widgets/teamname.dart';
import 'package:scoreboard/widgets/button_score.dart';
import 'package:scoreboard/widgets/button_foul.dart';
import 'package:scoreboard/widgets/button_quarter.dart';
import 'package:scoreboard/widgets/button_reset.dart';
import 'package:scoreboard/widgets/image_foul.dart';
import 'package:scoreboard/widgets/button_line.dart';
import 'package:scoreboard/widgets/timer.dart';
import 'package:sizer/sizer.dart';

import '../widgets/bar.dart';

class FutsalPage extends StatefulWidget {
  const FutsalPage({super.key});

  @override
  State<FutsalPage> createState() => _FutsalPageState();
}

class _FutsalPageState extends State<FutsalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Titlebar().appBar("F U T S A L"),
      drawer: const MenuDrawer(index: 4),
      backgroundColor: MyBackgroundColor,
      body: SingleChildScrollView(
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
                                  '${context.watch<ScoreFutsal>().getScoreTeam1}',
                                  style: TextStyle(
                                      fontSize: 55.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                const ImageFoul(imagesport: 4, team: 1)
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
                                    '${context.watch<QuarterFutsal>().getQuarter}',
                                    style: TextStyle(
                                        fontSize: 35.sp,
                                        fontWeight: FontWeight.bold)),
                                Text('Time',
                                    style: TextStyle(
                                        fontSize: 23.sp,
                                        fontWeight: FontWeight.bold)),
                                const TextTime(sport: 4),
                                const WidgetTimer(sport: 4),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 0.1.h,
                                ),
                                const TeamName(team: 2),
                                Text(
                                  '${context.watch<ScoreFutsal>().getScoreTeam2}',
                                  style: TextStyle(
                                      fontSize: 55.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                const ImageFoul(imagesport: 4, team: 2)
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
                            "image/futsal/futsalplay.png",
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
                                  height: 2.h,
                                ),
                                Text(
                                  "A",
                                  style: TextStyle(
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                const ButtonScore(
                                    sport: 4,
                                    team: 1,
                                    increment: 1,
                                    decrement: 1),
                                SizedBox(
                                  height: 1.h,
                                ),
                                const ButtonFoul(sport: 4, team: 1)
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
                                    sport: 4,
                                    team: 2,
                                    increment: 1,
                                    decrement: 1),
                                SizedBox(
                                  height: 1.h,
                                ),
                                const ButtonFoul(sport: 4, team: 2)
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const ButtonQuarter(sport: 4,name: 'Quarter',),
                            SizedBox(
                              width: 3.w,
                            ),
                            const ButtonSetTime(
                              sport: 4,
                            ),
                          ],
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
                            const ButtonReset(sport: 4),
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
    );
  }
}
