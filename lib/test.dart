import 'package:flutter/material.dart';
import 'package:scoreboard/views/basketball.dart';
import 'package:scoreboard/views/volleyball.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected ListTile Example'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Item 1'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BasketballPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Item 2'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VolleyballPage(),
                  ),
                );
              },
            ),
            // ListTile(
            //   title: Text('Item 3'),
            //   selected: _selectedIndex == 2,
            //   onTap: () {
            //     _onItemTapped(2);
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => Item3Page(),
            //       ),
            //     );
            //   },
            // ),
            // ListTile(
            //   title: Text('Item 4'),
            //   selected: _selectedIndex == 3,
            //   onTap: () {
            //     _onItemTapped(3);
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => Item4Page(),
            //       ),
            //     );
            //   },
            // ),
            // ListTile(
            //   title: Text('Item 5'),
            //   selected: _selectedIndex == 4,
            //   onTap: () {
            //     _onItemTapped(4);
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => Item5Page(),
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
