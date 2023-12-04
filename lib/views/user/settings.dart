import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:roulette_project/backend/requests.dart';
import 'package:roulette_project/backend/sharedpreferences.dart';
import 'package:roulette_project/backend/userdatacontroller.dart';
import 'package:roulette_project/views/roulette/rouletteboardcontroller.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});
  final RouletteBoardController rouletteBoardController = Get.find();
  final UserData userData = Get.find();
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
        body: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(25),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.white, width: 1)),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: SizedBox(
                  width: 200,
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
                            'Settings',
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () async {
                  await SharedPreferencesManager.setDemoBalance(1500);
                  rouletteBoardController.userBalance.value = 1500;
                  userData.current_demo_balance.value = 1500;
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Demo balance reset to 1500')));
                },
                child: Text(
                  "Reset Demo Balance",
                  style: TextStyle(color: Colors.green[900]),
                ),
              ),
              const SizedBox(height: 10),
              userData.playingAsGuest.value == false
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () async {
                        await showMyDialog();
                      },
                      child: Text(
                        "Deposit Money",
                        style: TextStyle(color: Colors.green[900]),
                      ),
                    )
                  : Container(),
            ]),
          ),
        ));
  }
}
