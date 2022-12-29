import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/score.dart';

class ButtonScore extends StatefulWidget {
  const ButtonScore(
      {Key? key, required this.increment, required this.decrement, required this.team})
      : super(key: key);

  final int increment;
  final int decrement;
  final int team;
  @override
  State<ButtonScore> createState() => _ButtonScoreState();
}

class _ButtonScoreState extends State<ButtonScore> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green[400],
            // foreground
          ),
          onPressed: () => context.read<Score>().increment(widget.team,widget.increment),
    
          child: Text("+${widget.increment}")),
      const SizedBox(
        width: 8,
      ),
      ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.red[400],
            // foreground
          ),
          onPressed: () => context.read<Score>().decrement(widget.team,widget.decrement),
          child: Text("-${widget.decrement}")),
    ]);
  }

}