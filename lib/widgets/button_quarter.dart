import 'package:flutter/material.dart';
import 'package:scoreboard/models/basketball/quarter.dart';
import 'package:scoreboard/models/volleyball/quarter.dart';
import 'package:scoreboard/models/soccer/quarter.dart';
import 'package:scoreboard/models/futsal/quarter.dart';
import 'package:scoreboard/models/badminton/quarter.dart';
import 'package:scoreboard/models/tabletennis/quarter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_database/firebase_database.dart';

class ButtonQuarter extends StatefulWidget {
  const ButtonQuarter({Key? key, required this.sport, required this.name})
      : super(key: key);

  final int sport;
  final String name;

  @override
  State<ButtonQuarter> createState() => _ButtonQuarterState();
}

class _ButtonQuarterState extends State<ButtonQuarter> {
  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('FlutterData');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
            if (widget.sport == 1) {
              context.read<QuarterBasketball>().increment();
              Map<String, String> alldatas = {
                'Quarter':
                    context.read<QuarterBasketball>().getQuarter.toString(),
              };
              dbRef.update(alldatas);
            }
            if (widget.sport == 2) {
              context.read<QuarterVolleyball>().increment();
              Map<String, String> alldatas = {
                'Quarter':
                    context.read<QuarterVolleyball>().getQuarter.toString(),
              };
              dbRef.update(alldatas);
            }
            if (widget.sport == 3) {
              context.read<QuarterSoccer>().increment();
              Map<String, String> alldatas = {
                'Quarter': context.read<QuarterSoccer>().getQuarter.toString(),
              };
              dbRef.update(alldatas);
            }
            if (widget.sport == 4) {
              context.read<QuarterFutsal>().increment();
              Map<String, String> alldatas = {
                'Quarter': context.read<QuarterFutsal>().getQuarter.toString(),
              };
              dbRef.update(alldatas);
            }
            if (widget.sport == 5) {
              context.read<QuarterBadminton>().increment();
              Map<String, String> alldatas = {
                'Quarter':
                    context.read<QuarterBadminton>().getQuarter.toString(),
              };
              dbRef.update(alldatas);
            }
            if (widget.sport == 6) {
              context.read<QuarterTabletennis>().increment();
              Map<String, String> alldatas = {
                'Quarter':
                    context.read<QuarterTabletennis>().getQuarter.toString(),
              };
              dbRef.update(alldatas);
            }
          },
          child: Text(
            '+ ${widget.name}',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
        ),
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
            if (widget.sport == 1) {
              context.read<QuarterBasketball>().decrement();
              Map<String, String> alldatas = {
                'Quarter':
                    context.read<QuarterBasketball>().getQuarter.toString(),
              };
              dbRef.update(alldatas);
            }
            if (widget.sport == 2) {
              context.read<QuarterVolleyball>().decrement();
              Map<String, String> alldatas = {
                'Quarter':
                    context.read<QuarterVolleyball>().getQuarter.toString(),
              };
              dbRef.update(alldatas);
            }
            if (widget.sport == 3) {
              context.read<QuarterSoccer>().decrement();
              Map<String, String> alldatas = {
                'Quarter': context.read<QuarterSoccer>().getQuarter.toString(),
              };
              dbRef.update(alldatas);
            }
            if (widget.sport == 4) {
              context.read<QuarterFutsal>().decrement();
              Map<String, String> alldatas = {
                'Quarter': context.read<QuarterFutsal>().getQuarter.toString(),
              };
              dbRef.update(alldatas);
            }
            if (widget.sport == 5) {
              context.read<QuarterBadminton>().decrement();
              Map<String, String> alldatas = {
                'Quarter':
                    context.read<QuarterBadminton>().getQuarter.toString(),
              };
              dbRef.update(alldatas);
            }
            if (widget.sport == 6) {
              context.read<QuarterTabletennis>().decrement();
              Map<String, String> alldatas = {
                'Quarter':
                    context.read<QuarterTabletennis>().getQuarter.toString(),
              };
              dbRef.update(alldatas);
            }
          },
          child: Text(
            '- ${widget.name}',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
