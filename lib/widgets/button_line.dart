import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonLine extends StatefulWidget {
  const ButtonLine({super.key});

  @override
  State<ButtonLine> createState() => _ButtonLineState();
}

class _ButtonLineState extends State<ButtonLine> {
  void showToastSucces(BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.lightGreen),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: const [
          Icon(
            Icons.cloud_upload,
            color: Colors.white,
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
              child: Text(
            "Upload Score to Line.",
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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          minimumSize: const Size(110, 40),
          backgroundColor: const Color.fromARGB(255, 23, 36, 113)),
      onPressed: () {
        showToastSucces(context);
      },
      child: const Text(
        'Line',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
