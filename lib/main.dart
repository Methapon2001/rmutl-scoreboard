import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/name.dart';
import 'package:scoreboard/appintro/intro.dart';
import 'package:scoreboard/models/basketball/foul.dart';
import 'package:scoreboard/models/basketball/quarter.dart';
import 'package:scoreboard/models/basketball/score.dart';
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
        ListenableProvider(create: (_) => FoulFutsal()),
        ListenableProvider(create: (_) => ScoreFutsal()),
        ListenableProvider(create: (_) => QuarterFutsal()),
        ListenableProvider(create: (_) => ScoreBadminton()),
        ListenableProvider(create: (_) => SetBadminton()),
        ListenableProvider(create: (_) => QuarterBadminton()),
        ListenableProvider(create: (_) => ScoreTabletennis()),
        ListenableProvider(create: (_) => SetTabletennis()),
        ListenableProvider(create: (_) => QuarterTabletennis()),
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
