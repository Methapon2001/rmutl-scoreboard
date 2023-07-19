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

void showToastSucces(BuildContext context) {
  FToast fToast = FToast();
  fToast.init(context);
  Widget toast = Container(
    width: 50.w,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), color: Colors.green),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Icon(
          Icons.sync,
          color: Colors.white,
        ),
        SizedBox(
          width: 3.w,
        ),
        Expanded(
            child: Text(
          "Connecting.",
          style: TextStyle(fontSize: 15.sp, color: Colors.white),
          textAlign: TextAlign.center,
        ))
      ],
    ),
  );
  fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 1),
      gravity: ToastGravity.BOTTOM);
}

void showToastError(BuildContext context) {
  FToast fToast = FToast();
  fToast.init(context);
  Widget toast = Container(
    width: 56.w,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), color: Colors.red),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Icon(
          Icons.sync_disabled,
          color: Colors.white,
        ),
        SizedBox(
          width: 3.w,
        ),
        Expanded(
            child: Text(
          "Disconnected.",
          style: TextStyle(fontSize: 15.sp, color: Colors.white),
          textAlign: TextAlign.center,
        ))
      ],
    ),
  );
  fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 1),
      gravity: ToastGravity.BOTTOM);
}

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
      toastDuration: const Duration(seconds: 1),
      gravity: ToastGravity.BOTTOM);
}

void showToastMessage(BuildContext context) {
  FToast fToast = FToast();
  fToast.init(context);
  Widget toast = Container(
    width: 70.w,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), color: Colors.green),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Icon(
          Icons.send,
          color: Colors.white,
        ),
        SizedBox(
          width: 1.w,
        ),
        Expanded(
            child: Text(
          "Sent Message done.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15.sp, color: Colors.white),
        ))
      ],
    ),
  );
  fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 1),
      gravity: ToastGravity.BOTTOM);
}

void showToastSave(BuildContext context) {
  FToast fToast = FToast();
  fToast.init(context);
  Widget toast = Container(
    width: 50.w,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), color: Colors.green),
    child: Row(
      children: [
        const Icon(
          Icons.save,
          color: Colors.white,
        ),
        SizedBox(
          width: 3.w,
        ),
        Expanded(
            child: Text(
          "Save done.",
          style: TextStyle(fontSize: 15.sp, color: Colors.white),
        ))
      ],
    ),
  );
  fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 1),
      gravity: ToastGravity.BOTTOM);
}

void showToastReset(BuildContext context) {
  FToast fToast = FToast();
  fToast.init(context);
  Widget toast = Container(
    width: 67.w,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 42, 46, 59)),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Icon(
          Icons.restore,
          color: Colors.white,
        ),
        SizedBox(
          width: 3.w,
        ),
        Expanded(
            child: Text(
          "Reset Scoreboard.",
          style: TextStyle(fontSize: 15.sp, color: Colors.white),
          textAlign: TextAlign.center,
        ))
      ],
    ),
  );
  fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 1),
      gravity: ToastGravity.BOTTOM);
}
