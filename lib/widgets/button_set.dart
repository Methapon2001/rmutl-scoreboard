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
  List imagevolleyball = [];
  late Image imagevolleyball0;
  late Image imagevolleyball1;
  late Image imagevolleyball2;
  late Image imagevolleyball3;
  List imagebadminton = [];
  late Image imagebadminton0;
  late Image imagebadminton1;
  late Image imagebadminton2;
  List imagepingpong = [];
  late Image imagepingpong0;
  late Image imagepingpong1;
  late Image imagepingpong2;
  @override
  void initState() {
    super.initState();
    //Volleyball
    imagevolleyball0 = Image.asset(
      "image/volleyball/led0.png",
      width: 60,
    );
    imagevolleyball1 = Image.asset(
      "image/volleyball/led1.png",
      width: 60,
    );
    imagevolleyball2 = Image.asset(
      "image/volleyball/led2.png",
      width: 60,
    );
    imagevolleyball3 = Image.asset(
      "image/volleyball/led3.png",
      width: 60,
    );

    //Badminton
    imagebadminton0 = Image.asset(
      "image/badminton/Set_Badminton0.png",
      width: 60,
    );
    imagebadminton1 = Image.asset(
      "image/badminton/Set_Badminton1.png",
      width: 60,
    );
    imagebadminton2 = Image.asset(
      "image/badminton/Set_Badminton2.png",
      width: 60,
    );

    //Pingpong
    imagepingpong0 = Image.asset(
      "image/pingpong/Set_Pingpong0.png",
      width: 60,
    );
    imagepingpong1 = Image.asset(
      "image/pingpong/Set_Pingpong1.png",
      width: 60,
    );
    imagepingpong2 = Image.asset(
      "image/pingpong/Set_Pingpong2.png",
      width: 60,
    );

    ///*****
    imagevolleyball = [
      imagevolleyball0,
      imagevolleyball1,
      imagevolleyball2,
      imagevolleyball3
    ];
    imagebadminton = [imagebadminton0, imagebadminton1, imagebadminton2];
    imagepingpong = [imagepingpong0, imagepingpong1, imagepingpong2];
  }

  @override
  void didChangeDependencies() {
    precacheImage(imagevolleyball0.image, context);
    precacheImage(imagevolleyball1.image, context);
    precacheImage(imagevolleyball2.image, context);
    precacheImage(imagevolleyball3.image, context);
    precacheImage(imagebadminton0.image, context);
    precacheImage(imagebadminton1.image, context);
    precacheImage(imagebadminton2.image, context);
    precacheImage(imagepingpong0.image, context);
    precacheImage(imagepingpong1.image, context);
    precacheImage(imagepingpong2.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'SET Team',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        widget.sport == 2
            ? Row(
                children: [
                  imagevolleyball[widget.team == 1
                      ? context.watch<SetVolleyball>().getSetTeam1
                      : widget.team == 2
                          ? context.watch<SetVolleyball>().getSetTeam2
                          : 0],
                ],
              )
            : widget.sport == 5
                ? Row(
                    children: [
                      imagebadminton[widget.team == 1
                          ? context.watch<SetBadminton>().getSetTeam1
                          : widget.team == 2
                              ? context.watch<SetBadminton>().getSetTeam2
                              : 0],
                    ],
                  )
                : widget.sport == 6
                    ? Row(
                        children: [
                          imagepingpong[widget.team == 1
                              ? context.watch<SetTabletennis>().getSetTeam1
                              : widget.team == 2
                                  ? context.watch<SetTabletennis>().getSetTeam2
                                  : 0],
                        ],
                      )
                    : widget,
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              shape: const StadiumBorder(),
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
            child: const Text("SET")),
      ],
    );
  }
}
