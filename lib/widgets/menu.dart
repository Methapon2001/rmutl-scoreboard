import 'package:flutter/material.dart';
import 'package:scoreboard/views/home.dart';
import 'package:scoreboard/views/volleyball.dart';
import 'package:scoreboard/views/basketball.dart';
import 'package:scoreboard/views/soccer.dart';
import 'package:scoreboard/views/futsal.dart';
import 'package:scoreboard/views/badminton.dart';
import 'package:scoreboard/views/tabletennis.dart';

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
          ListTile(
            leading: const Icon(Icons.home),
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
            leading: const Icon(Icons.sports_basketball),
            title: const Text('Basketball'),
            selected: widget.index == 1,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const BasketballPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.sports_volleyball),
            title: const Text('Volleyball'),
            selected: widget.index == 2,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const VolleyballPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.sports_soccer),
            title: const Text('Soccer'),
            selected: widget.index == 3,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SoccerPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.sports_soccer_rounded),
            title: const Text('Futsal'),
            selected: widget.index == 4,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const FutsalPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.sports_tennis),
            title: const Text('Badminton'),
            selected: widget.index == 5,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const BadmintonPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.sports_golf),
            title: const Text('Tabletennis'),
            selected: widget.index == 6,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Tabletennis(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
