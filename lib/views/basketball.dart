import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/widgets/menu.dart';
import 'package:scoreboard/models/basketball/score.dart';
import 'package:scoreboard/models/basketball/foul.dart';
import 'package:scoreboard/widgets/button_score.dart';
import 'package:scoreboard/widgets/button_foul.dart';
import 'package:scoreboard/widgets/button_quarter.dart';
import 'package:scoreboard/views/countdowntime.dart';

class BasketballPage extends StatefulWidget {
  const BasketballPage({super.key});

  @override
  State<BasketballPage> createState() => _BasketballPageState();
}

class _BasketballPageState extends State<BasketballPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basketball'),
      ),
      endDrawer: const MenuDrawer(index: 1),
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
                      const Text(
                        'Team A',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${context.watch<ScoreBasketball>().getScoreTeam1}',
                        style: const TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      const ButtonScore(
                          sport: 1, team: 1, increment: 1, decrement: 1),
                      const ButtonScore(
                          sport: 1, team: 1, increment: 2, decrement: 2),
                      const ButtonScore(
                          sport: 1, team: 1, increment: 3, decrement: 3),
                      const Text(
                        'Team Foul',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text('${context.watch<FoulBasketball>().getFoulTeam1}'),
                      const ButtonFoul(sport: 1, team: 1),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Text(
                        'Team B',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${context.watch<ScoreBasketball>().getScoreTeam2}',
                        style: const TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      const ButtonScore(
                          sport: 1, team: 2, increment: 1, decrement: 1),
                      const ButtonScore(
                          sport: 1, team: 2, increment: 2, decrement: 2),
                      const ButtonScore(
                          sport: 1, team: 2, increment: 3, decrement: 3),
                      const Text(
                        'Team Foul',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text('${context.watch<FoulBasketball>().getFoulTeam2}'),
                      const ButtonFoul(sport: 1, team: 2),
                    ],
                  ),
                ],
              ),
              const Text(
                'Quarter',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const ButtonQuarter(sport: 1),
              const Text('Time',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const CountdownPage(),
            ],
          ),
        ),
      ),
    );
  }
}
