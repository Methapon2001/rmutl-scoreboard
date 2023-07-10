import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/badminton/quarter.dart';
import 'package:scoreboard/widgets/button_status.dart';
import 'package:scoreboard/widgets/menu.dart';
import 'package:scoreboard/widgets/teamname.dart';
import 'package:scoreboard/models/badminton/score.dart';
import 'package:scoreboard/widgets/button_score.dart';
import 'package:scoreboard/widgets/button_set.dart';
import 'package:scoreboard/widgets/button_quarter.dart';
import 'package:scoreboard/widgets/button_reset.dart';
import 'package:scoreboard/widgets/image_set.dart';
import 'package:scoreboard/widgets/button_line.dart';

import '../widgets/bar.dart';

class BadmintonPage extends StatefulWidget {
  const BadmintonPage({super.key});

  @override
  State<BadmintonPage> createState() => _BadmintonPageState();
}

class _BadmintonPageState extends State<BadmintonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Titlebar().appBar("Badminton"),
      drawer: const MenuDrawer(index: 5),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 255, 242, 218),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
                                    '${context.watch<ScoreBadminton>().getScoreTeam1}',
                                    style: const TextStyle(
                                        fontSize: 60,
                                        fontWeight: FontWeight.bold)),
                                const ImageSet(imagesport: 5, team: 1)
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                const Text("Quarter",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                    '${context.watch<QuarterBadminton>().getQuarter}',
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
                                    '${context.watch<ScoreBadminton>().getScoreTeam2}',
                                    style: const TextStyle(
                                        fontSize: 60,
                                        fontWeight: FontWeight.bold)),
                                const ImageSet(imagesport: 5, team: 2)
                              ],
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 15,
                child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "image/badminton/badmintonplay.png",
                          ),
                          opacity: 0.15,
                          scale: 2.7),
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
                                    sport: 5,
                                    team: 1,
                                    increment: 1,
                                    decrement: 1),
                                SizedBox(
                                  height: 8,
                                ),
                                ButtonSet(sport: 5, team: 1),
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
                                    sport: 5,
                                    team: 2,
                                    increment: 1,
                                    decrement: 1),
                                SizedBox(
                                  height: 8,
                                ),
                                ButtonSet(sport: 5, team: 2),
                              ],
                            ),
                          ],
                        ),
                        const ButtonQuarter(sport: 5),
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
                            ButtonReset(sport: 5),
                            SizedBox(
                              width: 10,
                            ),
                            ButtonLine(),
                          ],
                        ),
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
