import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.9.h,
      ),
      child: CircleAvatar(
        radius: 3.h,
        backgroundColor: const Color.fromARGB(255, 23, 36, 113),
        child: Icon(
          icon,
          size: 4.h,
          color: Colors.white,
        ),
      ),
    );
  }
}
