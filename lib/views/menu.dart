import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roulette_project/backend/user_data.dart';
import 'package:roulette_project/components/game_header.dart';
import 'package:roulette_project/views/roulette/rouettegameview.dart';
import 'package:roulette_project/user/wallet.dart';

class RouletteMenu extends StatelessWidget {
  RouletteMenu({super.key});

  final UserData userData = Get.find();

  @override
  Widget build(BuildContext context) {
    userData.checkUserConnection();
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
              Get.to(() => const RoulettePage());
            },
            child:
                Text('Play Game', style: TextStyle(color: Colors.green[900])),
          ),
          MaterialButton(
            color: Colors.white,
            onPressed: () async {
              userData.gameType.value = 'demo';

              Get.to(() => const RoulettePage());
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
            child:
                Text('How to Play', style: TextStyle(color: Colors.green[900])),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
