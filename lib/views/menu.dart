import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:roulette_project/components/game_header.dart';
import 'package:roulette_project/roulette_board/rouettegameview.dart';
import 'package:roulette_project/user/wallet.dart';

class RouletteMenu extends StatelessWidget {
  const RouletteMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        } else {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
          ]);
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
                  Get.to(() => RoulettePage());
                },
                child: Text('Play Game',
                    style: TextStyle(color: Colors.green[900])),
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
                child:
                    Text('Wallet', style: TextStyle(color: Colors.green[900])),
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
      },
    );
  }
}
