import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoreboard/widgets/roud_button.dart';

class CountdownPage extends StatefulWidget {
  const CountdownPage({Key? key, required this.time}) : super(key: key);

  final int time;

  @override
  State<CountdownPage> createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool isPlaying = false;
  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.time),
    );

    controller.addListener(() {
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (controller.isDismissed) {
              showModalBottomSheet(
                context: context,
                builder: (context) => SizedBox(
                  height: 300,
                  child: CupertinoTimerPicker(
                    initialTimerDuration: controller.duration!,
                    onTimerDurationChanged: (time) {
                      setState(() {
                        controller.duration = time;
                      });
                    },
                  ),
                ),
              );
            }
          },
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) => Text(
              countText,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                if (controller.isAnimating) {
                  controller.stop();
                  setState(() {
                    isPlaying = false;
                  });
                } else {
                  controller.reverse(
                      from: controller.value == 0 ? 1.0 : controller.value);
                  setState(() {
                    isPlaying = true;
                  });
                }
              },
              child: RoundButton(
                icon: isPlaying == true ? Icons.pause : Icons.play_arrow,
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.reset();
                setState(() {
                  isPlaying = false;
                });
              },
              child: const RoundButton(
                icon: Icons.stop,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
