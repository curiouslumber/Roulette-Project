import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roulette_project/backend/requests.dart';
import 'package:roulette_project/backend/user_data.dart';
import 'package:roulette_project/views/user/dashboard.dart';
import 'package:roulette_project/views/user/settings.dart';
import 'package:roulette_project/views/user/wallet.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final UserData userData = Get.put(UserData());

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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
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
                          'Profile',
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
            SizedBox(
                height: 100,
                width: 100,
                child: Image.asset('assets/images/avatar.jpg')),
            const SizedBox(height: 10),
            Obx(
              () => Text(
                userData.playingAsGuest.value == true
                    ? 'Guest'
                    : (userData.user_name.value == ""
                        ? 'UserName'
                        : userData.user_name.value),
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.white))),
              alignment: Alignment.center,
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.dashboard,
                        color: Colors.white,
                      )),
                  Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () async {
                          await BackendRequests()
                              .getUserDashboard(userData.user_id.value);
                          Get.to(() => Dashboard());
                        },
                        child: const Text(
                          'Dashboard',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.white))),
              alignment: Alignment.center,
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.settings,
                        color: Colors.white,
                      )),
                  Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => SettingsPage());
                        },
                        child: const Text(
                          'Settings',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.white))),
              alignment: Alignment.center,
              width: 200,
              child: InkWell(
                onTap: () async {
                  await BackendRequests()
                      .getUserDashboard(userData.user_id.value);
                  Get.to(() => Wallet());
                },
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
                          'Wallet',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ))
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
