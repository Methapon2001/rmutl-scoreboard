import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/basketball/timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoreboard/models/futsal/timer.dart';
import 'package:scoreboard/models/soccer/timer.dart';
import 'package:scoreboard/widgets/roud_button.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_database/firebase_database.dart';

class WidgetTimer extends StatefulWidget {
  const WidgetTimer({Key? key, required this.sport}) : super(key: key);

  final int sport;

  @override
  State<WidgetTimer> createState() => _WidgetTimerState();
}

class _WidgetTimerState extends State<WidgetTimer> {
  late DatabaseReference dbRef;
  late bool status = false;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('FlutterData');
  }

  @override
  Widget build(BuildContext context) {
    return widget.sport == 1
        ? Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  context.read<TimerBasketball>().toggleTimer();
                  status = context.read<TimerBasketball>().isRunning;
                  Map<String, String> alldatas = {
                    'Time': context
                        .read<TimerBasketball>()
                        .timeLeftString
                        .toString(),
                    'RunStatus': '$status',
                  };
                  dbRef.update(alldatas);
                },
                child: RoundButton(
                  icon: (context.watch<TimerBasketball>().isRunning
                      ? Icons.pause
                      : Icons.play_arrow),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    context.read<TimerBasketball>().resetTimer();
                    status = context.read<TimerBasketball>().isRunning;
                    Map<String, String> alldatas = {
                      'Time': context
                          .read<TimerBasketball>()
                          .timeLeftString
                          .toString(),
                      'RunStatus': '$status',
                    };
                    dbRef.update(alldatas);
                  },
                  child: const RoundButton(icon: Icons.replay)),
            ],
          )
        : widget.sport == 3
            ? Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      context.read<TimerSoccer>().toggleTimer();
                      status = context.read<TimerSoccer>().isRunning;
                      Map<String, String> alldatas = {
                        'Time': context
                            .read<TimerSoccer>()
                            .timeLeftString
                            .toString(),
                        'RunStatus': '$status',
                      };
                      dbRef.update(alldatas);
                    },
                    child: RoundButton(
                      icon: (context.watch<TimerSoccer>().isRunning
                          ? Icons.pause
                          : Icons.play_arrow),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        context.read<TimerSoccer>().resetTimer();
                        status = context.read<TimerSoccer>().isRunning;
                        Map<String, String> alldatas = {
                          'Time': context
                              .read<TimerSoccer>()
                              .timeLeftString
                              .toString(),
                          'RunStatus': '$status',
                        };
                        dbRef.update(alldatas);
                      },
                      child: const RoundButton(icon: Icons.replay)),
                ],
              )
            : widget.sport == 4
                ? Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          context.read<TimerFutsal>().toggleTimer();
                          status = context.read<TimerFutsal>().isRunning;
                          Map<String, String> alldatas = {
                            'Time': context
                                .read<TimerFutsal>()
                                .timeLeftString
                                .toString(),
                            'RunStatus': '$status',
                          };
                          dbRef.update(alldatas);
                        },
                        child: RoundButton(
                          icon: (context.watch<TimerFutsal>().isRunning
                              ? Icons.pause
                              : Icons.play_arrow),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            context.read<TimerFutsal>().resetTimer();
                            status = context.read<TimerFutsal>().isRunning;
                            Map<String, String> alldatas = {
                              'Time': context
                                  .read<TimerFutsal>()
                                  .timeLeftString
                                  .toString(),
                              'RunStatus': '$status',
                            };
                            dbRef.update(alldatas);
                          },
                          child: const RoundButton(icon: Icons.replay)),
                    ],
                  )
                : widget;
  }
}

class TextTime extends StatefulWidget {
  const TextTime({Key? key, required this.sport}) : super(key: key);

  final int sport;
  @override
  State<TextTime> createState() => _TextTimeState();
}

class _TextTimeState extends State<TextTime> {
  @override
  Widget build(BuildContext context) {
    return widget.sport == 1
        ? Text(
            context.watch<TimerBasketball>().timeLeftString,
            style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
          )
        : widget.sport == 3
            ? Text(
                context.watch<TimerSoccer>().timeLeftString,
                style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
              )
            : widget.sport == 4
                ? Text(
                    context.watch<TimerFutsal>().timeLeftString,
                    style:
                        TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
                  )
                : widget;
  }
}

class ButtonSetTime extends StatefulWidget {
  const ButtonSetTime({Key? key, required this.sport}) : super(key: key);

  final int sport;
  @override
  State<ButtonSetTime> createState() => _ButtonSetTimeState();
}

class _ButtonSetTimeState extends State<ButtonSetTime> {
  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('FlutterData');
  }

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
        child: Text(
          "Set Time",
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          if (widget.sport == 1) {
            showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return Container(
                    height: 200.sp,
                    color: Colors.white,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Map<String, String> alldatas = {
                                  'Time': context
                                      .read<TimerBasketball>()
                                      .timeLeftString
                                      .toString(),
                                };
                                dbRef.update(alldatas);
                              },
                              child: Text(
                                'Save',
                                style: TextStyle(fontSize: 15.sp),
                              )),
                          Expanded(
                            child: CupertinoTimerPicker(
                                initialTimerDuration:
                                    context.read<TimerBasketball>().duration,
                                onTimerDurationChanged: (time) {
                                  setState(() {
                                    context
                                        .read<TimerBasketball>()
                                        .setDuration(time.inSeconds);
                                  });
                                }),
                          )
                        ]),
                  );
                });
          }
          if (widget.sport == 3) {
            showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return Container(
                    height: 200.sp,
                    color: Colors.white,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Map<String, String> alldatas = {
                                  'Time': context
                                      .read<TimerSoccer>()
                                      .timeLeftString
                                      .toString(),
                                };
                                dbRef.update(alldatas);
                              },
                              child: Text(
                                'Save',
                                style: TextStyle(fontSize: 15.sp),
                              )),
                          Expanded(
                            child: CupertinoTimerPicker(
                                initialTimerDuration:
                                    context.read<TimerSoccer>().duration,
                                onTimerDurationChanged: (time) {
                                  setState(() {
                                    context
                                        .read<TimerSoccer>()
                                        .setDuration(time.inSeconds);
                                  });
                                }),
                          )
                        ]),
                  );
                });
          }
          if (widget.sport == 4) {
            showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return Container(
                    height: 200.sp,
                    color: Colors.white,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Map<String, String> alldatas = {
                                  'Time': context
                                      .read<TimerFutsal>()
                                      .timeLeftString
                                      .toString(),
                                };
                                dbRef.update(alldatas);
                              },
                              child: Text(
                                'Save',
                                style: TextStyle(fontSize: 15.sp),
                              )),
                          Expanded(
                            child: CupertinoTimerPicker(
                                initialTimerDuration:
                                    context.read<TimerFutsal>().duration,
                                onTimerDurationChanged: (time) {
                                  setState(() {
                                    context
                                        .read<TimerFutsal>()
                                        .setDuration(time.inSeconds);
                                  });
                                }),
                          )
                        ]),
                  );
                });
          }
        });
  }
}
