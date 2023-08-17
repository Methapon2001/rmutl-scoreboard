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
import 'package:firebase_database/firebase_database.dart';

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
  late DatabaseReference dbRef;
  bool onClick = false;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('FlutterData');
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          minimumSize: Size(25.w, 5.h),
          backgroundColor: onClick
              ? const Color.fromARGB(255, 56, 56, 56)
              : const Color.fromARGB(255, 23, 36, 113)),
      onPressed: () {
        showToastReset(context);
        if (widget.sport == 1 && !onClick) {
          setState(() {
            onClick = true;
          });
          context.read<ScoreBasketball>().reset();
          context.read<FoulBasketball>().reset();
          context.read<QuarterBasketball>().reset();
          Map<String, String> alldatas1 = {
            'Time': context.read<TimerBasketball>().timeLeftString.toString(),
          };
          dbRef.update(alldatas1);
          context.read<TimerBasketball>().clearTimer(600);
          Map<String, String> alldatas2 = {
            'FoulA': context.read<FoulBasketball>().getFoulTeam1.toString(),
            'FoulB': context.read<FoulBasketball>().getFoulTeam1.toString(),
            'Quarter': context.read<QuarterBasketball>().getQuarter.toString(),
            'RunStatus': context.read<TimerBasketball>().isRunning.toString(),
            'ScoreA': context.read<ScoreBasketball>().getScoreTeam1.toString(),
            'ScoreB': context.read<ScoreBasketball>().getScoreTeam2.toString(),
            'Time': context.read<TimerBasketball>().timeLeftString.toString(),
          };
          dbRef.update(alldatas2);
          Future.delayed(const Duration(milliseconds: 800), () {
            setState(() {
              onClick = false;
            });
          });
        }
        if (widget.sport == 2 && !onClick) {
          setState(() {
            onClick = true;
          });
          context.read<ScoreVolleyball>().reset();
          context.read<SetVolleyball>().reset();
          context.read<QuarterVolleyball>().reset();
          Map<String, String> alldatas = {
            'Quarter': context.read<QuarterVolleyball>().getQuarter.toString(),
            'ScoreA': context.read<ScoreVolleyball>().getScoreTeam1.toString(),
            'ScoreB': context.read<ScoreVolleyball>().getScoreTeam2.toString(),
            'SetA': context.read<SetVolleyball>().getSetTeam1.toString(),
            'SetB': context.read<SetVolleyball>().getSetTeam2.toString(),
          };
          dbRef.update(alldatas);
          Future.delayed(const Duration(milliseconds: 800), () {
            setState(() {
              onClick = false;
            });
          });
        }
        if (widget.sport == 3 && !onClick) {
          setState(() {
            onClick = true;
          });
          context.read<ScoreSoccer>().reset();
          context.read<QuarterSoccer>().reset();
          Map<String, String> alldatas1 = {
            'Time': context.read<TimerSoccer>().timeLeftString.toString(),
          };
          dbRef.update(alldatas1);
          context.read<TimerSoccer>().clearTimer(2700);
          Map<String, String> alldatas2 = {
            'Quarter': context.read<QuarterSoccer>().getQuarter.toString(),
            'RunStatus': context.read<TimerSoccer>().isRunning.toString(),
            'ScoreA': context.read<ScoreSoccer>().getScoreTeam1.toString(),
            'ScoreB': context.read<ScoreSoccer>().getScoreTeam2.toString(),
            'Time': context.read<TimerSoccer>().timeLeftString.toString(),
          };
          dbRef.update(alldatas2);
          Future.delayed(const Duration(milliseconds: 800), () {
            setState(() {
              onClick = false;
            });
          });
        }
        if (widget.sport == 4 && !onClick) {
          setState(() {
            onClick = true;
          });
          context.read<ScoreFutsal>().reset();
          context.read<FoulFutsal>().reset();
          context.read<QuarterFutsal>().reset();
          Map<String, String> alldatas1 = {
            'Time': context.read<TimerFutsal>().timeLeftString.toString(),
          };
          dbRef.update(alldatas1);
          context.read<TimerFutsal>().clearTimer(1200);
          Map<String, String> alldatas2 = {
            'FoulA': context.read<FoulFutsal>().getFoulTeam1.toString(),
            'FoulB': context.read<FoulFutsal>().getFoulTeam1.toString(),
            'Quarter': context.read<QuarterFutsal>().getQuarter.toString(),
            'RunStatus': context.read<TimerFutsal>().isRunning.toString(),
            'ScoreA': context.read<ScoreFutsal>().getScoreTeam1.toString(),
            'ScoreB': context.read<ScoreFutsal>().getScoreTeam2.toString(),
            'Time': context.read<TimerFutsal>().timeLeftString.toString(),
          };
          dbRef.update(alldatas2);
          Future.delayed(const Duration(milliseconds: 800), () {
            setState(() {
              onClick = false;
            });
          });
        }
        if (widget.sport == 5 && !onClick) {
          setState(() {
            onClick = true;
          });
          context.read<ScoreBadminton>().reset();
          context.read<SetBadminton>().reset();
          context.read<QuarterBadminton>().reset();
          Map<String, String> alldatas = {
            'Quarter': context.read<QuarterBadminton>().getQuarter.toString(),
            'ScoreA': context.read<ScoreBadminton>().getScoreTeam1.toString(),
            'ScoreB': context.read<ScoreBadminton>().getScoreTeam2.toString(),
            'SetA': context.read<SetBadminton>().getSetTeam1.toString(),
            'SetB': context.read<SetBadminton>().getSetTeam2.toString(),
          };
          dbRef.update(alldatas);
          Future.delayed(const Duration(milliseconds: 800), () {
            setState(() {
              onClick = false;
            });
          });
        }
        if (widget.sport == 6 && !onClick) {
          setState(() {
            onClick = true;
          });
          context.read<ScoreTabletennis>().reset();
          context.read<SetTabletennis>().reset();
          context.read<QuarterTabletennis>().reset();
          Map<String, String> alldatas = {
            'Quarter': context.read<QuarterTabletennis>().getQuarter.toString(),
            'ScoreA': context.read<ScoreTabletennis>().getScoreTeam1.toString(),
            'ScoreB': context.read<ScoreTabletennis>().getScoreTeam2.toString(),
            'SetA': context.read<SetTabletennis>().getSetTeam1.toString(),
            'SetB': context.read<SetTabletennis>().getSetTeam2.toString(),
          };
          dbRef.update(alldatas);
          Future.delayed(const Duration(milliseconds: 800), () {
            setState(() {
              onClick = false;
            });
          });
        }
      },
      child: Text(
        'Reset',
        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}
