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

    List image = [];
    image1 = Image.asset(
      "image/home.png",
      scale: 9.5,
    );
    image2 = Image.asset(
      "image/basketball.png",
      scale: 9.7,
    );
    image3 = Image.asset(
      "image/volleyball.png",
      scale: 10,
    );
    image4 = Image.asset(
      "image/soccer.png",
      scale: 10,
    );
    image5 = Image.asset(
      "image/futsal.png",
      scale: 10,
    );
    image6 = Image.asset(
      "image/badminton.png",
      scale: 10.5,
    );
    image7 = Image.asset(
      "image/pingpong.png",
      scale: 10,
    );
    image = [image1, image2, image3, image4, image5, image6, image7];
    return image[
      sport == 1  ? 0
        : sport == 2 ? 1
            : sport == 3 ? 2
                : sport == 4 ? 3
                    : sport == 5 ? 4
                        : sport == 6 ? 5
                            : sport == 7 ? 6
                            : 0];
  }
}
