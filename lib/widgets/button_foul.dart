import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/basketball/foul.dart';
import 'package:scoreboard/models/futsal/foul.dart';

class ButtonFoul extends StatefulWidget {
  const ButtonFoul({Key? key, required this.sport, required this.team})
      : super(key: key);

  final int sport;
  final int team;

  @override
  State<ButtonFoul> createState() => _ButtonFoulState();
}

class _ButtonFoulState extends State<ButtonFoul> {
  
  List imagebasketball = [];
  late Image imagebasketball0;
  late Image imagebasketball1;
  late Image imagebasketball2;
  late Image imagebasketball3;
  late Image imagebasketball4;
  late Image imagebasketball5;
  late Image imagebasketball6;
  List imagefutsal = [];
  late Image imagefutsal0;
  late Image imagefutsal1;
  late Image imagefutsal2;
  late Image imagefutsal3;
  late Image imagefutsal4;
  late Image imagefutsal5;
  @override
  void initState() {
    super.initState();
    //Basketball
    imagebasketball0 = Image.asset(
      "image/basketball/Fouls_Basketball0.png",
      width: 60,
      gaplessPlayback: true,
    );
    imagebasketball1 = Image.asset(
      "image/basketball/Fouls_Basketball1.png",
      width: 60,
      gaplessPlayback: true,
    );
    imagebasketball2 = Image.asset(
      "image/basketball/Fouls_Basketball2.png",
      width: 60,
      gaplessPlayback: true,
    );
    imagebasketball3 = Image.asset(
      "image/basketball/Fouls_Basketball3.png",
      width: 60,
      gaplessPlayback: true,
    );
    imagebasketball4 = Image.asset(
      "image/basketball/Fouls_Basketball4.png",
      width: 60,
      gaplessPlayback: true,
    );
    imagebasketball5 = Image.asset(
      "image/basketball/Fouls_Basketball5.png",
      width: 60,
      gaplessPlayback: true,
    );
    imagebasketball6 = Image.asset(
      "image/basketball/Fouls_Basketball6.png",
      width: 60,
      gaplessPlayback: true,
    );

    //Futsal
    imagefutsal0 = Image.asset(
      "image/futsal/Fouls_Futsal0.png",
      width: 60,
    );
    imagefutsal1 = Image.asset(
      "image/futsal/Fouls_Futsal1.png",
      width: 60,
    );
    imagefutsal2 = Image.asset(
      "image/futsal/Fouls_Futsal2.png",
      width: 60,
    );
    imagefutsal3 = Image.asset(
      "image/futsal/Fouls_Futsal3.png",
      width: 60,
    );
    imagefutsal4 = Image.asset(
      "image/futsal/Fouls_Futsal4.png",
      width: 60,
    );
    imagefutsal5 = Image.asset(
      "image/futsal/Fouls_Futsal5.png",
      width: 60,
    );

    //****/
    imagebasketball = [
      imagebasketball0,
      imagebasketball1,
      imagebasketball2,
      imagebasketball3,
      imagebasketball4,
      imagebasketball5,
      imagebasketball6
    ];
    imagefutsal = [
      imagefutsal0,
      imagefutsal1,
      imagefutsal2,
      imagefutsal3,
      imagefutsal4,
      imagefutsal5
    ];
  }

  @override
  void didChangeDependencies() {
    precacheImage(imagebasketball0.image, context);
    precacheImage(imagebasketball1.image, context);
    precacheImage(imagebasketball2.image, context);
    precacheImage(imagebasketball3.image, context);
    precacheImage(imagebasketball4.image, context);
    precacheImage(imagebasketball5.image, context);
    precacheImage(imagebasketball6.image, context);
    precacheImage(imagefutsal0.image, context);
    precacheImage(imagefutsal1.image, context);
    precacheImage(imagefutsal2.image, context);
    precacheImage(imagefutsal3.image, context);
    precacheImage(imagefutsal4.image, context);
    precacheImage(imagefutsal5.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        const Text(
          'Team Foul',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        widget.sport == 1
            ? Row(
                children: [
                  imagebasketball[widget.team == 1
                      ? context.watch<FoulBasketball>().getFoulTeam1
                      : context.watch<FoulBasketball>().getFoulTeam2],
                ],
              )
            : widget.sport == 4
                ? Row(
                    children: [
                      imagefutsal[widget.team == 1
                          ? context.watch<FoulFutsal>().getFoulTeam1
                          : context.watch<FoulFutsal>().getFoulTeam2],
                    ],
                  )
                : widget,
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
          ),
          onPressed: () {
            if (widget.sport == 1) {
              context.read<FoulBasketball>().update(widget.team);
            }
            if (widget.sport == 4) {
              context.read<FoulFutsal>().update(widget.team);
            }
          },
          child: const Text('Foul'),
        ),
      ],
    );
  }
}
