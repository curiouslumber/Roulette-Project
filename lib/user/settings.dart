import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roulette_project/backend/sharedpreferences.dart';
import 'package:roulette_project/backend/user_data.dart';
import 'package:roulette_project/views/roulette/rouletteboardcontroller.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});
  final RouletteBoardController rouletteBoardController = Get.find();
  final UserData userData = Get.find();
  @override
  Widget build(BuildContext context) {
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
                  ))
            ]),
          ),
        ));
  }
}
