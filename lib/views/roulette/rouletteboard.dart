// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roulette_project/views/roulette/rouletteboardcontroller.dart';

// ignore: must_be_immutable
class RouletteBoard extends StatelessWidget {
  RouletteBoardController rbc = Get.find();

  RouletteBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final zero_height = 49.75.h;
    final bottom_row_width = 132.h;
    final box_size = 33.h;
    const betColor = Colors.orange;
    const betOffColor = Colors.transparent;
    const upperExtraAreaColor = Colors.transparent;
    final circularRadius = 12.h;
    final betRadius = 12.h;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Column(
              children: [
                Container(
                  width: box_size,
                  height: betRadius / 2,
                  alignment: Alignment.bottomRight,
                  child: Obx(
                    () => GestureDetector(
                      onTap: () {
                        rbc.bets.add("[00,0,3,2,1]");
                        rbc.cornerBets[0] = true;
                      },
                      child: Container(
                        width: betRadius / 2,
                        height: betRadius / 2,
                        decoration: BoxDecoration(
                            color: rbc.cornerBets[0] ? betColor : betOffColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(circularRadius),
                            )),
                      ),
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('00');
                            rbc.straightUpBetsCount.value += 1;
                            rbc.addZeroBet(2);
                          },
                          child: Container(
                            height: zero_height,
                            width: box_size,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                            ),
                            child: const RotatedBox(
                              quarterTurns: 1,
                              child: Text(
                                '00',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: betRadius / 2,
                              height: (zero_height - box_size / 2),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        rbc.bets.add("[00,0,3,2,1]");
                                        rbc.cornerBets[0] = true;
                                      },
                                      child: Container(
                                        width: betRadius / 2,
                                        height: betRadius / 2,
                                        decoration: BoxDecoration(
                                            color: rbc.cornerBets[0]
                                                ? betColor
                                                : betOffColor,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(
                                                  circularRadius),
                                            )),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      rbc.bets.add("[00,3]");
                                    },
                                    child: Container(
                                      width: betRadius / 2,
                                      height: betRadius,
                                      decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft:
                                                Radius.circular(circularRadius),
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                          )),
                                    ),
                                  ),
                                  Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        rbc.bets.add("[00,3,2]");
                                        rbc.cornerBets[1] = true;
                                      },
                                      child: Container(
                                        width: betRadius / 2,
                                        height: betRadius / 2,
                                        decoration: BoxDecoration(
                                          color: rbc.cornerBets[1]
                                              ? betColor
                                              : betOffColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: betRadius / 2,
                              height: (box_size / 2),
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Obx(
                                        () => GestureDetector(
                                          onTap: () {
                                            rbc.bets.add("[00,3,2]");
                                            rbc.cornerBets[1] = true;
                                          },
                                          child: Container(
                                            width: betRadius / 2,
                                            height: betRadius / 2,
                                            decoration: BoxDecoration(
                                                color: rbc.cornerBets[1]
                                                    ? betColor
                                                    : betOffColor,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(
                                                      circularRadius),
                                                )),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          rbc.bets.add("[00,0,2]");
                                        },
                                        child: Container(
                                          width: betRadius / 2,
                                          height: betRadius / 2,
                                          decoration: BoxDecoration(
                                            color: betOffColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                  circularRadius),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      rbc.bets.add("[00,2]");
                                    },
                                    child: Container(
                                        height: betRadius,
                                        width: betRadius / 2,
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft:
                                                Radius.circular(circularRadius),
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                          ),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Obx(
                      () => GestureDetector(
                        onTap: () {
                          rbc.bets.add('00');
                          rbc.straightUpBetsCount.value += 1;
                          rbc.addZeroBet(2);
                        },
                        child: Container(
                            height: betRadius,
                            width: betRadius,
                            decoration: BoxDecoration(
                              color: rbc.zeroBets[1] ? betColor : betOffColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(circularRadius),
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('0');
                        rbc.straightUpBetsCount.value += 1;
                        rbc.addZeroBet(1);
                      },
                      child: Container(
                        height: zero_height,
                        width: box_size,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white)),
                        child: const RotatedBox(
                          quarterTurns: 1,
                          child: Text(
                            '0',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: betRadius / 2,
                          height: (box_size / 2),
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      rbc.bets.add("[00,0,2]");
                                    },
                                    child: Container(
                                      width: betRadius / 2,
                                      height: betRadius / 2,
                                      decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                          )),
                                    ),
                                  ),
                                  Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        rbc.bets.add("[0,2,1]");
                                        rbc.cornerBets[2] = true;
                                      },
                                      child: Container(
                                        width: betRadius / 2,
                                        height: betRadius / 2,
                                        decoration: BoxDecoration(
                                          color: rbc.cornerBets[2]
                                              ? betColor
                                              : betOffColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  rbc.bets.add("[0,2]");
                                },
                                child: Container(
                                  height: betRadius,
                                  width: betRadius / 2,
                                  decoration: BoxDecoration(
                                    color: betOffColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(circularRadius),
                                      bottomLeft:
                                          Radius.circular(circularRadius),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: betRadius / 2,
                          height: (zero_height - box_size / 2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    rbc.bets.add("[0,2,1]");
                                    rbc.cornerBets[2] = true;
                                  },
                                  child: Container(
                                    width: betRadius / 2,
                                    height: betRadius / 2,
                                    decoration: BoxDecoration(
                                        color: rbc.cornerBets[2]
                                            ? betColor
                                            : betOffColor,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft:
                                              Radius.circular(circularRadius),
                                        )),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  rbc.bets.add("[0,1]");
                                },
                                child: Container(
                                  width: betRadius / 2,
                                  height: betRadius,
                                  decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(circularRadius),
                                        bottomLeft:
                                            Radius.circular(circularRadius),
                                      )),
                                ),
                              ),
                              Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    rbc.bets.add("[0,00,1,2,3]");
                                    rbc.cornerBets[3] = true;
                                  },
                                  child: Container(
                                    width: betRadius / 2,
                                    height: betRadius / 2,
                                    decoration: BoxDecoration(
                                      color: rbc.cornerBets[3]
                                          ? betColor
                                          : betOffColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(circularRadius),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      rbc.straightUpBetsCount.value++;
                      rbc.bets.add('0');
                      rbc.addZeroBet(1);
                    },
                    child: Container(
                      height: betRadius,
                      width: betRadius,
                      decoration: BoxDecoration(
                        color: rbc.zeroBets[0] ? betColor : betOffColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(circularRadius),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Obx(
              () => GestureDetector(
                onTap: () {
                  rbc.bets.add("[0,00,1,2,3]");
                  rbc.cornerBets[3] = true;
                },
                child: Container(
                  width: box_size,
                  height: betRadius / 2,
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: betRadius / 2,
                    height: betRadius / 2,
                    decoration: BoxDecoration(
                        color: rbc.cornerBets[3] ? betColor : betOffColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(circularRadius),
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: bottom_row_width * 3,
              height: betRadius / 1.9,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: box_size,
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => GestureDetector(
                              onTap: () {
                                rbc.bets.add("[00,0,3,2,1]");
                                rbc.cornerBets[0] = true;
                              },
                              child: Container(
                                width: betRadius / 2,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: rbc.cornerBets[0]
                                      ? betColor
                                      : betOffColor,
                                  borderRadius: BorderRadius.only(
                                      topRight:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[1,2,3]");
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: betRadius,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                    topLeft: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[1,2,3,4,5,6]");
                            },
                            child: Container(
                              width: betRadius / 2,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: box_size,
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[1,2,3,4,5,6]");
                            },
                            child: Container(
                              width: betRadius / 2,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[4,5,6]");
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: betRadius,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                    topLeft: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[4,5,6,7,8,9]");
                            },
                            child: Container(
                              width: betRadius / 2,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: box_size,
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[4,5,6,7,8,9]");
                            },
                            child: Container(
                              width: betRadius / 2,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[7,8,9]");
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: betRadius,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                    topLeft: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("7,8,9,10,11,12");
                            },
                            child: Container(
                              width: betRadius / 2,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: box_size,
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[7,8,9,10,11,12]");
                            },
                            child: Container(
                              width: betRadius / 2,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[10,11,12]");
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: betRadius,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                    topLeft: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[10,11,12,13,14,15]");
                            },
                            child: Container(
                              width: betRadius / 2,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: box_size,
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[10,11,12,13,14,15]");
                            },
                            child: Container(
                              width: betRadius / 2,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[13,14,15]");
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: betRadius,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                    topLeft: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[13,14,15,16,17,18]");
                            },
                            child: Container(
                              width: betRadius / 2,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: box_size,
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[13,14,15,16,17,18]");
                            },
                            child: Container(
                              width: betRadius / 2,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[16,17,18]");
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: betRadius,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                    topLeft: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[16,17,18,19,20,21]");
                            },
                            child: Container(
                              width: betRadius / 2,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: box_size,
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[16,17,18,19,20,21]");
                            },
                            child: Container(
                              width: betRadius / 2,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[19,20,21]");
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: betRadius,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                    topLeft: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[19,20,21,22,23,24]");
                            },
                            child: Container(
                              width: betRadius / 2,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: box_size,
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[19,20,21,22,23,24]");
                            },
                            child: Container(
                              width: betRadius / 2,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[22,23,24]");
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: betRadius,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                    topLeft: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[22,23,24,25,26,27]");
                            },
                            child: Container(
                              width: betRadius / 2,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: box_size,
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[22,23,24,25,26,27]");
                            },
                            child: Container(
                              width: betRadius / 2,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[25,26,27]");
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: betRadius,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                    topLeft: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[25,26,27,28,29,30]");
                            },
                            child: Container(
                              width: betRadius / 2,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: box_size,
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[25,26,27,28,29,30]");
                            },
                            child: Container(
                              width: betRadius / 2,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[28,29,30]");
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: betRadius,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                    topLeft: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[28,29,30,31,32,33]");
                            },
                            child: Container(
                              width: betRadius / 2,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: box_size,
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[28,29,30,31,32,33]");
                            },
                            child: Container(
                              width: betRadius / 2,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[31,32,33]");
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: betRadius,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                    topLeft: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[31,32,33,34,35,36]");
                            },
                            child: Container(
                              width: betRadius / 2,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: box_size,
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[31,32,33,34,35,36]");
                            },
                            child: Container(
                              width: betRadius / 2,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              rbc.bets.add("[34,35,36]");
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: betRadius,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                    topLeft: Radius.circular(circularRadius)),
                              ),
                            ),
                          ),
                          Container(
                            width: betRadius / 2,
                            height: betRadius / 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(circularRadius)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      ClipOval(
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(3);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('3');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.red,
                                                            child: const Text(
                                                              '3',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Obx(
                                                        () => GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(3);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('3');
                                                          },
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        2]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                shape: BoxShape
                                                                    .circle),
                                                            height: betRadius,
                                                            width: betRadius,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[3,6]');
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: betOffColor,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  circularRadius),
                                                          topLeft:
                                                              Radius.circular(
                                                                  circularRadius),
                                                        )),
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[00,3]');
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: betOffColor,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomRight:
                                                          Radius.circular(
                                                              circularRadius),
                                                      topRight: Radius.circular(
                                                          circularRadius),
                                                    )),
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[3,2]');
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: betOffColor,
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(
                                                      circularRadius),
                                                  topLeft: Radius.circular(
                                                      circularRadius),
                                                )),
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[3,2,1]');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: betOffColor,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(
                                                  circularRadius),
                                              bottomRight: Radius.circular(
                                                  circularRadius),
                                            )),
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[3,6,2,5]');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: betOffColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(circularRadius),
                                        )),
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                  ),
                                ),
                              ],
                            ),
                            Obx(
                              () => GestureDetector(
                                onTap: () {
                                  rbc.bets.add('[00,3,2]');
                                  rbc.cornerBets[1] = true;
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: rbc.cornerBets[1]
                                            ? betColor
                                            : betOffColor,
                                        borderRadius: BorderRadius.only(
                                          topRight:
                                              Radius.circular(circularRadius),
                                        )),
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[3,2,1,6,5,4]');
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(circularRadius),
                                  )),
                              alignment: Alignment.centerRight,
                              height: betRadius / 2,
                              width: betRadius / 2),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[0,00,3,2,1]');
                        rbc.cornerBets[0] = true;
                      },
                      child: Obx(
                        () => Container(
                          alignment: Alignment.centerRight,
                          height: betRadius / 2,
                          width: betRadius / 2,
                          decoration: BoxDecoration(
                              color: rbc.cornerBets[0] ? betColor : betOffColor,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(circularRadius),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(6);

                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('6');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.black,
                                                            child: const Text(
                                                              '6',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(6);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('6');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              height: betRadius,
                                                              width: betRadius,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: rbc.betsOnBoard[
                                                                              5]
                                                                          ? betColor
                                                                          : Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(circularRadius),
                                                                        topLeft:
                                                                            Radius.circular(circularRadius),
                                                                        topRight:
                                                                            Radius.circular(circularRadius),
                                                                        bottomRight:
                                                                            Radius.circular(circularRadius),
                                                                      )),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[6,9]');
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: betOffColor,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  circularRadius),
                                                          topLeft:
                                                              Radius.circular(
                                                                  circularRadius),
                                                        )),
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[3,6]');
                                              },
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(
                                                                circularRadius),
                                                        bottomRight:
                                                            Radius.circular(
                                                                circularRadius),
                                                      )),
                                                  alignment:
                                                      Alignment.centerRight,
                                                  height: betRadius,
                                                  width: betRadius / 2),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[6,5]');
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(
                                                        circularRadius),
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                  )),
                                              alignment: Alignment.centerRight,
                                              height: betRadius / 2,
                                              width: betRadius),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[6,5,4]');
                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                        decoration: BoxDecoration(
                                            color: betOffColor,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(
                                                  circularRadius),
                                              bottomRight: Radius.circular(
                                                  circularRadius),
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[6,9,5,8]');
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                    decoration: BoxDecoration(
                                        color: betOffColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(circularRadius),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[3,6,2,5]');
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                                decoration: BoxDecoration(
                                    color: betOffColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(circularRadius),
                                    )),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[6,5,4,9,8,7]');
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                            decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(circularRadius),
                                )),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[3,2,1,6,5,4]');
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                        decoration: BoxDecoration(
                            color: betOffColor,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(circularRadius),
                            )),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white),
                                                  ),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(9);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('9');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.red,
                                                            child: const Text(
                                                              '9',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(9);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('9');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: betRadius,
                                                              width: betRadius,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        8]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[9,12]');
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[6,9]');
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[9,8]');
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                                topRight: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[9,8,7]');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[9,12,8,11]');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(circularRadius),
                                      ),
                                    ),
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[6,9,5,8]');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[9,8,7,12,11,10]');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(circularRadius),
                              ),
                            ),
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[6,5,4,9,8,7]');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white),
                                                  ),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(12);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('12');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.red,
                                                            child: const Text(
                                                              '12',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(12);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('12');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                                height:
                                                                    betRadius,
                                                                width:
                                                                    betRadius,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                decoration:
                                                                    BoxDecoration(
                                                                        color: rbc.betsOnBoard[11]
                                                                            ? betColor
                                                                            : Colors
                                                                                .transparent,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(circularRadius),
                                                                          topLeft:
                                                                              Radius.circular(circularRadius),
                                                                          topRight:
                                                                              Radius.circular(circularRadius),
                                                                          bottomRight:
                                                                              Radius.circular(circularRadius),
                                                                        ))),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[12,15]');
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[9,12]');
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[12,11]');
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                                topRight: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[12,11,10]');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[12,15,11,14]');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(circularRadius),
                                      ),
                                    ),
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[9,12,8,11]');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[12,11,10,15,14,13]');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(circularRadius),
                              ),
                            ),
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[9,8,7,12,11,10]');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white),
                                                  ),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(15);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('15');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.black,
                                                            child: const Text(
                                                              '15',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(15);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('15');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              height: betRadius,
                                                              width: betRadius,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        14]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[15,18]');
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[12,15]');
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[15,14]');
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                                topRight: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[15,14,13]');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[15,18,14,17]');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(circularRadius),
                                      ),
                                    ),
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[12,15,11,14]');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[15,14,13,18,17,16]');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(circularRadius),
                              ),
                            ),
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[12,11,10,15,14,13]');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white),
                                                  ),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(18);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('18');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.red,
                                                            child: const Text(
                                                              '18',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(18);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('18');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              height: betRadius,
                                                              width: betRadius,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        17]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[18,21]');
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[15,18]');
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[18,17]');
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                                topRight: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[18,17,16]');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[18,21,17,20]');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(circularRadius),
                                      ),
                                    ),
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[15,18,14,17]');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[18,17,16,21,20,19]');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(circularRadius),
                              ),
                            ),
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[15,14,13,18,17,16]');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white),
                                                  ),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(21);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('21');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.red,
                                                            child: const Text(
                                                              '21',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(21);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('21');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              height: betRadius,
                                                              width: betRadius,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        20]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[21,24]');
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[18,21]');
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[21,20]');
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                                topRight: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[21,20,19]');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[21,24,20,23]');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(circularRadius),
                                      ),
                                    ),
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[18,21,17,20]');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[21,20,19,24,23,22]');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(circularRadius),
                              ),
                            ),
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[18,17,16,21,20,19]');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white),
                                                  ),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(24);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('24');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.black,
                                                            child: const Text(
                                                              '24',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(24);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('24');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              height: betRadius,
                                                              width: betRadius,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        23]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[24,27]');
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[21,24]');
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[24,23]');
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                                topRight: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[24,23,22]');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[24,27,23,26]');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(circularRadius),
                                      ),
                                    ),
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[21,24,20,23]');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[24,23,22,27,26,25]');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(circularRadius),
                              ),
                            ),
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[21,20,19,24,23,22]');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white),
                                                  ),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(27);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('27');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.red,
                                                            child: const Text(
                                                              '27',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(27);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('27');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              height: betRadius,
                                                              width: betRadius,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        26]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[27,30]');
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[24,27]');
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[27,26]');
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                                topRight: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[27,26,25]');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[27,30,26,29]');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(circularRadius),
                                      ),
                                    ),
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[24,27,23,26]');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[27,26,25,30,29,28]');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(circularRadius),
                              ),
                            ),
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[24,23,22,27,26,25]');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white),
                                                  ),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(30);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('30');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.red,
                                                            child: const Text(
                                                              '30',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(30);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('30');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              height: betRadius,
                                                              width: betRadius,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        29]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[30,33]');
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[27,30]');
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[30,29]');
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                                topRight: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[30,29,28]');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[30,33,29,32]');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(circularRadius),
                                      ),
                                    ),
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[27,30,26,29]');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[30,29,28,33,32,31]');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(circularRadius),
                              ),
                            ),
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[27,26,25,30,29,28]');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white),
                                                  ),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(33);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('33');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.black,
                                                            child: const Text(
                                                              '33',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(33);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('33');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              height: betRadius,
                                                              width: betRadius,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        32]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[33,36]');
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[30,33]');
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[33,32]');
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                                topRight: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[33,32,31]');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[33,36,32,35]');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(circularRadius),
                                      ),
                                    ),
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[30,33,29,32]');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[33,32,31,36,35,34]');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(circularRadius),
                              ),
                            ),
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[30,29,28,33,32,31]');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(36);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('36');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.red,
                                                            child: const Text(
                                                              '36',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(36);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('36');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              height: betRadius,
                                                              width: betRadius,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        35]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[33,36]');
                                              },
                                              child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[36,35]');
                                          },
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    circularRadius),
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[36,35,34]');
                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(circularRadius)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[33,36,32,35]');
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(circularRadius)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[33,32,31,36,35,34]');
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.bottomCenter,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerLeft,
                                              children: [
                                                Stack(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                      width: box_size,
                                                      height: box_size,
                                                      child: ClipOval(
                                                        child: Stack(
                                                          alignment:
                                                              Alignment.center,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                rbc.activeBet(
                                                                    2);
                                                                rbc.straightUpBetsCount
                                                                    .value++;
                                                                rbc.bets
                                                                    .add('2');
                                                              },
                                                              child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                width:
                                                                    box_size /
                                                                        1.7,
                                                                height:
                                                                    box_size /
                                                                        1.5,
                                                                color: Colors
                                                                    .black,
                                                                child:
                                                                    const Text(
                                                                  '2',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                rbc.activeBet(
                                                                    2);
                                                                rbc.straightUpBetsCount
                                                                    .value++;
                                                                rbc.bets
                                                                    .add('2');
                                                              },
                                                              child: Obx(
                                                                () => Container(
                                                                  height:
                                                                      betRadius,
                                                                  width:
                                                                      betRadius,
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: rbc.betsOnBoard[
                                                                            1]
                                                                        ? betColor
                                                                        : Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              circularRadius),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              circularRadius),
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              circularRadius),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              circularRadius),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        rbc.bets.add('[2,5]');
                                                      },
                                                      child: Container(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        height: betRadius,
                                                        width: betRadius / 2,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: betOffColor,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    circularRadius),
                                                            topLeft:
                                                                Radius.circular(
                                                                    circularRadius),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[00,0,2]');
                                                  },
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomRight:
                                                            Radius.circular(
                                                                circularRadius),
                                                        topRight:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[2,1]');
                                              },
                                              child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius / 2,
                                                width: betRadius,
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    topLeft: Radius.circular(
                                                        circularRadius),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[3,2]');
                                          },
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(
                                                    circularRadius),
                                                bottomRight: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: box_size,
                                      width: betRadius / 2,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              height: box_size / 2,
                                              width: betRadius / 2,
                                              alignment: Alignment.centerLeft,
                                              child: GestureDetector(
                                                onTap: () {
                                                  rbc.bets.add("[00,2]");
                                                },
                                                child: Container(
                                                    width: betRadius / 2,
                                                    height: betRadius,
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius: BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  circularRadius),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  circularRadius)),
                                                    )),
                                              ),
                                            ),
                                            Container(
                                              height: box_size / 2,
                                              width: betRadius / 2,
                                              alignment: Alignment.centerLeft,
                                              child: GestureDetector(
                                                onTap: () {
                                                  rbc.bets.add("[0,2]");
                                                },
                                                child: Container(
                                                  width: betRadius / 2,
                                                  height: betRadius,
                                                  decoration: BoxDecoration(
                                                    color: betOffColor,
                                                    borderRadius: BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(
                                                                circularRadius),
                                                        bottomRight:
                                                            Radius.circular(
                                                                circularRadius)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                    )
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[2,5,1,4]');
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(circularRadius),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Obx(
                              () => GestureDetector(
                                onTap: () {
                                  rbc.bets.add('[0,2,1]');
                                  rbc.cornerBets[2] = true;
                                },
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  height: betRadius / 2,
                                  width: betRadius / 2,
                                  decoration: BoxDecoration(
                                    color: rbc.cornerBets[2]
                                        ? betColor
                                        : betOffColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(circularRadius),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[3,6,2,5]');
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(circularRadius),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => GestureDetector(
                        onTap: () {
                          rbc.bets.add('[00,3,2]');
                          rbc.cornerBets[1] = true;
                        },
                        child: Container(
                          alignment: Alignment.centerRight,
                          height: betRadius / 2,
                          width: betRadius / 2,
                          decoration: BoxDecoration(
                            color: rbc.cornerBets[1] ? betColor : betOffColor,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(circularRadius),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(5);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('5');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.red,
                                                            child: const Text(
                                                              '5',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(5);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('5');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              height: betRadius,
                                                              width: betRadius,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: rbc.betsOnBoard[
                                                                              4]
                                                                          ? betColor
                                                                          : Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomRight:
                                                                            Radius.circular(circularRadius),
                                                                        topRight:
                                                                            Radius.circular(circularRadius),
                                                                        bottomLeft:
                                                                            Radius.circular(circularRadius),
                                                                        topLeft:
                                                                            Radius.circular(circularRadius),
                                                                      )),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[5,8]');
                                                  },
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                    decoration: BoxDecoration(
                                                        color: betOffColor,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  circularRadius),
                                                          topLeft:
                                                              Radius.circular(
                                                                  circularRadius),
                                                        )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[2,5]');
                                              },
                                              child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                                decoration: BoxDecoration(
                                                    color: betOffColor,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomRight:
                                                          Radius.circular(
                                                              circularRadius),
                                                      topRight: Radius.circular(
                                                          circularRadius),
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[5,4]');
                                          },
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                            decoration: BoxDecoration(
                                                color: betOffColor,
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(
                                                      circularRadius),
                                                  topLeft: Radius.circular(
                                                      circularRadius),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[6,5]');
                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                        decoration: BoxDecoration(
                                            color: betOffColor,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(
                                                  circularRadius),
                                              bottomRight: Radius.circular(
                                                  circularRadius),
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[5,8,4,7]');
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                    decoration: BoxDecoration(
                                        color: betOffColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(circularRadius),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[2,5,1,4]');
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                                decoration: BoxDecoration(
                                    color: betOffColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(circularRadius),
                                    )),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[6,9,5,8]');
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                            decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(circularRadius),
                                )),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[3,6,2,5]');
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                        decoration: BoxDecoration(
                            color: betOffColor,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(circularRadius),
                            )),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(8);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('8');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.black,
                                                            child: const Text(
                                                              '8',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(8);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('8');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                height:
                                                                    betRadius,
                                                                width:
                                                                    betRadius,
                                                                decoration:
                                                                    BoxDecoration(
                                                                        color: rbc.betsOnBoard[7]
                                                                            ? betColor
                                                                            : Colors
                                                                                .transparent,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomRight:
                                                                              Radius.circular(circularRadius),
                                                                          topRight:
                                                                              Radius.circular(circularRadius),
                                                                          topLeft:
                                                                              Radius.circular(circularRadius),
                                                                          bottomLeft:
                                                                              Radius.circular(circularRadius),
                                                                        ))),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[8,11]');
                                                  },
                                                  child: Container(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      height: betRadius,
                                                      width: betRadius / 2,
                                                      decoration: BoxDecoration(
                                                          color: betOffColor,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    circularRadius),
                                                            topLeft:
                                                                Radius.circular(
                                                                    circularRadius),
                                                          ))),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[5,8]');
                                              },
                                              child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                                decoration: BoxDecoration(
                                                    color: betOffColor,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight: Radius.circular(
                                                          circularRadius),
                                                      bottomRight:
                                                          Radius.circular(
                                                              circularRadius),
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[8,7]');
                                          },
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                            decoration: BoxDecoration(
                                                color: betOffColor,
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(
                                                      circularRadius),
                                                  topLeft: Radius.circular(
                                                      circularRadius),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[9,8]');
                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                        decoration: BoxDecoration(
                                            color: betOffColor,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(
                                                  circularRadius),
                                              bottomRight: Radius.circular(
                                                  circularRadius),
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[8,11,7,10]');
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                    decoration: BoxDecoration(
                                        color: betOffColor,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                circularRadius))),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[5,8,4,7]');
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                                decoration: BoxDecoration(
                                    color: betOffColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(circularRadius),
                                    )),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[9,12,8,11]');
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                            decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(circularRadius),
                                )),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[6,9,5,8]');
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                        decoration: BoxDecoration(
                            color: betOffColor,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(circularRadius),
                            )),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white),
                                                  ),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(11);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('11');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.black,
                                                            child: const Text(
                                                              '11',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(11);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('11');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              height: betRadius,
                                                              width: betRadius,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        10]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[11,14]');
                                                  },
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[8,11]');
                                              },
                                              child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[11,10]');
                                          },
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    circularRadius),
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[12,11]');
                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[11,14,10,13]');
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(circularRadius)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[8,11,7,10]');
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[12,15,11,14]');
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(circularRadius)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[9,12,8,11]');
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white),
                                                  ),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(14);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('14');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.red,
                                                            child: const Text(
                                                              '14',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(14);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('14');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              height: betRadius,
                                                              width: betRadius,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        13]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[14,17]');
                                                  },
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[11,14]');
                                              },
                                              child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[14,13]');
                                          },
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    circularRadius),
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[15,14]');
                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[14,17,13,16]');
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(circularRadius)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[11,14,10,13]');
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[15,18,14,17]');
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(circularRadius)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[12,15,11,14]');
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white),
                                                  ),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(17);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('17');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.black,
                                                            child: const Text(
                                                              '17',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(17);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('17');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              height: betRadius,
                                                              width: betRadius,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        16]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[17,20]');
                                                  },
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[14,17]');
                                              },
                                              child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[17,16]');
                                          },
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    circularRadius),
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[18,17]');
                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[17,20,16,19]');
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(circularRadius)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[14,17,13,16]');
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[18,21,17,20]');
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(circularRadius)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[15,18,14,17]');
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white),
                                                  ),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(20);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('20');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.black,
                                                            child: const Text(
                                                              '20',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(20);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('20');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              width: betRadius,
                                                              height: betRadius,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        19]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[20,23]');
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[17,20]');
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[20,19]');
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                                topRight: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[21,20]');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[20,23,19,22]');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(circularRadius),
                                      ),
                                    ),
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[17,20,16,19]');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[21,24,20,23]');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(circularRadius),
                              ),
                            ),
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[18,21,17,20]');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(23);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('23');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.red,
                                                            child: const Text(
                                                              '23',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(23);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('23');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              height: betRadius,
                                                              width: betRadius,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        22]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[23,26]');
                                                  },
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[20,23]');
                                              },
                                              child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[23,22]');
                                          },
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    circularRadius),
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[24,23]');
                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[23,26,22,25]');
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(circularRadius)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[20,23,19,22]');
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[24,27,23,26]');
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(circularRadius)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[21,24,20,23]');
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(26);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('26');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.black,
                                                            child: const Text(
                                                              '26',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(26);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('26');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                height:
                                                                    betRadius,
                                                                width:
                                                                    betRadius,
                                                                decoration:
                                                                    BoxDecoration(
                                                                        color: rbc.betsOnBoard[25]
                                                                            ? betColor
                                                                            : Colors
                                                                                .transparent,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomRight:
                                                                              Radius.circular(circularRadius),
                                                                          topRight:
                                                                              Radius.circular(circularRadius),
                                                                          topLeft:
                                                                              Radius.circular(circularRadius),
                                                                          bottomLeft:
                                                                              Radius.circular(circularRadius),
                                                                        ))),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[26,29]');
                                                  },
                                                  child: Container(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      height: betRadius,
                                                      width: betRadius / 2,
                                                      decoration: BoxDecoration(
                                                          color: betOffColor,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    circularRadius),
                                                            topLeft:
                                                                Radius.circular(
                                                                    circularRadius),
                                                          ))),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[23,26]');
                                              },
                                              child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                                decoration: BoxDecoration(
                                                    color: betOffColor,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight: Radius.circular(
                                                          circularRadius),
                                                      bottomRight:
                                                          Radius.circular(
                                                              circularRadius),
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[26,25]');
                                          },
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                            decoration: BoxDecoration(
                                                color: betOffColor,
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(
                                                      circularRadius),
                                                  topLeft: Radius.circular(
                                                      circularRadius),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[27,26]');
                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                        decoration: BoxDecoration(
                                            color: betOffColor,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(
                                                  circularRadius),
                                              bottomRight: Radius.circular(
                                                  circularRadius),
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[26,29,25,28]');
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                    decoration: BoxDecoration(
                                        color: betOffColor,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                circularRadius))),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[23,26,22,25]');
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                                decoration: BoxDecoration(
                                    color: betOffColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(circularRadius),
                                    )),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[27,30,26,29]');
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                            decoration: BoxDecoration(
                                color: betOffColor,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(circularRadius),
                                )),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[24,27,23,26]');
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                        decoration: BoxDecoration(
                            color: betOffColor,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(circularRadius),
                            )),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(29);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('29');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.black,
                                                            child: const Text(
                                                              '29',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(29);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('29');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              height: betRadius,
                                                              width: betRadius,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        28]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[29,32]');
                                                  },
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[26,29]');
                                              },
                                              child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[29,28]');
                                          },
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    circularRadius),
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[30,29]');
                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[29,32,28,31]');
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(circularRadius)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[26,29,25,28]');
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[30,33,29,32]');
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(circularRadius)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[27,30,26,29]');
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(32);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('32');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.red,
                                                            child: const Text(
                                                              '32',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(32);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('32');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              height: betRadius,
                                                              width: betRadius,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        31]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[32,35]');
                                                  },
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[29,32]');
                                              },
                                              child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[32,31]');
                                          },
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    circularRadius),
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[33,32]');
                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[32,35,31,34]');
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(circularRadius)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[29,32,28,31]');
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[33,36,32,35]');
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(circularRadius)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[30,33,29,32]');
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(35);

                                                            rbc.bets.add('35');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.black,
                                                            child: const Text(
                                                              '35',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(35);

                                                            rbc.bets.add('35');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              height: betRadius,
                                                              width: betRadius,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        34]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[32,35]');
                                              },
                                              child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[35,34]');
                                          },
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    circularRadius),
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[36,35]');
                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(circularRadius)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[32,35,31,34]');
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(circularRadius)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[33,36,32,35]');
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(1);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('1');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.red,
                                                            child: const Text(
                                                              '1',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(1);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('1');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              height: betRadius,
                                                              width: betRadius,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        0]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[1,4]');
                                                  },
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[0,1]');
                                              },
                                              child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[1,2,3]');
                                          },
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    circularRadius),
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[1,2]');
                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[1,2,3,4,5,6]');
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(circularRadius)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Obx(
                              () => GestureDetector(
                                onTap: () {
                                  rbc.bets.add('[0,00,1,2,3]');
                                  rbc.cornerBets[3] = true;
                                },
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  height: betRadius / 2,
                                  width: betRadius / 2,
                                  decoration: BoxDecoration(
                                    color: rbc.cornerBets[3]
                                        ? betColor
                                        : betOffColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(circularRadius),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[2,5,1,4]');
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(circularRadius)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => GestureDetector(
                        onTap: () {
                          rbc.bets.add('[2,0,1]');
                          rbc.cornerBets[2] = true;
                        },
                        child: Container(
                          alignment: Alignment.centerRight,
                          height: betRadius / 2,
                          width: betRadius / 2,
                          decoration: BoxDecoration(
                            color: rbc.cornerBets[2] ? betColor : betOffColor,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(circularRadius),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(4);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('4');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.black,
                                                            child: const Text(
                                                              '4',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(4);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('4');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              height: betRadius,
                                                              width: betRadius,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        3]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[4,7]');
                                                  },
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[1,4]');
                                              },
                                              child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[4,5,6]');
                                          },
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    circularRadius),
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[4,5]');
                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[4,5,6,7,8,9]');
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(circularRadius)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[1,2,3,4,5,6]');
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[5,8,4,7]');
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(circularRadius)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[2,5,1,4]');
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(7);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('7');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.red,
                                                            child: const Text(
                                                              '7',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(7);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('7');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              height: betRadius,
                                                              width: betRadius,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        6]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[7,10]');
                                                  },
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[4,7]');
                                              },
                                              child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[7,8,9]');
                                          },
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    circularRadius),
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[7,8]');
                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[7,8,9,10,11,12]');
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(circularRadius)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[4,5,6,7,8,9]');
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[8,11,7,10]');
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(circularRadius)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[5,8,4,7]');
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(10);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('10');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.black,
                                                            child: const Text(
                                                              '10',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(10);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('10');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              height: betRadius,
                                                              width: betRadius,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        9]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[10,13]');
                                                  },
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[7,10]');
                                              },
                                              child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[10,11,12]');
                                          },
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    circularRadius),
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[10,11]');
                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[10,11,12,13,14,15]');
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(circularRadius)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[7,8,9,10,11,12]');
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[11,14,10,13]');
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(circularRadius)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[8,11,7,10]');
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(13);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('13');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.black,
                                                            child: const Text(
                                                              '13',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(13);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('13');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              height: betRadius,
                                                              width: betRadius,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        12]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[13,16]');
                                                  },
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[10,13]');
                                              },
                                              child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[13,14,15]');
                                          },
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    circularRadius),
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[13,14]');
                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[13,14,15,16,17,18]');
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(circularRadius)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[10,11,12,13,14,15]');
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[14,17,13,16]');
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(circularRadius)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[11,14,10,13]');
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(16);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('16');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.red,
                                                            child: const Text(
                                                              '16',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(16);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('16');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              height: betRadius,
                                                              width: betRadius,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        15]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[16,19]');
                                                  },
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[13,16]');
                                              },
                                              child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[16,17,18]');
                                          },
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    circularRadius),
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[16,17]');
                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[16,17,18,19,20,21]');
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(circularRadius)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[13,14,15,16,17,18]');
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[17,20,16,19]');
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(circularRadius)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[14,17,13,16]');
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(19);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('19');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.red,
                                                            child: const Text(
                                                              '19',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(19);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('19');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              height: betRadius,
                                                              width: betRadius,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        18]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[19,22]');
                                                  },
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[16,19]');
                                              },
                                              child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[19,20,21]');
                                          },
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    circularRadius),
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[19,20]');
                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[19,20,21,22,23,24]');
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(circularRadius)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[16,17,18,19,20,21]');
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[20,23,19,22]');
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(circularRadius)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[17,20,16,19]');
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(22);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('22');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.black,
                                                            child: const Text(
                                                              '22',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(22);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('22');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              height: betRadius,
                                                              width: betRadius,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        21]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[22,25]');
                                                  },
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[19,22]');
                                              },
                                              child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[22,23,24]');
                                          },
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    circularRadius),
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[22,23]');
                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[22,23,24,25,26,27]');
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(circularRadius)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[19,20,21,22,23,24]');
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[23,26,22,25]');
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(circularRadius)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[20,23,19,22]');
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(25);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('25');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.red,
                                                            child: const Text(
                                                              '25',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(25);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('25');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              height: betRadius,
                                                              width: betRadius,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        24]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[25,28]');
                                                  },
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[22,25]');
                                              },
                                              child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[25,26,27]');
                                          },
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    circularRadius),
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[25,26]');
                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[25,26,27,28,29,30]');
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(circularRadius)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[22,23,24,25,26,27]');
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[26,29,25,28]');
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(circularRadius)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[23,26,22,25]');
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(28);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('28');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.black,
                                                            child: const Text(
                                                              '28',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(28);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('28');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              height: betRadius,
                                                              width: betRadius,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        27]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[28,31]');
                                                  },
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[25,28]');
                                              },
                                              child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[28,29,30]');
                                          },
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    circularRadius),
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[28,29]');
                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[28,29,30,31,32,33]');
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(circularRadius)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[25,26,27,28,29,30]');
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[29,32,28,31]');
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(circularRadius)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[26,29,25,28]');
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(31);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('31');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.black,
                                                            child: const Text(
                                                              '31',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(31);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('31');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              height: betRadius,
                                                              width: betRadius,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        30]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    rbc.bets.add('[31,34]');
                                                  },
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                    decoration: BoxDecoration(
                                                      color: betOffColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[28,31]');
                                              },
                                              child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[31,32,33]');
                                          },
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    circularRadius),
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[31,32]');
                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    rbc.bets.add('[31,32,33,34,35,36]');
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                    decoration: BoxDecoration(
                                      color: betOffColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(circularRadius)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[28,29,30,31,32,33]');
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            rbc.bets.add('[32,35,31,34]');
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                            decoration: BoxDecoration(
                              color: betOffColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(circularRadius)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[29,32,28,31]');
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  alignment: Alignment.center,
                                                  width: box_size,
                                                  height: box_size,
                                                  child: ClipOval(
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(34);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('34');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                box_size / 1.7,
                                                            height:
                                                                box_size / 1.5,
                                                            color: Colors.red,
                                                            child: const Text(
                                                              '34',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            rbc.activeBet(34);
                                                            rbc.straightUpBetsCount
                                                                .value++;
                                                            rbc.bets.add('34');
                                                          },
                                                          child: Obx(
                                                            () => Container(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              height: betRadius,
                                                              width: betRadius,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: rbc.betsOnBoard[
                                                                        33]
                                                                    ? betColor
                                                                    : Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          circularRadius),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    height: betRadius,
                                                    width: betRadius / 2,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                        topLeft:
                                                            Radius.circular(
                                                                circularRadius),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                rbc.bets.add('[31,34]');
                                              },
                                              child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                height: betRadius,
                                                width: betRadius / 2,
                                                decoration: BoxDecoration(
                                                  color: betOffColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        circularRadius),
                                                    bottomRight:
                                                        Radius.circular(
                                                            circularRadius),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            rbc.bets.add('[34,35,36]');
                                          },
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            height: betRadius / 2,
                                            width: betRadius,
                                            decoration: BoxDecoration(
                                              color: betOffColor,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    circularRadius),
                                                topLeft: Radius.circular(
                                                    circularRadius),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        rbc.bets.add('[34,35]');
                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        height: betRadius / 2,
                                        width: betRadius,
                                        decoration: BoxDecoration(
                                          color: betOffColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(circularRadius),
                                            bottomRight:
                                                Radius.circular(circularRadius),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    height: betRadius / 2,
                                    width: betRadius / 2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(circularRadius)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add('[31,32,33,34,35,36]');
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                height: betRadius / 2,
                                width: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(circularRadius),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: betRadius / 2,
                            width: betRadius / 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(circularRadius)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.bets.add('[32,35,31,34]');
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: betRadius / 2,
                        width: betRadius / 2,
                        decoration: BoxDecoration(
                          color: betOffColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(circularRadius),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        rbc.dozenBetsCount += 1;
                        rbc.activeFirst12();
                        rbc.bets.add('[1,2,3,4,5,6,7,8,9,10,11,12]');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white)),
                        alignment: Alignment.center,
                        width: bottom_row_width,
                        height: box_size,
                        child: const Text(
                          '1st 12',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.dozenBetsCount += 1;
                        rbc.activeSecond12();
                        rbc.bets.add('[13,14,15,16,17,18,19,20,21,22,23,24]');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white)),
                        alignment: Alignment.center,
                        width: bottom_row_width,
                        height: box_size,
                        child: const Text(
                          '2nd 12',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        rbc.dozenBetsCount += 1;
                        rbc.activeThird12();
                        rbc.bets.add('[25,26,27,28,29,30,31,32,33,34,35,36]');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white)),
                        alignment: Alignment.center,
                        width: bottom_row_width,
                        height: box_size,
                        child: const Text(
                          '3rd 12',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: betRadius / 2,
                  width: bottom_row_width * 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: box_size,
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => GestureDetector(
                                onTap: () {
                                  rbc.bets.add("[0,00,1,2,3]");
                                  rbc.cornerBets[3] = true;
                                },
                                child: Container(
                                  width: betRadius / 2,
                                  height: betRadius / 2,
                                  decoration: BoxDecoration(
                                    color: rbc.cornerBets[3]
                                        ? betColor
                                        : betOffColor,
                                    borderRadius: BorderRadius.only(
                                        bottomRight:
                                            Radius.circular(circularRadius)),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[1,2,3]");
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: betRadius,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(circularRadius),
                                      bottomLeft:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[1,2,3,4,5,6]");
                              },
                              child: Container(
                                width: betRadius / 2,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: box_size,
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[1,2,3,4,5,6]");
                              },
                              child: Container(
                                width: betRadius / 2,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[4,5,6]");
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: betRadius,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(circularRadius),
                                      bottomLeft:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[4,5,6,7,8,9]");
                              },
                              child: Container(
                                width: betRadius / 2,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: box_size,
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[4,5,6,7,8,9]");
                              },
                              child: Container(
                                width: betRadius / 2,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[7,8,9]");
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: betRadius,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(circularRadius),
                                      bottomLeft:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("7,8,9,10,11,12");
                              },
                              child: Container(
                                width: betRadius / 2,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: box_size,
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[7,8,9,10,11,12]");
                              },
                              child: Container(
                                width: betRadius / 2,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[10,11,12]");
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: betRadius,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(circularRadius),
                                      bottomLeft:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[10,11,12,13,14,15]");
                              },
                              child: Container(
                                width: betRadius / 2,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: box_size,
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[10,11,12,13,14,15]");
                              },
                              child: Container(
                                width: betRadius / 2,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[13,14,15]");
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: betRadius,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(circularRadius),
                                      bottomLeft:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[13,14,15,16,17,18]");
                              },
                              child: Container(
                                width: betRadius / 2,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: box_size,
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[13,14,15,16,17,18]");
                              },
                              child: Container(
                                width: betRadius / 2,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[16,17,18]");
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: betRadius,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(circularRadius),
                                      bottomLeft:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[16,17,18,19,20,21]");
                              },
                              child: Container(
                                width: betRadius / 2,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: box_size,
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[16,17,18,19,20,21]");
                              },
                              child: Container(
                                width: betRadius / 2,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[19,20,21]");
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: betRadius,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(circularRadius),
                                      bottomLeft:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[19,20,21,22,23,24]");
                              },
                              child: Container(
                                width: betRadius / 2,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: box_size,
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[19,20,21,22,23,24]");
                              },
                              child: Container(
                                width: betRadius / 2,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[22,23,24]");
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: betRadius,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(circularRadius),
                                      bottomLeft:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[22,23,24,25,26,27]");
                              },
                              child: Container(
                                width: betRadius / 2,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: box_size,
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[22,23,24,25,26,27]");
                              },
                              child: Container(
                                width: betRadius / 2,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[25,26,27]");
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: betRadius,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(circularRadius),
                                      bottomLeft:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[25,26,27,28,29,30]");
                              },
                              child: Container(
                                width: betRadius / 2,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: box_size,
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[25,26,27,28,29,30]");
                              },
                              child: Container(
                                width: betRadius / 2,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[28,29,30]");
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: betRadius,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(circularRadius),
                                      bottomLeft:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[28,29,30,31,32,33]");
                              },
                              child: Container(
                                width: betRadius / 2,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: box_size,
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[28,29,30,31,32,33]");
                              },
                              child: Container(
                                width: betRadius / 2,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[31,32,33]");
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: betRadius,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(circularRadius),
                                      bottomLeft:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[31,32,33,34,35,36]");
                              },
                              child: Container(
                                width: betRadius / 2,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: box_size,
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[31,32,33,34,35,36]");
                              },
                              child: Container(
                                width: betRadius / 2,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                rbc.bets.add("[34,35,36]");
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: betRadius,
                                height: betRadius / 2,
                                decoration: BoxDecoration(
                                  color: betOffColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight:
                                          Radius.circular(circularRadius),
                                      bottomLeft:
                                          Radius.circular(circularRadius)),
                                ),
                              ),
                            ),
                            Container(
                              width: betRadius / 2,
                              height: betRadius / 2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft:
                                        Radius.circular(circularRadius)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    rbc.lowHighBetsCount += 1;
                    rbc.active1to18();
                    rbc.bets
                        .add('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]');
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    alignment: Alignment.center,
                    width: bottom_row_width / 2,
                    height: box_size,
                    child: const Text(
                      '1 to 18',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    rbc.evenOddBetsCount.value += 1;
                    rbc.activeEven();
                    rbc.bets.add('[2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32'
                        ',34,36]');
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    alignment: Alignment.center,
                    width: bottom_row_width / 2,
                    height: box_size,
                    child: const Text(
                      'EVEN',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    rbc.colorBetsCount += 1;
                    rbc.activeRed();
                    rbc.bets.add('[1,3,5,7,9,12,14,16,18,19,21,23,25,27,30,32'
                        ',34,36]');
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    alignment: Alignment.center,
                    width: bottom_row_width / 2,
                    height: box_size,
                    padding: const EdgeInsets.all(4.0),
                    child: DiamondShape(
                      width: bottom_row_width / 2,
                      height: box_size,
                      color: Colors.red,
                      borderColor: Colors.white,
                      borderWidth: 1.0,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    rbc.colorBetsCount += 1;
                    rbc.activeBlack();
                    rbc.bets.add('[2,4,6,8,10,11,13,15,17,20,22,24,26,28,29,31'
                        ',33,35]');
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    alignment: Alignment.center,
                    width: bottom_row_width / 2,
                    height: box_size,
                    padding: const EdgeInsets.all(4.0),
                    child: DiamondShape(
                      width: bottom_row_width / 2,
                      height: box_size,
                      color: Colors.black,
                      borderColor: Colors.white,
                      borderWidth: 1.0,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    rbc.evenOddBetsCount.value += 1;
                    rbc.activeOdd();
                    rbc.bets.add('[1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31'
                        ',33,35]');
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    alignment: Alignment.center,
                    width: bottom_row_width / 2,
                    height: box_size,
                    child: const Text(
                      'ODD',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    rbc.lowHighBetsCount += 1;
                    rbc.active19to36();
                    rbc.bets.add(
                        '[19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36]');
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    alignment: Alignment.center,
                    width: bottom_row_width / 2,
                    height: box_size,
                    child: const Text(
                      '19 to 36',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        Column(
          children: [
            Container(
                width: box_size,
                height: betRadius / 2,
                color: upperExtraAreaColor),
            GestureDetector(
              onTap: () {
                rbc.columnBetsCount += 1;
                rbc.activeThirdColumn();
                rbc.bets.add('[3,6,9,12,15,18,21,24,27,30,33,36]');
              },
              child: Container(
                height: box_size,
                width: box_size,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: const RotatedBox(
                  quarterTurns: 3,
                  child: FittedBox(
                    child: Text(
                      '2 to 1',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                rbc.columnBetsCount += 1;
                rbc.activeSecondColumn();
                rbc.bets.add('[2,5,8,11,14,17,20,23,26,29,32,35]');
              },
              child: Container(
                height: box_size,
                width: box_size,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
                child: const RotatedBox(
                  quarterTurns: 3,
                  child: FittedBox(
                    child: Text(
                      '2 to 1',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                rbc.columnBetsCount += 1;
                rbc.activeFirstColumn();
                rbc.bets.add('[1,4,7,10,13,16,19,22,25,28,31,34]');
              },
              child: Container(
                height: box_size,
                width: box_size,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
                child: const RotatedBox(
                  quarterTurns: 3,
                  child: FittedBox(
                    child: Text(
                      '2 to 1',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DiamondShape extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Color borderColor;
  final double borderWidth;

  const DiamondShape({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.borderColor,
    required this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRect(
        child: CustomPaint(
          painter: DiamondPainter(color, borderColor, borderWidth),
        ),
      ),
    );
  }
}

class DiamondPainter extends CustomPainter {
  final Color color;
  final Color borderColor;
  final double borderWidth;

  DiamondPainter(this.color, this.borderColor, this.borderWidth);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Paint borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    Path path = Path()
      ..moveTo(size.width / 2, 0.0) // Top point
      ..lineTo(size.width, size.height / 2) // Right point
      ..lineTo(size.width / 2, size.height) // Bottom point
      ..lineTo(0.0, size.height / 2) // Left point
      ..close(); // Close the path to complete the diamond shape

    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
