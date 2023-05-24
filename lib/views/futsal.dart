import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/futsal/quarter.dart';
import 'package:scoreboard/models/futsal/score.dart';
import 'package:scoreboard/widgets/button_status.dart';
import 'package:scoreboard/widgets/menu.dart';
import 'package:scoreboard/widgets/teamname.dart';
import 'package:scoreboard/widgets/countdowntime.dart';
import 'package:scoreboard/widgets/button_score.dart';
import 'package:scoreboard/widgets/button_foul.dart';
import 'package:scoreboard/widgets/button_quarter.dart';
import 'package:scoreboard/widgets/button_reset.dart';
import 'package:scoreboard/widgets/image_foul.dart';
import 'package:scoreboard/widgets/button_line.dart';

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
      appBar: Titlebar().appBar("Futsal"),
      endDrawer: const MenuDrawer(index: 4),
      body: Container(
        color: const Color.fromARGB(255, 255, 242, 218),
        child: Center(
          child: Column(children: <Widget>[
            Expanded(
              flex: 20,
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
                              const SizedBox(
                                height: 15,
                              ),
                              const TeamName(team: 1),
                              Text(
                                '${context.watch<ScoreFutsal>().getScoreTeam1}',
                                style: const TextStyle(
                                    fontSize: 60, fontWeight: FontWeight.bold),
                              ),
                              const ImageFoul(imagesport: 4, team: 1)
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 20,
                              ),
                              const Text("Quarter",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  '${context.watch<QuarterFutsal>().getQuarter}',
                                  style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold)),
                              const Text('Time',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                              const CountdownPage(time: 1200),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 15,
                              ),
                              const TeamName(team: 2),
                              Text(
                                '${context.watch<ScoreFutsal>().getScoreTeam2}',
                                style: const TextStyle(
                                    fontSize: 60, fontWeight: FontWeight.bold),
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
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              ButtonScore(
                                  sport: 4,
                                  team: 1,
                                  increment: 1,
                                  decrement: 1),
                              SizedBox(
                                height: 8,
                              ),
                              ButtonFoul(sport: 4, team: 1)
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
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              ButtonScore(
                                  sport: 4,
                                  team: 2,
                                  increment: 1,
                                  decrement: 1),
                              SizedBox(
                                height: 8,
                              ),
                              ButtonFoul(sport: 4, team: 2)
                            ],
                          ),
                        ],
                      ),
                      const ButtonQuarter(sport: 4),
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
                          ButtonReset(sport: 4),
                          SizedBox(
                            width: 10,
                          ),
                          ButtonLine(),
                        ],
                      ),
                      Image.asset(
                        "image/futsal/futsalplay.png",
                        width: 180,
                        height: 180,
                      ),
                    ],
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
