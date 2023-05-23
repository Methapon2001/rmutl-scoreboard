import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/basketball/timer.dart';

class WidgetTimer extends StatefulWidget {
  const WidgetTimer({Key? key, required this.sport}) : super(key: key);

  final int sport;

  @override
  State<WidgetTimer> createState() => _WidgetTimerState();
}

class _WidgetTimerState extends State<WidgetTimer> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            context.read<TimerBasketball>().toggleTimer();
          },
          style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(10),
              backgroundColor: const Color.fromARGB(255, 23, 36, 113)),
          child: Icon(
            (context.watch<TimerBasketball>().isRunning
                ? Icons.pause
                : Icons.play_arrow),
          ),
        ),
        // ElevatedButton(
        //   onPressed: () {
        //     context.read<TimerBasketball>().setDuration(5);
        //   },
        //   style: ElevatedButton.styleFrom(
        //       shape: CircleBorder(), padding: EdgeInsets.all(10)),
        //   child: const Text("Set Time"),
        // ),
        ElevatedButton(
            onPressed: () {
              context.read<TimerBasketball>().resetTimer();
            },
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(10),
                backgroundColor: const Color.fromARGB(255, 23, 36, 113)),
            child: const Icon(Icons.replay)),
      ],
    );
  }
}

class TextTime extends StatelessWidget {
  const TextTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.watch<TimerBasketball>().timeLeftString,
      style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
    );
  }
}
