import 'dart:async';
import 'dart:math';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roulette_project/backend/requests.dart';
import 'package:roulette_project/backend/sharedpreferences.dart';
import 'package:roulette_project/backend/userdatacontroller.dart';
import 'package:roulette_project/main.dart';
import 'package:roulette_project/views/roulette/rouletteboard.dart';
import 'package:roulette_project/views/roulette/rouletteboardcontroller.dart';

class RoulettePage extends StatefulWidget {
  const RoulettePage({super.key});

  @override
  State<RoulettePage> createState() {
    return RoulettePageState();
  }
}

class RoulettePageState extends State<RoulettePage> {
  final RouletteBoardController rouletteBoardController = Get.find();
  final UserData userData = Get.find();

  late Timer timer;
  late Random random;
  late double degree;
  late int time;
  int value = 0;

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Exit Game'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Do you want to exit the game?"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.green[900],
              ),
              child: Text('Yes', style: TextStyle(color: Colors.green[900])),
              onPressed: () async {
                if (userData.gameType.value == 'real') {
                  await BackendRequests().updateGame(
                      rouletteBoardController.gameId.value,
                      userData.user_id.value,
                      "finished",
                      rouletteBoardController.moveNum.value.toString(),
                      "0",
                      "0",
                      "");
                }

                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.green[900],
              ),
              child: Text('No', style: TextStyle(color: Colors.green[900])),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    rouletteBoardController.moveNum.value = 0;
    if (userData.gameType.value == 'demo') {
      rouletteBoardController.userBalance.value =
          userData.current_demo_balance.value;
    } else if (userData.gameType.value == 'real') {
      rouletteBoardController.userBalance.value =
          userData.current_balance.value;
    }
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    random = Random();
    resetWheel();
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    userData.checkUserConnection();
    ScreenUtil.configure(designSize: const Size(320, 534));
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
    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) async {
      if (time > 0) {
        setState(() {
          degree = random.nextInt(360).toDouble();
          value = calculateValueBeta(degree);
        });
        time = time - 100;
      } else {
        await userData.checkUserConnection();
        if (userData.userConnection.value == false) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Internet Connection Required.'),
            ),
          );
          rouletteBoardController.spinning.value = false;
          rouletteBoardController.wheelSpinning.value = false;
          timer.cancel();
          Get.offAll(() => const MyApp());
          return;
        }

        rouletteBoardController.spinResult.value = value;
        rouletteBoardController.calculateBet();
        rouletteBoardController
            .checkBet(rouletteBoardController.spinResult.value);
        timer.cancel();
        rouletteBoardController.spinning.value = false;

        if (rouletteBoardController.userWon.value == true) {
          print(
              "User id : ${userData.user_id.value} , Move number : ${rouletteBoardController.moveNum.value} , Game status : ${rouletteBoardController.gameStatus.value} , Last bet amount : ${rouletteBoardController.totalBetAmount.value} , Last bet won lost : won");

          userData.number_of_games_won.value =
              userData.number_of_games_won.value + 1;
          userData.winningAmount.value =
              rouletteBoardController.totalAmountWon.value +
                  userData.winningAmount.value;
          userData.total_amount_won.value = userData.winningAmount.value;

          await BackendRequests().updateUserDashboard(
              userData.user_id.value,
              userData.number_of_games_played.value.toString(),
              userData.number_of_games_won.value.toString(),
              userData.number_of_games_lost.value.toString(),
              rouletteBoardController.totalAmountWon.toString(),
              userData.winningAmount.value.toString(),
              userData.total_amount_lost.value.toString());

          await BackendRequests().updateGame(
              rouletteBoardController.gameId.value,
              userData.user_id.value,
              rouletteBoardController.gameStatus.value,
              rouletteBoardController.moveNum.value.toString(),
              rouletteBoardController.totalBetAmount.value.toString(),
              rouletteBoardController.lastWinAmount.value.toString(),
              "Won");

          await BackendRequests().updateUserBalance(userData.user_id.value,
              rouletteBoardController.userBalance.value.toString());
        } else {
          print(
              "User id : ${userData.user_id.value} , Move number : ${rouletteBoardController.moveNum.value} , Game status : ${rouletteBoardController.gameStatus.value} , Last bet amount : ${rouletteBoardController.totalBetAmount.value} , Last bet won lost : lost");

          userData.number_of_games_lost.value =
              userData.number_of_games_lost.value + 1;
          await BackendRequests().updateUserDashboard(
              userData.user_id.value,
              userData.number_of_games_played.value.toString(),
              userData.number_of_games_won.value.toString(),
              userData.number_of_games_lost.value.toString(),
              userData.total_amount_won.value.toString(),
              userData.winningAmount.value.toString(),
              (userData.total_amount_lost +
                      rouletteBoardController.totalBetAmount.value)
                  .toString());

          await BackendRequests().updateGame(
              rouletteBoardController.gameId.value,
              userData.user_id.value,
              rouletteBoardController.gameStatus.value,
              rouletteBoardController.moveNum.value.toString(),
              rouletteBoardController.totalBetAmount.value.toString(),
              rouletteBoardController.lastWinAmount.value.toString(),
              "Lost");

          await BackendRequests().updateUserBalance(userData.user_id.value,
              rouletteBoardController.userBalance.value.toString());
        }
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showMyDialog();
        return false;
      },
      child: OrientationBuilder(builder: (context, orientation) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight
        ]);

        ScreenUtil.configure(designSize: const Size(534, 320));
        return Scaffold(
          backgroundColor: Colors.green[900],
          body: Obx(
            () => Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          height: 180.h,
                          child: RouletteBoard()),
                      SizedBox(
                        height: 100.h,
                        child: Container(
                          width: 520.w,
                          alignment: Alignment.centerLeft,
                          color: Colors.green[800],
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(
                                      () => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 280.w,
                                            alignment: Alignment.centerLeft,
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Text(
                                                'Bets : ${rouletteBoardController.bets}',
                                                maxLines: 1,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Balance : ${rouletteBoardController.userBalance.value - rouletteBoardController.totalBetAmount.value}',
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Obx(
                                      () => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              MaterialButton(
                                                onPressed: () {
                                                  rouletteBoardController
                                                      .totalBetAmount.value = 0;
                                                  rouletteBoardController
                                                      .zeroBets
                                                      .fillRange(
                                                          0,
                                                          rouletteBoardController
                                                              .zeroBets.length,
                                                          false);
                                                  rouletteBoardController
                                                      .cornerBets
                                                      .fillRange(
                                                          0,
                                                          rouletteBoardController
                                                              .cornerBets
                                                              .length,
                                                          false);
                                                  rouletteBoardController
                                                      .betsOnBoardCount
                                                      .fillRange(
                                                          0,
                                                          rouletteBoardController
                                                              .betsOnBoardCount
                                                              .length,
                                                          0);
                                                  rouletteBoardController.bets
                                                      .clear();
                                                  rouletteBoardController
                                                      .betsOnBoard
                                                      .fillRange(
                                                          0,
                                                          rouletteBoardController
                                                              .betsOnBoard
                                                              .length,
                                                          false);
                                                  rouletteBoardController
                                                      .betSizes
                                                      .clear();
                                                  rouletteBoardController
                                                      .betsInInt
                                                      .clear();
                                                  rouletteBoardController
                                                      .userResult.value = "";
                                                  rouletteBoardController
                                                      .userWon.value = false;
                                                },
                                                color: Colors.white,
                                                textColor: Colors.green[900],
                                                child: const Text('Clear'),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 8.0),
                                                alignment: Alignment.center,
                                                child: Text(
                                                    'Last win : ${rouletteBoardController.lastWinAmount.value}',
                                                    style: const TextStyle(
                                                        color: Colors.white)),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              rouletteBoardController
                                                          .wheelSpinning
                                                          .value ==
                                                      false
                                                  ? Obx(
                                                      () => Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 8.0),
                                                        child: Text(
                                                          'Last spin : ${rouletteBoardController.spinResult.value}',
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : Container(),
                                              rouletteBoardController
                                                          .wheelSpinning
                                                          .value ==
                                                      false
                                                  ? degree == 0
                                                      ? ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                Colors.white,
                                                            foregroundColor:
                                                                Colors
                                                                    .green[900],
                                                          ),
                                                          onPressed: () {
                                                            if (rouletteBoardController
                                                                    .totalBetAmount
                                                                    .value ==
                                                                0) {
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      const SnackBar(
                                                                content: Text(
                                                                    'Place a bet'),
                                                              ));
                                                              return;
                                                            }

                                                            if (rouletteBoardController
                                                                        .userBalance
                                                                        .value -
                                                                    rouletteBoardController
                                                                        .totalBetAmount
                                                                        .value <=
                                                                0) {
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      const SnackBar(
                                                                content: Text(
                                                                    'Not enough money'),
                                                              ));
                                                              print(
                                                                  "Not enough money");
                                                              return;
                                                            } else {
                                                              if (userData
                                                                      .gameType
                                                                      .value ==
                                                                  'demo') {
                                                                if (userData.current_demo_balance
                                                                            .value -
                                                                        rouletteBoardController
                                                                            .totalBetAmount
                                                                            .value <=
                                                                    0) {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                          const SnackBar(
                                                                    content: Text(
                                                                        'Not enough money'),
                                                                  ));
                                                                  return;
                                                                }
                                                              } else if (userData
                                                                      .gameType
                                                                      .value ==
                                                                  'real') {
                                                                if (userData.current_balance
                                                                            .value -
                                                                        rouletteBoardController
                                                                            .totalBetAmount
                                                                            .value <=
                                                                    0) {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                          const SnackBar(
                                                                    content: Text(
                                                                        'Not enough money'),
                                                                  ));
                                                                  print(
                                                                      "Not enough money");
                                                                  return;
                                                                }
                                                              }
                                                              rouletteBoardController
                                                                  .userBalance
                                                                  .value = rouletteBoardController
                                                                      .userBalance
                                                                      .value -
                                                                  rouletteBoardController
                                                                      .totalBetAmount
                                                                      .value;
                                                              rouletteBoardController
                                                                  .spinning
                                                                  .value = true;
                                                              rouletteBoardController
                                                                  .wheelSpinning
                                                                  .value = true;
                                                              rouletteBoardController
                                                                  .moveNum
                                                                  .value += 1;

                                                              if (userData
                                                                      .gameType
                                                                      .value ==
                                                                  'demo') {
                                                                SharedPreferencesManager.setDemoBalance(
                                                                    rouletteBoardController
                                                                        .userBalance
                                                                        .value);
                                                                userData.current_demo_balance
                                                                        .value =
                                                                    rouletteBoardController
                                                                        .userBalance
                                                                        .value;
                                                              }
                                                              rouletteBoardController
                                                                      .gameStatus
                                                                      .value =
                                                                  "ongoing";
                                                              rotateWheel();
                                                            }
                                                          },
                                                          child: const Text(
                                                              'Start spin'))
                                                      : ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                Colors.white,
                                                            foregroundColor:
                                                                Colors
                                                                    .green[900],
                                                          ),
                                                          onPressed: () {
                                                            resetWheel();
                                                          },
                                                          child: const Text(
                                                              'Reset wheel'))
                                                  : Container(),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Stack(children: [
                                    Positioned(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Transform.rotate(
                                          angle: 3.14 / 180 * degree,
                                          child: Image.asset(
                                            'assets/images/wheel.png',
                                            scale: 5,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                        child: Align(
                                            alignment: Alignment.topCenter,
                                            child: Icon(Icons.place,
                                                size: 30,
                                                color: Color.fromRGBO(
                                                    241, 154, 100, 1))))
                                  ]),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                rouletteBoardController.wheelSpinning.value == true
                    ? Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              BlurryContainer(
                                blur: 2,
                                height: 1.sh,
                                width: 1.sw,
                                elevation: 0,
                                color: Colors.transparent,
                                child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        width: 0.6.sw,
                                        height: 0.6.sh,
                                        child: Stack(children: [
                                          Positioned(
                                              child: Align(
                                                  alignment: Alignment.center,
                                                  child: Transform.rotate(
                                                      angle:
                                                          3.14 / 180 * degree,
                                                      child: Image.asset(
                                                        'assets/images/wheel.png',
                                                        scale: 1,
                                                      )))),
                                          const Positioned(
                                              child: Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Icon(Icons.place,
                                                      size: 30,
                                                      color: Colors.yellow)))
                                        ]),
                                      ),
                                    ),
                                    rouletteBoardController.spinning.value ==
                                            false
                                        ? IconButton(
                                            onPressed: () {
                                              rouletteBoardController
                                                  .wheelSpinning.value = false;
                                              rouletteBoardController
                                                  .totalBetAmount.value = 0;
                                              rouletteBoardController.zeroBets
                                                  .fillRange(
                                                      0,
                                                      rouletteBoardController
                                                          .zeroBets.length,
                                                      false);
                                              rouletteBoardController.cornerBets
                                                  .fillRange(
                                                      0,
                                                      rouletteBoardController
                                                          .cornerBets.length,
                                                      false);
                                              rouletteBoardController
                                                  .betsOnBoardCount
                                                  .fillRange(
                                                      0,
                                                      rouletteBoardController
                                                          .betsOnBoardCount
                                                          .length,
                                                      0);
                                              rouletteBoardController.bets
                                                  .clear();
                                              rouletteBoardController
                                                  .betsOnBoard
                                                  .fillRange(
                                                      0,
                                                      rouletteBoardController
                                                          .betsOnBoard.length,
                                                      false);
                                              rouletteBoardController.betSizes
                                                  .clear();
                                              rouletteBoardController.betsInInt
                                                  .clear();
                                              rouletteBoardController
                                                  .userResult.value = "";
                                              rouletteBoardController
                                                  .userWon.value = false;
                                            },
                                            icon: const Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ))
                                        : Container(),
                                  ],
                                ),
                              ),
                              rouletteBoardController.spinning.value == false
                                  ? Container(
                                      height: 0.15.sh,
                                      width: 0.15.sw,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.sp))),
                                      child: Text(
                                          '${rouletteBoardController.spinResult.value}',
                                          style: TextStyle(
                                              color: Colors.green[900],
                                              fontSize: 30)),
                                    )
                                  : Container()
                            ],
                          ),
                          rouletteBoardController.spinning.value == false
                              ? Obx(
                                  () => Container(
                                    margin: EdgeInsets.only(bottom: 0.05.sh),
                                    height: 0.1.sh,
                                    width: 0.25.sw,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.sp))),
                                    child: Text(
                                        rouletteBoardController
                                            .userResult.value,
                                        style: TextStyle(
                                            color: Colors.green[900],
                                            fontWeight: FontWeight.w600,
                                            fontSize: 24)),
                                  ),
                                )
                              : Container()
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
