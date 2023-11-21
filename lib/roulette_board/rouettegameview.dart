import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:roulette_project/roulette_board/rouletteboard.dart';
import 'package:roulette_project/roulette_board/rouletteboardcontroller.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class RoulettePage extends StatelessWidget {
  RoulettePage({super.key});

  RouletteBoardController rouletteBoardController =
      Get.put(RouletteBoardController());

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight
        ]);
      }
      return Sizer(
        builder: (context, orientation, deviceType) => Scaffold(
          backgroundColor: Colors.green[900],
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RouletteBoard(),
                Container(
                  width: 200.w,
                  height: 17.h,
                  alignment: Alignment.centerLeft,
                  color: Colors.green[800],
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Text(
                          'Bets : ${rouletteBoardController.bets}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          print(rouletteBoardController.betsOnBoardCount
                              .toString());
                          rouletteBoardController.cornerBets.fillRange(0,
                              rouletteBoardController.cornerBets.length, false);
                          rouletteBoardController.betsOnBoardCount.fillRange(
                              0,
                              rouletteBoardController.betsOnBoardCount.length,
                              0);
                          rouletteBoardController.bets.clear();
                          rouletteBoardController.betsOnBoard.fillRange(
                              0,
                              rouletteBoardController.betsOnBoard.length,
                              false);
                        },
                        color: Colors.white,
                        textColor: Colors.green[900],
                        child: const Text('Clear'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
