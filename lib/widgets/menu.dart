import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/icon/icon.dart';
import 'package:scoreboard/models/basketball/timer.dart';
import 'package:scoreboard/models/futsal/timer.dart';
import 'package:scoreboard/models/soccer/timer.dart';
import 'package:scoreboard/views/home.dart';
import 'package:scoreboard/views/soccer.dart';
import 'package:scoreboard/views/test.dart';
import 'package:scoreboard/views/volleyball.dart';
import 'package:scoreboard/views/basketball.dart';
import 'package:scoreboard/views/futsal.dart';
import 'package:scoreboard/views/badminton.dart';
import 'package:scoreboard/views/tabletennis.dart';
import 'package:scoreboard/models/basketball/score.dart';
import 'package:scoreboard/models/basketball/foul.dart';
import 'package:scoreboard/models/basketball/quarter.dart';
import 'package:scoreboard/models/volleyball/score.dart';
import 'package:scoreboard/models/volleyball/set.dart';
import 'package:scoreboard/models/volleyball/quarter.dart';
import 'package:scoreboard/models/soccer/score.dart';
import 'package:scoreboard/models/soccer/quarter.dart';
import 'package:scoreboard/models/futsal/score.dart';
import 'package:scoreboard/models/futsal/foul.dart';
import 'package:scoreboard/models/futsal/quarter.dart';
import 'package:scoreboard/models/badminton/score.dart';
import 'package:scoreboard/models/badminton/set.dart';
import 'package:scoreboard/models/badminton/quarter.dart';
import 'package:scoreboard/models/tabletennis/score.dart';
import 'package:scoreboard/models/tabletennis/set.dart';
import 'package:scoreboard/models/tabletennis/quarter.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            color: const Color.fromARGB(255, 23, 36, 113),
            width: double.infinity,
            height: 138,
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage(
                        'image/scoreboard.png',
                      ),
                    ),
                  ),
                ),
                const Text(
                  "List Sports",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const MyIcons(sport: 1),
            title: const Text('Home'),
            selected: widget.index == 0,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyHomePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const MyIcons(sport: 2),
            title: const Text('Basketball'),
            selected: widget.index == 1,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const BasketballPage(),
                ),
              );
              context.read<ScoreBasketball>().syncBoard();
              context.read<FoulBasketball>().syncBoard();
              context.read<QuarterBasketball>().syncBoard();
              context.read<TimerBasketball>().syncBoard();
            },
          ),
          ListTile(
            leading: const MyIcons(sport: 3),
            title: const Text('Volleyball'),
            selected: widget.index == 2,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const VolleyballPage(),
                ),
              );
              context.read<ScoreVolleyball>().syncBoard();
              context.read<SetVolleyball>().syncBoard();
              context.read<QuarterVolleyball>().syncBoard();
            },
          ),
          ListTile(
            leading: const MyIcons(sport: 4),
            title: const Text('Soccer'),
            selected: widget.index == 3,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SoccerPage(),
                ),
              );
              context.read<ScoreSoccer>().syncBoard();
              context.read<QuarterSoccer>().syncBoard();
              context.read<TimerSoccer>().syncBoard();
            },
          ),
          ListTile(
            leading: const MyIcons(sport: 5),
            title: const Text('Futsal'),
            selected: widget.index == 4,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const FutsalPage(),
                ),
              );
              context.read<ScoreFutsal>().syncBoard();
              context.read<FoulFutsal>().syncBoard();
              context.read<QuarterFutsal>().syncBoard();
              context.read<TimerFutsal>().syncBoard();
            },
          ),
          ListTile(
            leading: const MyIcons(sport: 6),
            title: const Text('Badminton'),
            selected: widget.index == 5,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const BadmintonPage(),
                ),
              );
              context.read<ScoreBadminton>().syncBoard();
              context.read<SetBadminton>().syncBoard();
              context.read<QuarterBadminton>().syncBoard();
            },
          ),
          ListTile(
            leading: const MyIcons(sport: 7),
            title: const Text('Tabletennis'),
            selected: widget.index == 6,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Tabletennis(),
                ),
              );
              context.read<ScoreTabletennis>().syncBoard();
              context.read<SetTabletennis>().syncBoard();
              context.read<QuarterTabletennis>().syncBoard();
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: const Text('Test'),
            selected: widget.index == 7,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Tester(),
                ),
              );
           },
          ),
        ],
      ),
    );
  }
}
