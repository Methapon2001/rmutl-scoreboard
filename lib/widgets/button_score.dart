import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/basketball/score.dart';
import 'package:scoreboard/models/volleyball/score.dart';
import 'package:scoreboard/models/soccer/score.dart';
import 'package:scoreboard/models/futsal/score.dart';

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
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green[400],
            shape: const StadiumBorder(),
          ),
          onPressed: () {
            if (widget.sport == 1) {
              context.read<ScoreBasketball>().increment(widget.team, widget.increment);
            }
            if(widget.sport == 2){
              context.read<ScoreVolleyball>().increment(widget.team, widget.increment);
            }
            if(widget.sport == 3){
              context.read<ScoreSoccer>().increment(widget.team, widget.increment);
            }
            if(widget.sport == 4){
              context.read<ScoreFutsal>().increment(widget.team, widget.increment);
            }
          },
          child: Text("+${widget.increment}"),
        ),
        const SizedBox(
          width: 8,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.red[400],
            shape: const StadiumBorder(),
          ),
          onPressed: () {
            if (widget.sport == 1) {
              context.read<ScoreBasketball>().decrement(widget.team, widget.decrement);
            }
            if (widget.sport == 2) {
              context.read<ScoreVolleyball>().decrement(widget.team, widget.decrement);
            }
            if(widget.sport == 3){
              context.read<ScoreSoccer>().decrement(widget.team, widget.decrement);
            }
            if(widget.sport == 4){
              context.read<ScoreFutsal>().decrement(widget.team, widget.decrement);
            }
          },
          child: Text("-${widget.decrement}"),
        ),
      ],
    );
  }
}
