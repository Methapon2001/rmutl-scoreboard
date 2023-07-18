import 'package:flutter/material.dart';

class Titlebar {
  AppBar appBar(String title) {
    return AppBar(
      title: Text(title),
      backgroundColor: const Color.fromARGB(255, 23, 36, 113),
    );
  }
}

var MyBackgroundColor = const Color.fromARGB(255, 255, 242, 218);
