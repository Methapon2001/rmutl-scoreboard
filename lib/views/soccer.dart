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

import '../widgets/bar.dart';

class SoccerPage extends StatefulWidget {
  const SoccerPage({super.key});

  @override
  State<SoccerPage> createState() => _SoccerPageState();
}

class _SoccerPageState extends State<SoccerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Titlebar().appBar("Soccer"),
      drawer: const MenuDrawer(index: 3),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 255, 242, 218),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(children: <Widget>[
              Expanded(
                flex: 23,
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
                                  '${context.watch<ScoreSoccer>().getScoreTeam1}',
                                  style: const TextStyle(
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold),
                                ),
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
                                    '${context.watch<QuarterSoccer>().getQuarter}',
                                    style: const TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold)),
                                const Text('Time',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                                const TextTime(sport: 3),
                                const WidgetTimer(sport: 3),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                const SizedBox(
                                  height: 15,
                                ),
                                const TeamName(team: 2),
                                Text(
                                  '${context.watch<ScoreSoccer>().getScoreTeam2}',
                                  style: const TextStyle(
                                      fontSize: 60,
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
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "image/soccer/soccerplay.png",
                          ),
                          opacity: 0.15,
                          scale: 3),
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
                                    sport: 3,
                                    team: 1,
                                    increment: 1,
                                    decrement: 1),
                                SizedBox(
                                  height: 8,
                                ),
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
                                    sport: 3,
                                    team: 2,
                                    increment: 1,
                                    decrement: 1),
                                SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            ButtonQuarter(sport: 3),
                            SizedBox(
                              width: 10,
                            ),
                            ButtonSetTime(
                              sport: 3,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            ButtonStatus(),
                            SizedBox(
                              width: 10,
                            ),
                            ButtonReset(sport: 3),
                            SizedBox(
                              width: 10,
                            ),
                            ButtonLine(),
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
