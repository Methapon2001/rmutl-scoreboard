import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/basketball/foul.dart';
import 'package:scoreboard/models/futsal/foul.dart';
import 'package:sizer/sizer.dart';

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
    return Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: const Color.fromARGB(255, 23, 36, 113),
            minimumSize: Size(21.w, 5.h),
          ),
          onPressed: () {
            if (widget.sport == 1) {
              context.read<FoulBasketball>().increment(widget.team);
            }
            if (widget.sport == 4) {
              context.read<FoulFutsal>().increment(widget.team);
            }
          },
          child: Text(
            '+ Foul',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 2.w,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: const Color.fromARGB(255, 23, 36, 113),
            minimumSize: Size(21.w, 5.h),
          ),
          onPressed: () {
            if (widget.sport == 1) {
              context.read<FoulBasketball>().decrement(widget.team);
            }
            if (widget.sport == 4) {
              context.read<FoulFutsal>().decrement(widget.team);
            }
          },
          child: Text(
            '- Foul',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
