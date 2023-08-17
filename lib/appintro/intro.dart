import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoreboard/views/home.dart';
import 'dart:io' show Platform;

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

//Intro
class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'image/scoreboard.png',
                height: 130,
              ),
              const SizedBox(
                height: 30,
              ),
              if (Platform.isAndroid)
                const CircularProgressIndicator(
                  color: Colors.white,
                )
              else
                const CupertinoActivityIndicator(
                  radius: 20,
                ),
              const Text(
                '\nDIGITAL SCOREBORAD',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
} //Intro