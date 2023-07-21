import 'package:flutter/material.dart';

class MyIcons extends StatelessWidget {
  const MyIcons({Key? key, required this.sport}) : super(key: key);

  final int sport;

  @override
  Widget build(BuildContext context) {
    late Image image1;
    late Image image2;
    late Image image3;
    late Image image4;
    late Image image5;
    late Image image6;
    late Image image7;
    late Image image8;

    List image = [];
    image1 = Image.asset(
      "image/home.png",
      scale: 11,
    );
    image2 = Image.asset(
      "image/basketball/basketball.png",
      scale: 11,
    );
    image3 = Image.asset(
      "image/volleyball/volleyball.png",
      scale: 11,
    );
    image4 = Image.asset(
      "image/soccer/soccer.png",
      scale: 11,
    );
    image5 = Image.asset(
      "image/futsal/futsal.png",
      scale: 11,
    );
    image6 = Image.asset(
      "image/badminton/badminton.png",
      scale: 11,
    );
    image7 = Image.asset(
      "image/pingpong/pingpong.png",
      scale: 11,
    );
    image8 = Image.asset(
      "image/iconsetting.png",
      scale: 11,
    );
    image = [image1, image2, image3, image4, image5, image6, image7, image8];
    return image[sport-1];
  }
}
