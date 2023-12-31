import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:roulette_project/backend/requests.dart';
import 'package:roulette_project/backend/sharedpreferences.dart';
import 'package:roulette_project/backend/userdatacontroller.dart';
import 'package:roulette_project/components/game_header.dart';
import 'package:roulette_project/main.dart';
import 'package:roulette_project/views/roulette/rouettegameview.dart';
import 'package:roulette_project/views/roulette/rouletteboardcontroller.dart';
import 'package:roulette_project/views/user/wallet.dart';

class RouletteMenu extends StatefulWidget {
  const RouletteMenu({super.key});

  @override
  State<RouletteMenu> createState() {
    return RouletteMenuState();
  }
}

class RouletteMenuState extends State<RouletteMenu> {
  final UserData userData = Get.find();
  final RouletteBoardController rouletteBoardController = Get.find();

  @override
  void initState() {
    super.initState();
    rouletteBoardController.gameId.value = "";
    if (userData.userConnection.value == true) {
      BackendRequests().getUserDashboard(userData.user_id.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

      return Scaffold(
        backgroundColor: Colors.green[900],
        body: Column(children: [
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
            color: (userData.userConnection.value == false ||
                    userData.playingAsGuest.value == true)
                ? Colors.grey
                : Colors.white,
            onPressed: () async {
              await userData.checkUserConnection();
              if (userData.userConnection.value == true &&
                  userData.playingAsGuest.value == true) {
                userData.playingAsGuest.value = false;
                await SharedPreferencesManager.notPlayingAsGuestUser();
                //ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Connected.'),
                  ),
                );
                return Get.offAll(() => const MyApp());
              } else if (userData.userConnection.value == false ||
                  userData.playingAsGuest.value == true) {
                //ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Internet Connection Required.'),
                  ),
                );
                userData.playingAsGuest.value = true;
                await SharedPreferencesManager.playingAsGuestUser();
                return Get.offAll(() => const MyApp());
              }

              await BackendRequests().getUserDashboard(userData.user_id.value);

              if (userData.current_balance.value <= 0) {
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Insufficient Balance. Deposit Money.'),
                  ),
                );
                return;
              } else {
                var k = await BackendRequests().getNumberOfGames();

                if (k!['number_of_games'] == null) {
                  rouletteBoardController.gameId.value = "1";
                } else {
                  rouletteBoardController.gameId.value =
                      (k['number_of_games'] + 1).toString();
                }

                rouletteBoardController.resetAll();

                userData.number_of_games_played.value =
                    userData.number_of_games_played.value + 1;
                BackendRequests().updateUserDashboard(
                    userData.user_id.value,
                    userData.number_of_games_played.value.toString(),
                    userData.number_of_games_won.value.toString(),
                    userData.number_of_games_lost.value.toString(),
                    userData.winningAmount.value.toString(),
                    userData.total_amount_won.value.toString(),
                    userData.total_amount_lost.value.toString());

                rouletteBoardController.gameStatus.value = 'started';
                await BackendRequests().updateGame(
                    rouletteBoardController.gameId.value,
                    userData.user_id.value,
                    rouletteBoardController.gameStatus.value,
                    rouletteBoardController.moveNum.value.toString(),
                    rouletteBoardController.totalBetAmount.value.toString(),
                    "0",
                    "");
                userData.gameType.value = 'real';
                Get.to(() => const RoulettePage());
              }
            },
            child:
                Text('Play Game', style: TextStyle(color: Colors.green[900])),
          ),
          MaterialButton(
            color: Colors.white,
            onPressed: () async {
              rouletteBoardController.resetAll();
              userData.gameType.value = 'demo';
              userData.number_of_demo_games_played.value =
                  (await SharedPreferencesManager
                      .getNumberOfDemoGamesPlayed())!;
              userData.number_of_demo_games_played.value =
                  userData.number_of_demo_games_played.value + 1;
              await SharedPreferencesManager.setNumberOfDemoGamesPlayed(
                  userData.number_of_demo_games_played.value);
              userData.total_amount_won_in_demo_games.value =
                  (await (SharedPreferencesManager
                      .getTotalAmountWonInDemoGames()))!;
              userData.total_amount_lost_in_demo_games.value =
                  (await (SharedPreferencesManager
                      .getTotalAmountLostInDemoGames()))!;
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
        ]),
      );
    });
  }
}
