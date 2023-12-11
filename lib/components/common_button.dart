import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final Function() onClick;

  const CommonButton({super.key, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: 25.w,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(12.0),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Text(
          text,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green[900], fontSize: 12.sp),
        ),
      ),
    );
  }
}
