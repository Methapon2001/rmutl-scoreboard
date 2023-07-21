import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

import 'bar.dart';

class ButtonStatus extends StatefulWidget {
  const ButtonStatus({super.key});

  @override
  State<ButtonStatus> createState() => _ButtonStatusState();
}

class _ButtonStatusState extends State<ButtonStatus> {
  @override
  Widget build(BuildContext context) {
    const int a = 0;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          minimumSize: Size(25.w, 5.h),
          backgroundColor: const Color.fromARGB(255, 23, 36, 113)),
      onPressed: () {
        if (a == 1) {
          showToastSucces(context);
        } else {
          showToastError(context);
        }
      },
      child: Text(
        'Status',
        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}
