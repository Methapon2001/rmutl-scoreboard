import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/badminton/quarter.dart';
import 'package:scoreboard/models/badminton/score.dart';
import 'package:scoreboard/models/badminton/set.dart';
import 'package:scoreboard/models/basketball/quarter.dart';
import 'package:scoreboard/models/basketball/score.dart';
import 'package:scoreboard/models/basketball/foul.dart';
import 'package:scoreboard/models/basketball/timer.dart';
import 'package:scoreboard/models/futsal/foul.dart';
import 'package:scoreboard/models/futsal/quarter.dart';
import 'package:scoreboard/models/futsal/score.dart';
import 'package:scoreboard/models/soccer/quarter.dart';
import 'package:scoreboard/models/soccer/score.dart';
import 'package:scoreboard/models/tabletennis/quarter.dart';
import 'package:scoreboard/models/tabletennis/score.dart';
import 'package:scoreboard/models/tabletennis/set.dart';
import 'package:scoreboard/models/volleyball/quarter.dart';
import 'package:scoreboard/models/volleyball/score.dart';
import 'package:scoreboard/models/volleyball/set.dart';

class ButtonReset extends StatefulWidget {
  const ButtonReset({
    Key? key,
    required this.sport,
  }) : super(key: key);

  final int sport;

  @override
  State<ButtonReset> createState() => _ButtonResetState();
}

class _ButtonResetState extends State<ButtonReset> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          minimumSize: const Size(110, 40),
          backgroundColor: const Color.fromARGB(255, 23, 36, 113)),
      onPressed: () {
        if (widget.sport == 1) {
          context.read<ScoreBasketball>().reset();
          context.read<FoulBasketball>().reset();
          context.read<QuarterBasketball>().reset();
          context.read<TimerBasketball>().reset();
        }
        if (widget.sport == 2) {
          context.read<ScoreVolleyball>().reset();
          context.read<SetVolleyball>().reset();
          context.read<QuarterVolleyball>().reset();
        }
        if (widget.sport == 3) {
          context.read<ScoreSoccer>().reset();
          context.read<QuarterSoccer>().reset();
        }
        if (widget.sport == 4) {
          context.read<ScoreFutsal>().reset();
          context.read<FoulFutsal>().reset();
          context.read<QuarterFutsal>().reset();
        }
        if (widget.sport == 5) {
          context.read<ScoreBadminton>().reset();
          context.read<SetBadminton>().reset();
          context.read<QuarterBadminton>().reset();
        }
        if (widget.sport == 6) {
          context.read<ScoreTabletennis>().reset();
          context.read<SetTabletennis>().reset();
          context.read<QuarterTabletennis>().reset();
        }
      },
      child: const Text(
        'Reset',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
