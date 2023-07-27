import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/volleyball/set.dart';
import 'package:scoreboard/models/badminton/set.dart';
import 'package:scoreboard/models/tabletennis/set.dart';
import 'package:sizer/sizer.dart';

class ButtonSet extends StatefulWidget {
  const ButtonSet({Key? key, required this.sport, required this.team})
      : super(key: key);

  final int sport;
  final int team;

  @override
  State<ButtonSet> createState() => _ButtonSetState();
}

class _ButtonSetState extends State<ButtonSet> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              shape: const StadiumBorder(),
              backgroundColor: const Color.fromARGB(255, 23, 36, 113),
              minimumSize: Size(20.w, 5.h),
              // foreground
            ),
            onPressed: () {
              if (widget.sport == 2) {
                context.read<SetVolleyball>().increment(widget.team);
              }
              if (widget.sport == 5) {
                context.read<SetBadminton>().increment(widget.team);
              }
              if (widget.sport == 6) {
                context.read<SetTabletennis>().increment(widget.team);
              }
            },
            child: Text(
              "+ SET",
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
            )),
        SizedBox(
          width: 2.w,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              shape: const StadiumBorder(),
              backgroundColor: const Color.fromARGB(255, 23, 36, 113),
              minimumSize: Size(20.w, 5.h),
              // foreground
            ),
            onPressed: () {
              if (widget.sport == 2) {
                context.read<SetVolleyball>().decrement(widget.team);
              }
              if (widget.sport == 5) {
                context.read<SetBadminton>().decrement(widget.team);
              }
              if (widget.sport == 6) {
                context.read<SetTabletennis>().decrement(widget.team);
              }
            },
            child: Text(
              "- SET",
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}
