import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget{
  final String text;
  final Function() onClick;

  const CommonButton({super.key, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: 200,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Text(text, style: TextStyle(color: Colors.green[900]),),
      ),
    );
  }

}