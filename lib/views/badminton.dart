import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/widgets/menu.dart';
import 'package:scoreboard/widgets/teamname.dart';
import 'package:scoreboard/models/badminton/score.dart';
import 'package:scoreboard/widgets/button_score.dart';
import 'package:scoreboard/widgets/button_set.dart';
import 'package:scoreboard/widgets/button_quarter.dart';

class BadmintonPage extends StatefulWidget {
  const BadmintonPage({super.key});

  @override
  State<BadmintonPage> createState() => _BadmintonPageState();
}

class _BadmintonPageState extends State<BadmintonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Badminton"),
      ),
      endDrawer: const MenuDrawer(index: 5),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: <Widget>[
                      const TeamName(team: 1),
                      Text('${context.watch<ScoreBadminton>().getScoreTeam1}',
                          style: const TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold)),
                      const ButtonScore(
                          sport: 5, team: 1, increment: 1, decrement: 1),
                      const Text(
                        'SET Team A',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const ButtonSet(sport: 5,team: 1),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const TeamName(team: 2),
                      Text('${context.watch<ScoreBadminton>().getScoreTeam2}',
                          style: const TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold)),
                      const ButtonScore(
                          sport: 5, team: 2, increment: 1, decrement: 1),
                      const Text(
                        'SET Team B',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const ButtonSet(sport: 5,team: 2),
                    ],
                  ),
                ],
              ),
              const ButtonQuarter(sport: 5),
            ],
          ),
        ),
      ),
    );
  }
}