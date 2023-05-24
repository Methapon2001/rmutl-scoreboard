import 'package:flutter/material.dart';

class ButtonLine extends StatefulWidget {
  const ButtonLine({super.key});

  @override
  State<ButtonLine> createState() => _ButtonLineState();
}

class _ButtonLineState extends State<ButtonLine> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          minimumSize: const Size(110, 40),
          backgroundColor: const Color.fromARGB(255, 23, 36, 113)),
      onPressed: () {},
      child: const Text(
        'Line',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
