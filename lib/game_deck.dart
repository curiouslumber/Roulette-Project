import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roulette_project/components/roulette_table.dart';
import 'package:roulette_project/components/table_touch_overlay.dart';
import 'package:roulette_project/components/message_box.dart';
import 'package:roulette_project/enums/game_status.dart';
import 'package:roulette_project/providers/game_provider.dart';
import 'package:roulette_project/providers/table_select_provider.dart';
import 'package:roulette_project/roulette_wheel.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class GameDeck extends StatelessWidget {
  const GameDeck({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight
          ]);
        }

        return Sizer(
          builder: (context, orientation, deviceType) => Scaffold(
              body: Stack(children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.green[900]),
              child: Container(
                padding:
                    EdgeInsets.only(left: 2.w, right: 2.w, bottom: 10, top: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1)),
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: RouletteWheel(
                          onWheelValue: (value) {
                            Provider.of<GameProvider>(context, listen: false)
                                .onWheelSet(value);
                          },
                        )),
                    Expanded(
                      flex: 11,
                      child: Padding(
                        padding: EdgeInsets.only(left: 1.w),
                        child: Stack(
                          children: [
                            RouletteTable(context),
                            TableTouchOverlay(context)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Consumer<GameProvider>(
              builder: (ccontext, gameProvider, child) {
                bool betWon =
                    Provider.of<TableSelectProvider>(context, listen: false)
                        .getBetByValue("${gameProvider.wheelValue}");
                if (betWon) {
                  //Provider.of<GameScoreProvider>(context, listen: false).setScore(1);
                }
                return gameProvider.gameStatus == GameStatus.wheelSet
                    ? MessageBox(
                        message:
                            "Bet ${betWon ? "won" : "failed"} on ${gameProvider.wheelValue}",
                        onOk: () {
                          Provider.of<TableSelectProvider>(context,
                                  listen: false)
                              .reset();
                          Provider.of<GameProvider>(context, listen: false)
                              .reset();
                        },
                        color: betWon ? Colors.green : Colors.red,
                      )
                    : const SizedBox(
                        width: 10,
                        height: 10,
                      );
              },
            )
          ])),
        );
      },
    );
  }
}
