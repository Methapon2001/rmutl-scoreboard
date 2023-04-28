import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/name.dart';
import 'package:scoreboard/appintro/intro.dart';
import 'package:scoreboard/models/connect.dart';
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
        ListenableProvider(create: (_) => ConnectBoard()),
        ListenableProvider(create: (_) => FoulBasketball(ConnectBoard())),
        ListenableProvider(create: (_) => ScoreBasketball(ConnectBoard())),
        ListenableProvider(create: (_) => QuarterBasketball(ConnectBoard())),
        ListenableProvider(create: (_) => ScoreVolleyball(ConnectBoard())),
        ListenableProvider(create: (_) => SetVolleyball(ConnectBoard())),
        ListenableProvider(create: (_) => QuarterVolleyball(ConnectBoard())),
        ListenableProvider(create: (_) => ScoreSoccer(ConnectBoard())),
        ListenableProvider(create: (_) => QuarterSoccer(ConnectBoard())),
        ListenableProvider(create: (_) => FoulFutsal(ConnectBoard())),
        ListenableProvider(create: (_) => ScoreFutsal(ConnectBoard())),
        ListenableProvider(create: (_) => QuarterFutsal(ConnectBoard())),
        ListenableProvider(create: (_) => ScoreBadminton(ConnectBoard())),
        ListenableProvider(create: (_) => SetBadminton(ConnectBoard())),
        ListenableProvider(create: (_) => QuarterBadminton(ConnectBoard())),
        ListenableProvider(create: (_) => ScoreTabletennis(ConnectBoard())),
        ListenableProvider(create: (_) => SetTabletennis(ConnectBoard())),
        ListenableProvider(create: (_) => QuarterTabletennis(ConnectBoard())),
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
