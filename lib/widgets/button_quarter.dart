import 'package:flutter/material.dart';
import 'package:scoreboard/models/basketball/quarter.dart';
import 'package:scoreboard/models/volleyball/quarter.dart';
import 'package:scoreboard/models/soccer/quarter.dart';
import 'package:provider/provider.dart';

class ButtonQuarter extends StatefulWidget {
  const ButtonQuarter({Key? key, required this.sport}) : super(key: key);

  final int sport;

  @override
  State<ButtonQuarter> createState() => _ButtonQuarterState();
}

class _ButtonQuarterState extends State<ButtonQuarter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Quarter',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        TextButton(
            onPressed: () {
              if (widget.sport == 1) {
                context.read<QuarterBasketball>().update();
              }
              if (widget.sport == 2) {
                context.read<QuarterVolleyball>().update();
              }
              if (widget.sport == 3) {
                context.read<QuarterSoccer>().update();
              }
            },
            child: widget.sport == 1
                ? Text(
                    '${context.watch<QuarterBasketball>().getQuarter}',
                    style: const TextStyle(fontSize: 30),
                  )
                : widget.sport == 2
                    ? Text(
                        '${context.watch<QuarterVolleyball>().getQuarter}',
                        style: const TextStyle(fontSize: 30),
                      )
                    : widget.sport == 3
                        ? Text(
                            '${context.watch<QuarterSoccer>().getQuarter}',
                            style: const TextStyle(fontSize: 30),
                          )
                        : widget)
      ],
    );
  }
}
