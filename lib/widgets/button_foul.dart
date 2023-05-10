import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/basketball/foul.dart';
import 'package:scoreboard/models/futsal/foul.dart';

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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: const Color.fromARGB(255, 23, 36, 113),
        minimumSize: const Size(80, 40),
      ),
      onPressed: () {
        if (widget.sport == 1) {
          context.read<FoulBasketball>().update(widget.team);
        }
        if (widget.sport == 4) {
          context.read<FoulFutsal>().update(widget.team);
        }
      },
      child: const Text('Foul'),
    );
  }
}
