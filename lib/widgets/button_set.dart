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
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          shape: const StadiumBorder(),
          backgroundColor: const Color.fromARGB(255, 23, 36, 113),
          minimumSize: Size(15.w, 5.h),
          // foreground
        ),
        onPressed: () {
          if (widget.sport == 2) {
            context.read<SetVolleyball>().update(widget.team);
          }
          if (widget.sport == 5) {
            context.read<SetBadminton>().update(widget.team);
          }
          if (widget.sport == 6) {
            context.read<SetTabletennis>().update(widget.team);
          }
        },
        child:Text(
          "SET",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ));
  }
}
