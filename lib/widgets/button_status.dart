import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonStatus extends StatefulWidget {
  const ButtonStatus({super.key});

  @override
  State<ButtonStatus> createState() => _ButtonStatusState();
}

class _ButtonStatusState extends State<ButtonStatus> {
  void showToastSucces(BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.green),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: const [
          Icon(
            Icons.check,
            color: Colors.white,
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
              child: Text(
            "Connecting to Scoreboard.",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ))
        ],
      ),
    );
    fToast.showToast(
        child: toast,
        toastDuration: const Duration(seconds: 3),
        gravity: ToastGravity.BOTTOM);
  }

  void showToastError(BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.red),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: const [
          Icon(
            Icons.cancel,
            color: Colors.white,
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
              child: Text(
            "Disconnected to Scoreboard.",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ))
        ],
      ),
    );
    fToast.showToast(
        child: toast,
        toastDuration: const Duration(seconds: 3),
        gravity: ToastGravity.BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    final int a = 0;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          minimumSize: const Size(110, 40),
          backgroundColor: const Color.fromARGB(255, 23, 36, 113)),
      onPressed: () {
        if (a == 1) {
          showToastSucces(context);
        }else{
          showToastError(context);
        }
      },
      child: const Text(
        'Check Status',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
