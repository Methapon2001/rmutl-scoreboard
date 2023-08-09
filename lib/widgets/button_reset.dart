import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
import 'package:scoreboard/models/futsal/timer.dart';
import 'package:scoreboard/models/soccer/quarter.dart';
import 'package:scoreboard/models/soccer/score.dart';
import 'package:scoreboard/models/soccer/timer.dart';
import 'package:scoreboard/models/tabletennis/quarter.dart';
import 'package:scoreboard/models/tabletennis/score.dart';
import 'package:scoreboard/models/tabletennis/set.dart';
import 'package:scoreboard/models/volleyball/quarter.dart';
import 'package:scoreboard/models/volleyball/score.dart';
import 'package:scoreboard/models/volleyball/set.dart';
import 'package:scoreboard/widgets/bar.dart';
import 'package:sizer/sizer.dart';

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
          minimumSize: Size(25.w, 5.h),
          backgroundColor: const Color.fromARGB(255, 23, 36, 113)),
      onPressed: () {
        showToastReset(context);
        if (widget.sport == 1) {
          context.read<ScoreBasketball>().reset();
          context.read<FoulBasketball>().reset();
          context.read<QuarterBasketball>().reset();
          context.read<TimerBasketball>().resetTimer();
        }
        if (widget.sport == 2) {
          context.read<ScoreVolleyball>().reset();
          context.read<SetVolleyball>().reset();
          context.read<QuarterVolleyball>().reset();
        }
        if (widget.sport == 3) {
          context.read<ScoreSoccer>().reset();
          context.read<QuarterSoccer>().reset();
          context.read<TimerSoccer>().resetTimer();
        }
        if (widget.sport == 4) {
          context.read<ScoreFutsal>().reset();
          context.read<FoulFutsal>().reset();
          context.read<QuarterFutsal>().reset();
          context.read<TimerFutsal>().resetTimer();
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
      child: Text(
        'Reset',
        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}
