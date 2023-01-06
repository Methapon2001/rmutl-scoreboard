import 'package:flutter/material.dart';

class Name with ChangeNotifier{
  final List<String> _team = ["Team A","Team B"];

  String get getTeamName1 => _team[0];
  String get getTeamName2 => _team[1];
}