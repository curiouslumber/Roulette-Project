import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:roulette_project/components/game_header.dart';
import 'package:roulette_project/roulette/rouettegameview.dart';
import 'package:roulette_project/user/wallet.dart';
import 'package:sizer/sizer.dart';

class RouletteMenu extends StatelessWidget {
  const RouletteMenu({super.key});

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
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
