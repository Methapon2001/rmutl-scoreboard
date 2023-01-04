import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoreboard/views/home.dart';
import 'package:scoreboard/views/volleyball.dart';
import 'package:scoreboard/views/basketball.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            selected: _selectedIndex == 0,
            onTap: () {
              _onItemTapped(0);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.sports_basketball),
            title: const Text('Basketball'),
            selected: _selectedIndex == 1,
            onTap: () {
              _onItemTapped(1);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BasketballPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.sports_volleyball),
            title: const Text('Volleyball'),
            selected: _selectedIndex == 2,
            onTap: () {
              _onItemTapped(2);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VolleyballPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
