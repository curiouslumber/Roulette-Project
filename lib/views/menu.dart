import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:roulette_project/backend/sharedpreferences.dart';
import 'package:roulette_project/backend/user_data.dart';
import 'package:roulette_project/components/game_header.dart';
import 'package:roulette_project/views/roulette/rouettegameview.dart';
import 'package:roulette_project/user/wallet.dart';
import 'package:sizer/sizer.dart';

class RouletteMenu extends StatelessWidget {
  RouletteMenu({super.key});

  final UserData userData = Get.find();

  @override
  Widget build(BuildContext context) {
    userData.checkUserConnection();
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.landscape) {
        SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      }
      return Scaffold(
        backgroundColor: Colors.green[900],
        body: Column(
          children: [
            GameHeader(),
            const Spacer(),
            const Text(
              'Roulette Game',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            const Spacer(),
            Image.asset(
              'assets/images/wheel.png',
              scale: 2.4,
            ),
            const Spacer(),
            MaterialButton(
              color: Colors.white,
              onPressed: () {
                if (userData.userConnection.value == false) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('No internet connection. Play Demo.')));
                  return;
                }
                Get.to(() => Sizer(builder: (context, orientation, deviceType) {
                      if (orientation == Orientation.portrait) {
                        SystemChrome.setPreferredOrientations([
                          DeviceOrientation.landscapeLeft,
                          DeviceOrientation.landscapeRight
                        ]);
                      }
                      // ignore: prefer_const_constructors
                      return RoulettePage();
                    }));
              },
              child:
                  Text('Play Game', style: TextStyle(color: Colors.green[900])),
            ),
            MaterialButton(
              color: Colors.white,
              onPressed: () async {
                userData.gameType.value = 'demo';

                if (userData.gameType.value == "demo") {
                  if (await SharedPreferencesManager.getDemoBalance() == null) {
                    await SharedPreferencesManager.setDemoBalance(1500);
                  }
                  userData.current_demo_balance.value =
                      (await SharedPreferencesManager.getDemoBalance())!;
                }
                Get.to(() => Sizer(builder: (context, orientation, deviceType) {
                      if (orientation == Orientation.portrait) {
                        SystemChrome.setPreferredOrientations([
                          DeviceOrientation.landscapeLeft,
                          DeviceOrientation.landscapeRight
                        ]);
                      }

                      // ignore: prefer_const_constructors
                      return RoulettePage();
                    }));
              },
              child: Text(
                'Play Demo Game',
                style: TextStyle(color: Colors.green[900]),
              ),
            ),
            MaterialButton(
              color: Colors.white,
              onPressed: () {
                Get.to(() => Wallet());
              },
              child: Text('Wallet', style: TextStyle(color: Colors.green[900])),
            ),
            MaterialButton(
              color: Colors.white,
              onPressed: () {},
              child: Text('How to Play',
                  style: TextStyle(color: Colors.green[900])),
            ),
            const Spacer()
          ],
        ),
      );
    });
  }
}
