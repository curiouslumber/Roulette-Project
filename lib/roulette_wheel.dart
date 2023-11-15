import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roulette_project/providers/table_select_provider.dart';
import 'package:roulette_project/components/common_button.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class RouletteWheel extends StatefulWidget {
  Function(int value) onWheelValue;
  RouletteWheel({super.key, required this.onWheelValue});

  @override
  State<RouletteWheel> createState() => RouletteWheelState();
}

class RouletteWheelState extends State<RouletteWheel> {
  late Timer timer;
  late Random random;
  late double degree;
  late int time;
  int value = 0;

  @override
  void initState() {
    super.initState();
    random = Random();
    resetWheel();
  }

  void resetWheel() {
    setState(() {
      degree = 0;
    });
  }

  List<int> wheelValues = [
    0,
    32,
    15,
    19,
    4,
    21,
    2,
    25,
    17,
    34,
    6,
    27,
    13,
    36,
    11,
    30,
    8,
    23,
    10,
    5,
    24,
    16,
    33,
    1,
    20,
    14,
    31,
    9,
    22,
    18,
    29,
    7,
    28,
    12,
    35,
    3,
    26
  ];
  void rotateWheel() {
    time = 3000;
    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (time > 0) {
        setState(() {
          degree = random.nextInt(360).toDouble();
          value = calculateValueBeta(degree);
        });
        time = time - 100;
      } else {
        widget.onWheelValue(value);
        timer.cancel();
      }
    });
  }

  int calculateValueBeta(double realDegree) {
    int? wheelValue;
    double divs = 360 / 37;
    double subdivs = divs / 2;
    double degree = realDegree + subdivs;
    if (degree > 0 && degree < divs) {
      wheelValue = 0;
    }
    if (degree >= divs && degree < (2 * divs)) {
      wheelValue = 26;
    }
    if (degree >= (2 * divs) && degree < (3 * divs)) {
      wheelValue = 3;
    }
    if (degree >= (3 * divs) && degree < (4 * divs)) {
      wheelValue = 35;
    }
    if (degree >= (4 * divs) && degree < (5 * divs)) {
      wheelValue = 12;
    }
    if (degree >= (5 * divs) && degree < (6 * divs)) {
      wheelValue = 28;
    }
    if (degree >= (6 * divs) && degree < (7 * divs)) {
      wheelValue = 7;
    }
    if (degree >= (7 * divs) && degree < (8 * divs)) {
      wheelValue = 29;
    }
    if (degree >= (8 * divs) && degree < (9 * divs)) {
      wheelValue = 18;
    }
    if (degree >= (9 * divs) && degree < (10 * divs)) {
      wheelValue = 22;
    }
    if (degree >= (10 * divs) && degree < (11 * divs)) {
      wheelValue = 9;
    }
    if (degree >= (11 * divs) && degree < (12 * divs)) {
      wheelValue = 31;
    }
    if (degree >= (12 * divs) && degree < (13 * divs)) {
      wheelValue = 14;
    }
    if (degree >= (13 * divs) && degree < (14 * divs)) {
      wheelValue = 20;
    }
    if (degree >= (14 * divs) && degree < (15 * divs)) {
      wheelValue = 1;
    }

    if (degree >= (15 * divs) && degree < (16 * divs)) {
      wheelValue = 33;
    }

    if (degree >= (16 * divs) && degree < (17 * divs)) {
      wheelValue = 16;
    }

    if (degree >= (17 * divs) && degree < (18 * divs)) {
      wheelValue = 24;
    }

    if (degree >= (18 * divs) && degree < (19 * divs)) {
      wheelValue = 5;
    }
    if (degree >= (19 * divs) && degree < (20 * divs)) {
      wheelValue = 10;
    }
    if (degree >= (20 * divs) && degree < (21 * divs)) {
      wheelValue = 23;
    }
    if (degree >= (21 * divs) && degree < (22 * divs)) {
      wheelValue = 8;
    }
    if (degree >= (22 * divs) && degree < (23 * divs)) {
      wheelValue = 30;
    }
    if (degree >= (23 * divs) && degree < (24 * divs)) {
      wheelValue = 11;
    }
    if (degree >= (24 * divs) && degree < (25 * divs)) {
      wheelValue = 36;
    }
    if (degree >= (25 * divs) && degree < (26 * divs)) {
      wheelValue = 13;
    }
    if (degree >= (26 * divs) && degree < (27 * divs)) {
      wheelValue = 27;
    }
    if (degree >= (27 * divs) && degree < (28 * divs)) {
      wheelValue = 6;
    }
    if (degree >= (28 * divs) && degree < (29 * divs)) {
      wheelValue = 34;
    }
    if (degree >= (29 * divs) && degree < (30 * divs)) {
      wheelValue = 17;
    }
    if (degree >= (30 * divs) && degree < (31 * divs)) {
      wheelValue = 25;
    }
    if (degree >= (31 * divs) && degree < (32 * divs)) {
      wheelValue = 2;
    }
    if (degree >= (32 * divs) && degree < (33 * divs)) {
      wheelValue = 21;
    }
    if (degree >= (33 * divs) && degree < (34 * divs)) {
      wheelValue = 4;
    }
    if (degree >= (34 * divs) && degree < (35 * divs)) {
      wheelValue = 19;
    }
    if (degree >= (35 * divs) && degree < (36 * divs)) {
      wheelValue = 15;
    }
    if (degree >= (36 * divs) && degree < (37 * divs)) {
      wheelValue = 32;
    }
    if (degree >= (37 * divs)) {
      wheelValue = 0;
    }
    return wheelValue!;
  }

  Widget rotateButton(BuildContext context) {
    return Consumer<TableSelectProvider>(builder: (context, provider, child) {
      return provider.hasBet()
          ? (degree == 0
              ? CommonButton(
                  text: 'Start spin',
                  onClick: () {
                    rotateWheel();
                  })
              : CommonButton(
                  text: 'Reset the Wheel',
                  onClick: () {
                    resetWheel();
                  }))
          : const Spacer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Spacer(),
      Stack(children: [
        Positioned(
            child: Align(
                alignment: Alignment.center,
                child: Transform.rotate(
                    angle: 3.14 / 180 * degree,
                    child: Image.asset('assets/images/wheel.png')))),
        const Positioned(
            child: Align(
                alignment: Alignment.topCenter,
                child: Icon(Icons.place,
                    size: 40, color: Color.fromRGBO(241, 154, 100, 1))))
      ]),
      SizedBox(height: 4.h),
      rotateButton(context),
      const Spacer()
    ]);
  }
}
