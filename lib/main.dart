import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/basketball/foul.dart';
import 'package:scoreboard/appintro/intro.dart';
import 'package:scoreboard/models/basketball/quarter.dart';
import 'package:scoreboard/models/basketball/score.dart';
import 'package:scoreboard/models/volleyball/score.dart';
import 'package:scoreboard/models/volleyball/set.dart';
import 'package:scoreboard/models/volleyball/quarter.dart';
import 'package:scoreboard/models/soccer/score.dart';
import 'package:scoreboard/models/soccer/quarter.dart';
import 'package:scoreboard/models/name.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(create: (_) => Name()),
        ListenableProvider(create: (_) => FoulBasketball()),
        ListenableProvider(create: (_) => ScoreBasketball()),
        ListenableProvider(create: (_) => QuarterBasketball()),
        ListenableProvider(create: (_) => ScoreVolleyball()),
        ListenableProvider(create: (_) => SetVolleyball()),
        ListenableProvider(create: (_) => QuarterVolleyball()),
        ListenableProvider(create: (_) => ScoreSoccer()),
        ListenableProvider(create: (_) => QuarterSoccer()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RMUTL Scoreboard',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: const Splash(),
      ),
    );
  }
}
