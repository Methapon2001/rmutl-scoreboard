import 'package:flutter/material.dart';

class ButtonStatus extends StatefulWidget {
  const ButtonStatus({super.key});

  @override
  State<ButtonStatus> createState() => _ButtonStatusState();
}

class _ButtonStatusState extends State<ButtonStatus> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          minimumSize: const Size(110, 40),
          backgroundColor: const Color.fromARGB(255, 23, 36, 113)),
      onPressed: () {},
      child: const Text(
        'Check Status',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
