import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roulette_project/backend/user_data.dart';
import 'package:roulette_project/components/game_header.dart';

class Wallet extends StatelessWidget {
  Wallet({super.key});

  final UserData userData = Get.put(UserData());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
      body: Column(
        children: [
          GameHeader(),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1)),
            child: Center(
              child: Obx(
                () => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          width: 400,
                          child: InkWell(
                            mouseCursor: MaterialStateMouseCursor.clickable,
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Wallet',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 23,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 1, color: Colors.white))),
                        alignment: Alignment.center,
                        width: 400,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.wallet,
                                  color: Colors.white,
                                )),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  'Deposit Wallet',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  'Rs.0',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 1, color: Colors.white))),
                        alignment: Alignment.center,
                        width: 400,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.wallet,
                                  color: Colors.white,
                                )),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  'Game Wallet',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  'Rs.0',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 1, color: Colors.white))),
                        alignment: Alignment.center,
                        width: 400,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.wallet,
                                  color: Colors.white,
                                )),
                            const Expanded(
                                flex: 2,
                                child: Text(
                                  'Demo Wallet',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                            Expanded(
                                flex: 1,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    'Rs.${userData.current_demo_balance.value}',
                                    maxLines: 1,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 1, color: Colors.white))),
                        alignment: Alignment.center,
                        width: 400,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.wallet,
                                  color: Colors.white,
                                )),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  'Winning Wallet',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  'Rs.0',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ))
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
