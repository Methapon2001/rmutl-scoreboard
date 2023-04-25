import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/futsal/score.dart';
import 'package:scoreboard/widgets/button_status.dart';
import 'package:scoreboard/widgets/menu.dart';
import 'package:scoreboard/widgets/teamname.dart';
import 'package:scoreboard/widgets/countdowntime.dart';
import 'package:scoreboard/widgets/button_score.dart';
import 'package:scoreboard/widgets/button_foul.dart';
import 'package:scoreboard/widgets/button_quarter.dart';

class FutsalPage extends StatefulWidget {
  const FutsalPage({super.key});

  @override
  State<FutsalPage> createState() => _FutsalPageState();
}

class _FutsalPageState extends State<FutsalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Futsal"),
      ),
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
                      '${context.watch<ScoreFutsal>().getScoreTeam1}',
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const ButtonScore(
                        sport: 4, team: 1, increment: 1, decrement: 1),
                    const SizedBox(
                      height: 8,
                    ),
                    const ButtonFoul(sport: 4, team: 1),
                  ],
                ),
                Column(
                  children: <Widget>[
                    const TeamName(team: 2),
                    Text(
                      '${context.watch<ScoreFutsal>().getScoreTeam2}',
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const ButtonScore(
                        sport: 4, team: 2, increment: 1, decrement: 1),
                    const SizedBox(
                      height: 8,
                    ),
                    const ButtonFoul(sport: 4, team: 2),
                  ],
                ),
              ],
            ),
            const ButtonQuarter(sport: 4),
            const CountdownPage(time: 1200),
            const ButtonStatus(),
          ]),
        ),
      ),
      endDrawer: const MenuDrawer(index: 4),
    );
  }
}
