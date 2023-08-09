import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/basketball/score.dart';
import 'package:scoreboard/models/volleyball/score.dart';
import 'package:scoreboard/models/soccer/score.dart';
import 'package:scoreboard/models/futsal/score.dart';
import 'package:scoreboard/models/badminton/score.dart';
import 'package:scoreboard/models/tabletennis/score.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_database/firebase_database.dart';

class ButtonScore extends StatefulWidget {
  const ButtonScore({
    Key? key,
    required this.sport,
    required this.team,
    required this.increment,
    required this.decrement,
  }) : super(key: key);

  final int sport;
  final int team;
  final int increment;
  final int decrement;

  @override
  State<ButtonScore> createState() => _ButtonScoreState();
}

class _ButtonScoreState extends State<ButtonScore> {
  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('FlutterData');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 0, 180, 6),
            shape: const StadiumBorder(),
            minimumSize: Size(17.w, 5.h),
          ),
          onPressed: () {
            if (widget.sport == 1) {
              context
                  .read<ScoreBasketball>()
                  .increment(widget.team, widget.increment);
              if (widget.team == 1) {
                Map<String, String> alldatas = {
                  'ScoreA':
                      context.read<ScoreBasketball>().getScoreTeam1.toString(),
                };
                dbRef.update(alldatas);
              }
              if (widget.team == 2) {
                Map<String, String> alldatas = {
                  'ScoreB':
                      context.read<ScoreBasketball>().getScoreTeam2.toString(),
                };
                dbRef.update(alldatas);
              }
            }

            if (widget.sport == 2) {
              context
                  .read<ScoreVolleyball>()
                  .increment(widget.team, widget.increment);
              if (widget.team == 1) {
                Map<String, String> alldatas = {
                  'ScoreA':
                      context.read<ScoreVolleyball>().getScoreTeam1.toString(),
                };
                dbRef.update(alldatas);
              }
              if (widget.team == 2) {
                Map<String, String> alldatas = {
                  'ScoreB':
                      context.read<ScoreVolleyball>().getScoreTeam2.toString(),
                };
                dbRef.update(alldatas);
              }
            }

            if (widget.sport == 3) {
              context
                  .read<ScoreSoccer>()
                  .increment(widget.team, widget.increment);
              if (widget.team == 1) {
                Map<String, String> alldatas = {
                  'ScoreA':
                      context.read<ScoreSoccer>().getScoreTeam1.toString(),
                };
                dbRef.update(alldatas);
              }
              if (widget.team == 2) {
                Map<String, String> alldatas = {
                  'ScoreB':
                      context.read<ScoreSoccer>().getScoreTeam2.toString(),
                };
                dbRef.update(alldatas);
              }
            }

            if (widget.sport == 4) {
              context
                  .read<ScoreFutsal>()
                  .increment(widget.team, widget.increment);
              if (widget.team == 1) {
                Map<String, String> alldatas = {
                  'ScoreA':
                      context.read<ScoreFutsal>().getScoreTeam1.toString(),
                };
                dbRef.update(alldatas);
              }
              if (widget.team == 2) {
                Map<String, String> alldatas = {
                  'ScoreB':
                      context.read<ScoreFutsal>().getScoreTeam2.toString(),
                };
                dbRef.update(alldatas);
              }
            }

            if (widget.sport == 5) {
              context
                  .read<ScoreBadminton>()
                  .increment(widget.team, widget.increment);
              if (widget.team == 1) {
                Map<String, String> alldatas = {
                  'ScoreA':
                      context.read<ScoreBadminton>().getScoreTeam1.toString(),
                };
                dbRef.update(alldatas);
              }
              if (widget.team == 2) {
                Map<String, String> alldatas = {
                  'ScoreB':
                      context.read<ScoreBadminton>().getScoreTeam2.toString(),
                };
                dbRef.update(alldatas);
              }
            }

            if (widget.sport == 6) {
              context
                  .read<ScoreTabletennis>()
                  .increment(widget.team, widget.increment);
              if (widget.team == 1) {
                Map<String, String> alldatas = {
                  'ScoreA':
                      context.read<ScoreTabletennis>().getScoreTeam1.toString(),
                };
                dbRef.update(alldatas);
              }
              if (widget.team == 2) {
                Map<String, String> alldatas = {
                  'ScoreB':
                      context.read<ScoreTabletennis>().getScoreTeam2.toString(),
                };
                dbRef.update(alldatas).then((value) => null);
              }
            }
          },
          child: Text(
            "+ ${widget.increment}",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 219, 1, 1),
            shape: const StadiumBorder(),
            minimumSize: Size(17.w, 5.h),
          ),
          onPressed: () {
            if (widget.sport == 1) {
              context
                  .read<ScoreBasketball>()
                  .decrement(widget.team, widget.decrement);
              if (widget.team == 1) {
                Map<String, String> alldatas = {
                  'ScoreA':
                      context.read<ScoreBasketball>().getScoreTeam1.toString(),
                };
                dbRef.update(alldatas);
              }
              if (widget.team == 2) {
                Map<String, String> alldatas = {
                  'ScoreB':
                      context.read<ScoreBasketball>().getScoreTeam2.toString(),
                };
                dbRef.update(alldatas);
              }
            }

            if (widget.sport == 2) {
              context
                  .read<ScoreVolleyball>()
                  .decrement(widget.team, widget.decrement);
              if (widget.team == 1) {
                Map<String, String> alldatas = {
                  'ScoreA':
                      context.read<ScoreVolleyball>().getScoreTeam1.toString(),
                };
                dbRef.update(alldatas);
              }
              if (widget.team == 2) {
                Map<String, String> alldatas = {
                  'ScoreB':
                      context.read<ScoreVolleyball>().getScoreTeam2.toString(),
                };
                dbRef.update(alldatas);
              }
            }

            if (widget.sport == 3) {
              context
                  .read<ScoreSoccer>()
                  .decrement(widget.team, widget.decrement);
              if (widget.team == 1) {
                Map<String, String> alldatas = {
                  'ScoreA':
                      context.read<ScoreSoccer>().getScoreTeam1.toString(),
                };
                dbRef.update(alldatas);
              }
              if (widget.team == 2) {
                Map<String, String> alldatas = {
                  'ScoreB':
                      context.read<ScoreSoccer>().getScoreTeam2.toString(),
                };
                dbRef.update(alldatas);
              }
            }

            if (widget.sport == 4) {
              context
                  .read<ScoreFutsal>()
                  .decrement(widget.team, widget.decrement);
              if (widget.team == 1) {
                Map<String, String> alldatas = {
                  'ScoreA':
                      context.read<ScoreFutsal>().getScoreTeam1.toString(),
                };
                dbRef.update(alldatas);
              }
              if (widget.team == 2) {
                Map<String, String> alldatas = {
                  'ScoreB':
                      context.read<ScoreFutsal>().getScoreTeam2.toString(),
                };
                dbRef.update(alldatas);
              }
            }

            if (widget.sport == 5) {
              context
                  .read<ScoreBadminton>()
                  .decrement(widget.team, widget.decrement);
              if (widget.team == 1) {
                Map<String, String> alldatas = {
                  'ScoreA':
                      context.read<ScoreBadminton>().getScoreTeam1.toString(),
                };
                dbRef.update(alldatas);
              }
              if (widget.team == 2) {
                Map<String, String> alldatas = {
                  'ScoreB':
                      context.read<ScoreBadminton>().getScoreTeam2.toString(),
                };
                dbRef.update(alldatas);
              }
            }

            if (widget.sport == 6) {
              context
                  .read<ScoreTabletennis>()
                  .decrement(widget.team, widget.decrement);
              if (widget.team == 1) {
                Map<String, String> alldatas = {
                  'ScoreA':
                      context.read<ScoreTabletennis>().getScoreTeam1.toString(),
                };
                dbRef.update(alldatas);
              }
              if (widget.team == 2) {
                Map<String, String> alldatas = {
                  'ScoreB':
                      context.read<ScoreTabletennis>().getScoreTeam2.toString(),
                };
                dbRef.update(alldatas);
              }
            }
          },
          child: Text(
            "- ${widget.decrement}",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
