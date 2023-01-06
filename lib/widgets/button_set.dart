import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/volleyball/set.dart';
import 'package:scoreboard/models/badminton/set.dart';
import 'package:scoreboard/models/tabletennis/set.dart';

class ButtonSet extends StatefulWidget {
  const ButtonSet({Key? key, required this.sport, required this.team})
      : super(key: key);

  final int sport;
  final int team;

  @override
  State<ButtonSet> createState() => _ButtonSetState();
}

class _ButtonSetState extends State<ButtonSet> {
  late Image image1;
  late Image image2;
  late Image image3;
  late Image image4;
  List image = [];
  @override
  void initState() {
    super.initState();
    image1 = Image.asset(
      "image/led0.png",
      width: 60,
    ); // set0
    image2 = Image.asset(
      "image/led1.png",
      width: 60,
    ); // set1
    image3 = Image.asset(
      "image/led2.png",
      width: 60,
    ); // set2
    image4 = Image.asset(
      "image/led3.png",
      width: 60,
    ); // set3

    image = [image1, image2, image3, image4];
  }

  @override
  void didChangeDependencies() {
    precacheImage(image1.image, context);
    precacheImage(image2.image, context);
    precacheImage(image3.image, context);
    precacheImage(image4.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.sport == 2
            ? Row(
                children: [
                  image[widget.team == 1
                      ? context.watch<SetVolleyball>().getSetTeam1
                      : widget.team == 2
                          ? context.watch<SetVolleyball>().getSetTeam2
                          : 0],
                ],
              )
            : widget.sport == 5
                ? Row(
                    children: [
                      image[widget.team == 1
                          ? context.watch<SetBadminton>().getSetTeam1
                          : widget.team == 2
                              ? context.watch<SetBadminton>().getSetTeam2
                              : 0],
                    ],
                  )
                : widget.sport == 6
                ? Row(
                    children: [
                      image[widget.team == 1
                          ? context.watch<SetTabletennis>().getSetTeam1
                          : widget.team == 2
                              ? context.watch<SetTabletennis>().getSetTeam2
                              : 0],
                    ],
                  ): widget,
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 94, 96, 245),
              shape: const StadiumBorder(),
              // foreground
            ),
            onPressed: () {
              if (widget.sport == 1) {
                context.read<SetVolleyball>().update(widget.team);
              }
              if (widget.sport == 5) {
                context.read<SetBadminton>().update(widget.team);
              }
              if (widget.sport == 6) {
                context.read<SetTabletennis>().update(widget.team);
              }
            },
            child: const Text("+SET")),
      ],
    );
  }
}
