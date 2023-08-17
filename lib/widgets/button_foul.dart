import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/basketball/foul.dart';
import 'package:scoreboard/models/futsal/foul.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_database/firebase_database.dart';

class ButtonFoul extends StatefulWidget {
  const ButtonFoul({Key? key, required this.sport, required this.team})
      : super(key: key);

  final int sport;
  final int team;

  @override
  State<ButtonFoul> createState() => _ButtonFoulState();
}

class _ButtonFoulState extends State<ButtonFoul> {
  late DatabaseReference dbRef;
  List<bool> onClick = <bool>[
    false,
    false,
  ];
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('FlutterData');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: onClick[0]
                ? const Color.fromARGB(255, 56, 56, 56)
                : const Color.fromARGB(255, 23, 36, 113),
            minimumSize: Size(21.w, 5.h),
          ),
          onPressed: () {
            if (widget.sport == 1) {
              if (widget.team == 1 && !onClick[0]) {
                setState(() {
                  onClick[0] = true;
                });
                context.read<FoulBasketball>().increment(widget.team);
                Map<String, String> alldatas = {
                  'FoulA':
                      context.read<FoulBasketball>().getFoulTeam1.toString(),
                };
                dbRef.update(alldatas);
                Future.delayed(const Duration(milliseconds: 800), () {
                  setState(() {
                    onClick[0] = false;
                  });
                });
              }
              if (widget.team == 2 && !onClick[0]) {
                setState(() {
                  onClick[0] = true;
                });
                context.read<FoulBasketball>().increment(widget.team);
                Map<String, String> alldatas = {
                  'FoulB':
                      context.read<FoulBasketball>().getFoulTeam2.toString(),
                };
                dbRef.update(alldatas);
                Future.delayed(const Duration(milliseconds: 800), () {
                  setState(() {
                    onClick[0] = false;
                  });
                });
              }
            }
            if (widget.sport == 4) {
              if (widget.team == 1 && !onClick[0]) {
                setState(() {
                  onClick[0] = true;
                });
                context.read<FoulFutsal>().increment(widget.team);
                Map<String, String> alldatas = {
                  'FoulA': context.read<FoulFutsal>().getFoulTeam1.toString(),
                };
                dbRef.update(alldatas);
                Future.delayed(const Duration(milliseconds: 800), () {
                  setState(() {
                    onClick[0] = false;
                  });
                });
              }
              if (widget.team == 2 && !onClick[0]) {
                setState(() {
                  onClick[0] = true;
                });
                context.read<FoulFutsal>().increment(widget.team);
                Map<String, String> alldatas = {
                  'FoulB': context.read<FoulFutsal>().getFoulTeam2.toString(),
                };
                dbRef.update(alldatas);
                Future.delayed(const Duration(milliseconds: 800), () {
                  setState(() {
                    onClick[0] = false;
                  });
                });
              }
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
            backgroundColor: onClick[1]
                ? const Color.fromARGB(255, 56, 56, 56)
                : const Color.fromARGB(255, 23, 36, 113),
            minimumSize: Size(21.w, 5.h),
          ),
          onPressed: () {
            if (widget.sport == 1) {
              if (widget.team == 1 && !onClick[1]) {
                setState(() {
                  onClick[1] = true;
                });
                context.read<FoulBasketball>().decrement(widget.team);
                Map<String, String> alldatas = {
                  'FoulA':
                      context.read<FoulBasketball>().getFoulTeam1.toString(),
                };
                dbRef.update(alldatas);
                Future.delayed(const Duration(milliseconds: 800), () {
                  setState(() {
                    onClick[1] = false;
                  });
                });
              }
              if (widget.team == 2 && !onClick[1]) {
                setState(() {
                  onClick[1] = true;
                });
                context.read<FoulBasketball>().decrement(widget.team);
                Map<String, String> alldatas = {
                  'FoulB':
                      context.read<FoulBasketball>().getFoulTeam2.toString(),
                };
                dbRef.update(alldatas);
                Future.delayed(const Duration(milliseconds: 800), () {
                  setState(() {
                    onClick[1] = false;
                  });
                });
              }
            }
            if (widget.sport == 4) {
              if (widget.team == 1 && !onClick[1]) {
                setState(() {
                  onClick[1] = true;
                });
                context.read<FoulFutsal>().decrement(widget.team);
                Map<String, String> alldatas = {
                  'FoulA': context.read<FoulFutsal>().getFoulTeam1.toString(),
                };
                dbRef.update(alldatas);
                Future.delayed(const Duration(milliseconds: 800), () {
                  setState(() {
                    onClick[1] = false;
                  });
                });
              }
              if (widget.team == 2 && !onClick[1]) {
                setState(() {
                  onClick[1] = true;
                });
                context.read<FoulFutsal>().decrement(widget.team);
                Map<String, String> alldatas = {
                  'FoulB': context.read<FoulFutsal>().getFoulTeam2.toString(),
                };
                dbRef.update(alldatas);
                Future.delayed(const Duration(milliseconds: 800), () {
                  setState(() {
                    onClick[1] = false;
                  });
                });
              }
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
