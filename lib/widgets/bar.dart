import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

class Titlebar {
  AppBar appBar(String title) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 23, 36, 113),
    );
  }
}

var MyBackgroundColor = const Color.fromARGB(255, 255, 242, 218);

void showToastExit(BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.grey),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Icon(
            Icons.exit_to_app,
            color: Colors.white,
          ),
          SizedBox(
            width: 1.w,
          ),
          Expanded(
              child: Text(
            "Please doubletap to exit.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15.sp, color: Colors.white),
          ))
        ],
      ),
    );
    fToast.showToast(
        child: toast,
        toastDuration: const Duration(seconds: 3),
        gravity: ToastGravity.BOTTOM);
  }