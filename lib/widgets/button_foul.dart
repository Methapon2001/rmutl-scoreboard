import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/basketball/foul.dart';

class ButtonFoul extends StatefulWidget {
  const ButtonFoul({Key? key, required this.sport, required this.team})
      : super(key: key);

  final int sport;
  final int team;

  @override
  State<ButtonFoul> createState() => _ButtonFoulState();
}

class _ButtonFoulState extends State<ButtonFoul> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Team Foul',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        widget.sport == 1
            ? Text(
                '${widget.team == 1 ? context.watch<FoulBasketball>().getFoulTeam1 : context.watch<FoulBasketball>().getFoulTeam2}')
            : widget,
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
          ),
          onPressed: () {
            if (widget.sport == 1) {
              context.read<FoulBasketball>().update(widget.team);
            }
          },
          child: const Text('Foul'),
        ),
      ],
    );
  }
}
