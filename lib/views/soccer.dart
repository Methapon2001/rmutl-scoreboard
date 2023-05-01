import 'package:flutter/material.dart';
import 'package:scoreboard/widgets/button_quarter.dart';
import 'package:scoreboard/widgets/button_status.dart';
import 'package:scoreboard/widgets/menu.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/soccer/score.dart';
import 'package:scoreboard/widgets/button_score.dart';
import 'package:scoreboard/widgets/teamname.dart';
import 'package:scoreboard/widgets/countdowntime.dart';
import 'package:scoreboard/widgets/button_reset.dart';

class SoccerPage extends StatefulWidget {
  const SoccerPage({super.key});

  @override
  State<SoccerPage> createState() => _SoccerPageState();
}

class _SoccerPageState extends State<SoccerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Soccer"),
      ),
      endDrawer: const MenuDrawer(index: 3),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: <Widget>[
                    const TeamName(team: 1),
                    Text(
                      '${context.watch<ScoreSoccer>().getScoreTeam1}',
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const ButtonScore(
                        sport: 3, team: 1, increment: 1, decrement: 1),
                  ],
                ),
                Column(
                  children: <Widget>[
                    const TeamName(team: 2),
                    Text(
                      '${context.watch<ScoreSoccer>().getScoreTeam2}',
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const ButtonScore(
                        sport: 3, team: 2, increment: 1, decrement: 1),
                  ],
                ),
              ],
            ),
            const ButtonQuarter(sport: 3),
            const CountdownPage(time: 2700),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                ButtonStatus(),
                SizedBox(
                  width: 10,
                ),
                ButtonReset(sport: 3),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
