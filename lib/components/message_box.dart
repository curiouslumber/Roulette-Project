import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MessageBox extends StatelessWidget {
  String message = "";
  Color color;
  Function() onOk;

  MessageBox(
      {super.key,
      required this.message,
      required this.onOk,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: Color.fromARGB(50, 255, 255, 255)),
      child: Container(
          width: 500,
          height: 200,
          padding: const EdgeInsets.all(15),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(13))),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  message,
                  style: TextStyle(color: color, fontSize: 35),
                ),
              ),
              TextButton(onPressed: onOk, child: const Text("Continue"))
            ],
          )),
    );
  }
}
