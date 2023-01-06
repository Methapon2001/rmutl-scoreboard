import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/name.dart';

class TeamName extends StatefulWidget {
  const TeamName({Key? key, required this.team}) : super(key: key);

  final int team;

  @override
  State<TeamName> createState() => _TeamNameState();
}

class _TeamNameState extends State<TeamName> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.team == 1
          ? context.watch<Name>().getTeamName1
          : context.watch<Name>().getTeamName2,
      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}
