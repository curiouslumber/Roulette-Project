import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roulette_project/backend/user_data.dart';
import 'package:roulette_project/components/game_header.dart';
import 'package:roulette_project/views/roulette/rouettegameview.dart';
import 'package:roulette_project/user/wallet.dart';

class RouletteMenu extends StatefulWidget {
  const RouletteMenu({super.key});

  @override
  State<RouletteMenu> createState() => _RouletteMenuState();
}

class _RouletteMenuState extends State<RouletteMenu> {
  final UserData userData = Get.find();

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.landscape) {
        SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      }

      userData.checkUserConnection();
      ScreenUtil.configure(designSize: const Size(320, 534));
      return Scaffold(
        backgroundColor: Colors.green[900],
        body: userData.loading.value == false
            ? Column(children: [
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
                  child: Text('Play Game',
                      style: TextStyle(color: Colors.green[900])),
                ),
                MaterialButton(
                  color: Colors.white,
                  onPressed: () {
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
                  child: Text('Wallet',
                      style: TextStyle(color: Colors.green[900])),
                ),
                MaterialButton(
                  color: Colors.white,
                  onPressed: () {},
                  child: Text('How to Play',
                      style: TextStyle(color: Colors.green[900])),
                ),
                const Spacer()
              ])
            : const Center(
                child: CircularProgressIndicator(
                color: Colors.white,
              )),
      );
    });
  }
}
