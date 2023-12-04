import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:roulette_project/backend/requests.dart';
import 'package:roulette_project/backend/userdatacontroller.dart';
import 'package:roulette_project/components/game_header.dart';

class Wallet extends StatelessWidget {
  Wallet({super.key});

  final UserData userData = Get.put(UserData());
  final TextEditingController _depositAmountController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Deposit Money'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  const Text("Enter amount to deposit:"),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    controller: _depositAmountController,
                    decoration: const InputDecoration(
                      hintText: 'Enter amount',
                    ),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.green[900],
                ),
                child: Text(
                  'Close',
                  style: TextStyle(color: Colors.green[900]),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.green[900],
                ),
                child: Text(
                  'Deposit',
                  style: TextStyle(color: Colors.green[900]),
                ),
                onPressed: () async {
                  // ignore: avoid_print
                  print(_depositAmountController.text);
                  await userData.checkUserConnection();
                  if (_depositAmountController.text != '' &&
                      userData.user_id.value != "" &&
                      userData.userConnection.value == true) {
                    var k = await BackendRequests().addBalanceToUserDashboard(
                        userData.user_id.value,
                        _depositAmountController.text,
                        (userData.current_balance.value +
                                int.parse(_depositAmountController.text))
                            .toString());
                    if (k == true) {
                      userData.current_balance.value =
                          userData.current_balance.value +
                              int.parse(_depositAmountController.text);
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              'Deposited ${_depositAmountController.text}')));
                    }
                    Get.back();
                  }
                },
              ),
            ],
          );
        },
      );
    }

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
                () => userData.playingAsGuest.value == false
                    ? SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: SizedBox(
                                  width: 400,
                                  child: InkWell(
                                    mouseCursor:
                                        MaterialStateMouseCursor.clickable,
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                                        bottom: BorderSide(
                                            width: 1, color: Colors.white))),
                                alignment: Alignment.center,
                                width: 400,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Expanded(
                                        flex: 1,
                                        child: Icon(
                                          Icons.wallet,
                                          color: Colors.white,
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: TextButton(
                                          onPressed: () {
                                            showMyDialog();
                                          },
                                          child: const Text(
                                            'Deposit Wallet',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Rs.${userData.deposit_amount.value}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1, color: Colors.white))),
                                alignment: Alignment.center,
                                width: 400,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                          'Game Wallet',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            'Rs.${userData.current_balance.value}',
                                            maxLines: 1,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1, color: Colors.white))),
                                alignment: Alignment.center,
                                width: 400,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                              color: Colors.white,
                                              fontSize: 20),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            'Rs.${userData.current_demo_balance.value}',
                                            maxLines: 1,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1, color: Colors.white))),
                                alignment: Alignment.center,
                                width: 400,
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                              color: Colors.white,
                                              fontSize: 20),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Rs.0',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ))
                                  ],
                                ),
                              ),
                            ]),
                      )
                    : SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: SizedBox(
                                  width: 400,
                                  child: InkWell(
                                    mouseCursor:
                                        MaterialStateMouseCursor.clickable,
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                              const Divider(
                                color: Colors.white,
                              ),
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1, color: Colors.white))),
                                alignment: Alignment.center,
                                width: 400,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                              color: Colors.white,
                                              fontSize: 20),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            'Rs.${userData.current_demo_balance.value}',
                                            maxLines: 1,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ))
                                  ],
                                ),
                              )
                            ]),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
