import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/name.dart';
import 'package:scoreboard/appintro/intro.dart';
import 'package:scoreboard/models/connect.dart';
import 'package:scoreboard/models/basketball/foul.dart';
import 'package:scoreboard/models/basketball/quarter.dart';
import 'package:scoreboard/models/basketball/score.dart';
import 'package:scoreboard/models/basketball/timer.dart';
import 'package:scoreboard/models/volleyball/score.dart';
import 'package:scoreboard/models/volleyball/set.dart';
import 'package:scoreboard/models/volleyball/quarter.dart';
import 'package:scoreboard/models/soccer/score.dart';
import 'package:scoreboard/models/soccer/quarter.dart';
import 'package:scoreboard/models/soccer/timer.dart';
import 'package:scoreboard/models/futsal/score.dart';
import 'package:scoreboard/models/futsal/foul.dart';
import 'package:scoreboard/models/futsal/quarter.dart';
import 'package:scoreboard/models/futsal/timer.dart';
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
        ListenableProxyProvider<ConnectBoard, ScoreBasketball>(
            update: (_, connectBoard, __) => ScoreBasketball(connectBoard)),
        ListenableProxyProvider<ConnectBoard, FoulBasketball>(
            update: (_, connectBoard, __) => FoulBasketball(connectBoard)),
        ListenableProxyProvider<ConnectBoard, QuarterBasketball>(
            update: (_, connectBoard, __) => QuarterBasketball(connectBoard)),
        ListenableProxyProvider<ConnectBoard, TimerBasketball>(
            update: (_, connectBoard, __) => TimerBasketball(connectBoard, 1200)),
        ListenableProxyProvider<ConnectBoard, ScoreVolleyball>(
            update: (_, connectBoard, __) => ScoreVolleyball(connectBoard)),
        ListenableProxyProvider<ConnectBoard, SetVolleyball>(
            update: (_, connectBoard, __) => SetVolleyball(connectBoard)),
        ListenableProxyProvider<ConnectBoard, QuarterVolleyball>(
            update: (_, connectBoard, __) => QuarterVolleyball(connectBoard)),
        ListenableProxyProvider<ConnectBoard, ScoreSoccer>(
            update: (_, connectBoard, __) => ScoreSoccer(connectBoard)),
        ListenableProxyProvider<ConnectBoard, QuarterSoccer>(
            update: (_, connectBoard, __) => QuarterSoccer(connectBoard)),
        ListenableProxyProvider<ConnectBoard, TimerSoccer>(
            update: (_, connectBoard, __) => TimerSoccer(connectBoard, 9000)),
        ListenableProxyProvider<ConnectBoard, FoulFutsal>(
            update: (_, connectBoard, __) => FoulFutsal(connectBoard)),
        ListenableProxyProvider<ConnectBoard, ScoreFutsal>(
            update: (_, connectBoard, __) => ScoreFutsal(connectBoard)),
        ListenableProxyProvider<ConnectBoard, QuarterFutsal>(
            update: (_, connectBoard, __) => QuarterFutsal(connectBoard)),
        ListenableProxyProvider<ConnectBoard, TimerFutsal>(
            update: (_, connectBoard, __) => TimerFutsal(connectBoard, 1200)),
        ListenableProxyProvider<ConnectBoard, ScoreBadminton>(
            update: (_, connectBoard, __) => ScoreBadminton(connectBoard)),
        ListenableProxyProvider<ConnectBoard, SetBadminton>(
            update: (_, connectBoard, __) => SetBadminton(connectBoard)),
        ListenableProxyProvider<ConnectBoard, QuarterBadminton>(
            update: (_, connectBoard, __) => QuarterBadminton(connectBoard)),
        ListenableProxyProvider<ConnectBoard, ScoreTabletennis>(
            update: (_, connectBoard, __) => ScoreTabletennis(connectBoard)),
        ListenableProxyProvider<ConnectBoard, SetTabletennis>(
            update: (_, connectBoard, __) => SetTabletennis(connectBoard)),
        ListenableProxyProvider<ConnectBoard, QuarterTabletennis>(
            update: (_, connectBoard, __) => QuarterTabletennis(connectBoard)),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RMUTL Scoreboard',
        home: Splash(),
      ),
    );
  }
}
