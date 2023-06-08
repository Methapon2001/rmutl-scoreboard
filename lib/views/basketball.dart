import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/basketball/quarter.dart';
import 'package:scoreboard/widgets/timer.dart';
import 'package:scoreboard/widgets/bar.dart';
import 'package:scoreboard/widgets/button_reset.dart';
import 'package:scoreboard/widgets/button_status.dart';
import 'package:scoreboard/widgets/menu.dart';
import 'package:scoreboard/models/basketball/score.dart';
import 'package:scoreboard/widgets/button_score.dart';
import 'package:scoreboard/widgets/button_foul.dart';
import 'package:scoreboard/widgets/button_quarter.dart';
import 'package:scoreboard/widgets/teamname.dart';
import 'package:scoreboard/widgets/image_foul.dart';
import 'package:scoreboard/widgets/button_line.dart';

class BasketballPage extends StatefulWidget {
  const BasketballPage({super.key});

  @override
  State<BasketballPage> createState() => _BasketballPageState();
}

class _BasketballPageState extends State<BasketballPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Titlebar().appBar("Basketball"),
        drawer: const MenuDrawer(index: 1),
        body: MediaQuery.removePadding(
          context: context,
          removeBottom: true,
          child: Container(
            color: const Color.fromARGB(255, 255, 242, 218),
            child: Center(
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 23,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(40),
                            bottomLeft: Radius.circular(40)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 5,
                              offset: Offset(2, 10))
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: <Widget>[
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const TeamName(team: 1),
                                  Text(
                                    '${context.watch<ScoreBasketball>().getScoreTeam1}',
                                    style: const TextStyle(
                                        fontSize: 60,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const ImageFoul(imagesport: 1, team: 1),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text("Quarter",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      '${context.watch<QuarterBasketball>().getQuarter}',
                                      style: const TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold)),
                                  const Text('Time',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                  const TextTime(
                                    sport: 1,
                                  ),
                                  const WidgetTimer(sport: 1),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const TeamName(team: 2),
                                  Text(
                                    '${context.watch<ScoreBasketball>().getScoreTeam2}',
                                    style: const TextStyle(
                                        fontSize: 60,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const ImageFoul(imagesport: 1, team: 2),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 45,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "image/basketball/basketballplay.png",
                            ),
                            opacity: 0.15),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 5,
                              offset: Offset(-2, -10))
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: const <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "A",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  ButtonScore(
                                      sport: 1,
                                      team: 1,
                                      increment: 1,
                                      decrement: 1),
                                  ButtonScore(
                                      sport: 1,
                                      team: 1,
                                      increment: 2,
                                      decrement: 2),
                                  ButtonScore(
                                      sport: 1,
                                      team: 1,
                                      increment: 3,
                                      decrement: 3),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  ButtonFoul(sport: 1, team: 1),
                                ],
                              ),
                              Column(
                                children: const <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "B",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  ButtonScore(
                                      sport: 1,
                                      team: 2,
                                      increment: 1,
                                      decrement: 1),
                                  ButtonScore(
                                      sport: 1,
                                      team: 2,
                                      increment: 2,
                                      decrement: 2),
                                  ButtonScore(
                                      sport: 1,
                                      team: 2,
                                      increment: 3,
                                      decrement: 3),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  ButtonFoul(sport: 1, team: 2),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              ButtonQuarter(sport: 1),
                              SizedBox(
                                width: 10,
                              ),
                              ButtonSetTime(
                                sport: 1,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              ButtonStatus(),
                              SizedBox(
                                width: 10,
                              ),
                              ButtonReset(sport: 1),
                              SizedBox(
                                width: 10,
                              ),
                              ButtonLine(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
