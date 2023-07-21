import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/basketball/timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoreboard/models/futsal/timer.dart';
import 'package:scoreboard/models/soccer/timer.dart';
import 'package:scoreboard/widgets/roud_button.dart';
import 'package:sizer/sizer.dart';

class WidgetTimer extends StatefulWidget {
  const WidgetTimer({Key? key, required this.sport}) : super(key: key);

  final int sport;

  @override
  State<WidgetTimer> createState() => _WidgetTimerState();
}

class _WidgetTimerState extends State<WidgetTimer> {
  @override
  Widget build(BuildContext context) {
    return widget.sport == 1
        ? Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  context.read<TimerBasketball>().toggleTimer();
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
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          if (widget.sport == 1) {
            showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    color: Colors.white,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Save',style: TextStyle(fontSize: 15.sp),)),
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
                    height: MediaQuery.of(context).size.height * 0.4,
                    color: Colors.white,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Save',style: TextStyle(fontSize: 15.sp),)),
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
                    height: MediaQuery.of(context).size.height * 0.4,
                    color: Colors.white,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Save',style: TextStyle(fontSize: 15.sp),)),
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
