import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/widgets/button_score.dart';
import 'package:scoreboard/models/score.dart';
import 'package:scoreboard/widgets/menu.dart';

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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: <Widget>[
                    const Text(
                      'Team A',
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      '${context.watch<Score>().score1}',
                      style: const TextStyle(fontSize: 40),
                    ),
                    const ButtonScore(team: 1, increment: 1, decrement: 1),
                    const ButtonScore(team: 1, increment: 2, decrement: 2),
                    const ButtonScore(team: 1, increment: 3, decrement: 3),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'FOUL',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                // SizedBox(width: 60,),
                Column(
                  children: [
                    const Text(
                      'Team B',
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      '${context.watch<Score>().score2}',
                      style: const TextStyle(fontSize: 40),
                    ),
                    const ButtonScore(team: 2, increment: 1, decrement: 1),
                    const ButtonScore(team: 2, increment: 2, decrement: 2),
                    const ButtonScore(team: 2, increment: 3, decrement: 3),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'FOUL',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
            const Text('Quarter'),
          ],
        ),
      )),
    );
  }
}
