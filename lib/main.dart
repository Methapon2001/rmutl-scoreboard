import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/score.dart';
import 'package:scoreboard/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(create: (_) => Score()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RMUTL Scoreboard',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: const MyHomePage(title: "Home"),
      ),
    );
  }
}