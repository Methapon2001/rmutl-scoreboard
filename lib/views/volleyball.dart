import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:scoreboard/models/volleyball/quarter.dart';
import 'package:scoreboard/models/volleyball/score.dart';
import 'package:scoreboard/widgets/button_score.dart';
import 'package:scoreboard/widgets/button_set.dart';
import 'package:scoreboard/widgets/button_quarter.dart';
import 'package:scoreboard/widgets/button_status.dart';
import 'package:scoreboard/widgets/menu.dart';
import 'package:scoreboard/widgets/teamname.dart';
import 'package:scoreboard/widgets/button_reset.dart';
import 'package:scoreboard/widgets/image_set.dart';
import 'package:scoreboard/widgets/button_line.dart';

import '../widgets/bar.dart';

class VolleyballPage extends StatefulWidget {
  const VolleyballPage({super.key});

  @override
  State<VolleyballPage> createState() => _VolleyballPageState();
}

class _VolleyballPageState extends State<VolleyballPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Titlebar().appBar("Volleyball"),
      endDrawer: const MenuDrawer(index: 2),
      body: Container(
        color: const Color.fromARGB(255, 255, 242, 218),
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 5,
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
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 15,
                              ),
                              const TeamName(team: 1),
                              Text(
                                  '${context.watch<ScoreVolleyball>().getScoreTeam1}',
                                  style: const TextStyle(
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold)),
                              const ImageSet(imagesport: 2, team: 1),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              const Text("Quarter",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  '${context.watch<QuarterVolleyball>().getQuarter}',
                                  style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 15,
                              ),
                              const TeamName(team: 2),
                              Text(
                                  '${context.watch<ScoreVolleyball>().getScoreTeam2}',
                                  style: const TextStyle(
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold)),
                              const ImageSet(imagesport: 2, team: 2)
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 15,
                child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      color: Colors.white,
                      boxShadow: [
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
                              children: const <Widget>[
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "A",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                ButtonScore(
                                    sport: 2,
                                    team: 1,
                                    increment: 1,
                                    decrement: 1),
                                SizedBox(
                                  height: 8,
                                ),
                                ButtonSet(sport: 2, team: 1),
                              ],
                            ),
                            Column(
                              children: const <Widget>[
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "B",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                ButtonScore(
                                    sport: 2,
                                    team: 2,
                                    increment: 1,
                                    decrement: 1),
                                SizedBox(
                                  height: 8,
                                ),
                                ButtonSet(sport: 2, team: 2),
                              ],
                            ),
                          ],
                        ),
                        const ButtonQuarter(sport: 2),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            ButtonStatus(),
                            SizedBox(
                              width: 10,
                            ),
                            ButtonReset(sport: 2),
                            SizedBox(
                              width: 10,
                            ),
                            ButtonLine(),
                          ],
                        ),
                        Image.asset(
                          "image/volleyball/volleyballplay.png",
                          width: 200,
                          height: 200,
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
