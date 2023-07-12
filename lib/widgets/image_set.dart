import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/volleyball/set.dart';
import 'package:scoreboard/models/badminton/set.dart';
import 'package:scoreboard/models/tabletennis/set.dart';
import 'package:sizer/sizer.dart';

class ImageSet extends StatefulWidget {
  const ImageSet({Key? key, required this.imagesport, required this.team})
      : super(key: key);

  final int imagesport;
  final int team;

  @override
  State<ImageSet> createState() => _ImageSetState();
}

class _ImageSetState extends State<ImageSet> {
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
      width: 25.w,
    );
    imagevolleyball1 = Image.asset(
      "image/volleyball/led1.png",
      width: 25.w,
    );
    imagevolleyball2 = Image.asset(
      "image/volleyball/led2.png",
      width: 25.w,
    );
    imagevolleyball3 = Image.asset(
      "image/volleyball/led3.png",
      width: 25.w,
    );

    //Badminton
    imagebadminton0 = Image.asset(
      "image/badminton/Set_Badminton0.png",
      width: 25.w,
    );
    imagebadminton1 = Image.asset(
      "image/badminton/Set_Badminton1.png",
      width: 25.w,
    );
    imagebadminton2 = Image.asset(
      "image/badminton/Set_Badminton2.png",
      width: 25.w,
    );

    //Pingpong
    imagepingpong0 = Image.asset(
      "image/pingpong/Set_Pingpong0.png",
      width: 25.w,
    );
    imagepingpong1 = Image.asset(
      "image/pingpong/Set_Pingpong1.png",
      width: 25.w,
    );
    imagepingpong2 = Image.asset(
      "image/pingpong/Set_Pingpong2.png",
      width: 25.w,
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
    return widget.imagesport == 2
        ? Row(
            children: [
              imagevolleyball[widget.team == 1
                  ? context.watch<SetVolleyball>().getSetTeam1
                  : widget.team == 2
                      ? context.watch<SetVolleyball>().getSetTeam2
                      : 0],
            ],
          )
        : widget.imagesport == 5
            ? Row(
                children: [
                  imagebadminton[widget.team == 1
                      ? context.watch<SetBadminton>().getSetTeam1
                      : widget.team == 2
                          ? context.watch<SetBadminton>().getSetTeam2
                          : 0],
                ],
              )
            : widget.imagesport == 6
                ? Row(
                    children: [
                      imagepingpong[widget.team == 1
                          ? context.watch<SetTabletennis>().getSetTeam1
                          : widget.team == 2
                              ? context.watch<SetTabletennis>().getSetTeam2
                              : 0],
                    ],
                  )
                : widget;
  }
}
