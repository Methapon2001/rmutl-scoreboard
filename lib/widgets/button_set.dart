import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/volleyball/set.dart';
import 'package:scoreboard/models/badminton/set.dart';
import 'package:scoreboard/models/tabletennis/set.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_database/firebase_database.dart';

class ButtonSet extends StatefulWidget {
  const ButtonSet({Key? key, required this.sport, required this.team})
      : super(key: key);

  final int sport;
  final int team;

  @override
  State<ButtonSet> createState() => _ButtonSetState();
}

class _ButtonSetState extends State<ButtonSet> {
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
              foregroundColor: Colors.white,
              shape: const StadiumBorder(),
              backgroundColor: onClick[0]
                  ? const Color.fromARGB(255, 56, 56, 56)
                  : const Color.fromARGB(255, 23, 36, 113),
              minimumSize: Size(20.w, 5.h),
              // foreground
            ),
            onPressed: () {
              if (widget.sport == 2) {
                if (widget.team == 1 && !onClick[0]) {
                  setState(() {
                    onClick[0] = true;
                  });
                  context.read<SetVolleyball>().increment(widget.team);
                  Map<String, String> alldatas = {
                    'SetA':
                        context.read<SetVolleyball>().getSetTeam1.toString(),
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
                  context.read<SetVolleyball>().increment(widget.team);
                  Map<String, String> alldatas = {
                    'SetB':
                        context.read<SetVolleyball>().getSetTeam2.toString(),
                  };
                  dbRef.update(alldatas);
                  Future.delayed(const Duration(milliseconds: 800), () {
                    setState(() {
                      onClick[0] = false;
                    });
                  });
                }
              }
              if (widget.sport == 5) {
                if (widget.team == 1 && !onClick[0]) {
                  setState(() {
                    onClick[0] = true;
                  });
                  context.read<SetBadminton>().increment(widget.team);
                  Map<String, String> alldatas = {
                    'SetA': context.read<SetBadminton>().getSetTeam1.toString(),
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
                  context.read<SetBadminton>().increment(widget.team);
                  Map<String, String> alldatas = {
                    'SetB': context.read<SetBadminton>().getSetTeam2.toString(),
                  };
                  dbRef.update(alldatas);
                  Future.delayed(const Duration(milliseconds: 800), () {
                    setState(() {
                      onClick[0] = false;
                    });
                  });
                }
              }
              if (widget.sport == 6) {
                if (widget.team == 1 && !onClick[0]) {
                  setState(() {
                    onClick[0] = true;
                  });
                  context.read<SetTabletennis>().increment(widget.team);
                  Map<String, String> alldatas = {
                    'SetA':
                        context.read<SetTabletennis>().getSetTeam1.toString(),
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
                  context.read<SetTabletennis>().increment(widget.team);
                  Map<String, String> alldatas = {
                    'SetB':
                        context.read<SetTabletennis>().getSetTeam2.toString(),
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
              backgroundColor: onClick[1]
                  ? const Color.fromARGB(255, 56, 56, 56)
                  : const Color.fromARGB(255, 23, 36, 113),
              minimumSize: Size(20.w, 5.h),
              // foreground
            ),
            onPressed: () {
              if (widget.sport == 2) {
                if (widget.team == 1 && !onClick[1]) {
                  setState(() {
                    onClick[1] = true;
                  });
                  context.read<SetVolleyball>().decrement(widget.team);
                  Map<String, String> alldatas = {
                    'SetA':
                        context.read<SetVolleyball>().getSetTeam1.toString(),
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
                  context.read<SetVolleyball>().decrement(widget.team);
                  Map<String, String> alldatas = {
                    'SetB':
                        context.read<SetVolleyball>().getSetTeam2.toString(),
                  };
                  dbRef.update(alldatas);
                  Future.delayed(const Duration(milliseconds: 800), () {
                    setState(() {
                      onClick[1] = false;
                    });
                  });
                }
              }
              if (widget.sport == 5) {
                if (widget.team == 1 && !onClick[1]) {
                  setState(() {
                    onClick[1] = true;
                  });
                  context.read<SetBadminton>().decrement(widget.team);
                  Map<String, String> alldatas = {
                    'SetA': context.read<SetBadminton>().getSetTeam1.toString(),
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
                  context.read<SetBadminton>().decrement(widget.team);
                  Map<String, String> alldatas = {
                    'SetB': context.read<SetBadminton>().getSetTeam2.toString(),
                  };
                  dbRef.update(alldatas);
                  Future.delayed(const Duration(milliseconds: 800), () {
                    setState(() {
                      onClick[1] = false;
                    });
                  });
                }
              }
              if (widget.sport == 6) {
                if (widget.team == 1 && !onClick[1]) {
                  setState(() {
                    onClick[1] = true;
                  });
                  context.read<SetTabletennis>().decrement(widget.team);
                  Map<String, String> alldatas = {
                    'SetA':
                        context.read<SetTabletennis>().getSetTeam1.toString(),
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
                  context.read<SetTabletennis>().decrement(widget.team);
                  Map<String, String> alldatas = {
                    'SetB':
                        context.read<SetTabletennis>().getSetTeam2.toString(),
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
              "- SET",
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}
