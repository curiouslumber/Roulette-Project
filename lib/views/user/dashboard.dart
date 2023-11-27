import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roulette_project/backend/user_data.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final UserData userData = Get.put(UserData());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.green[900],
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: SingleChildScrollView(
                  child: Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Center(
                            child: Text('Dashboard',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 23)),
                          ),
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Current Balance : ${userData.current_balance.value}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Number of games played : ${userData.number_of_games_played.value}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Number of games won : ${userData.number_of_games_won.value}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Number of games lost: ${userData.number_of_games_lost.value}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Total amount won: ${userData.total_amount_won.value}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Total amount lost: ${userData.total_amount_lost.value}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18)),
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
                          child: Text(
                              'Current Demo Balance : ${userData.current_demo_balance.value}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Number of demo games played : ${userData.number_of_demo_games_played.value}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Number of demo games won : ${userData.number_of_demo_games_won.value}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Number of demo games lost : ${userData.number_of_demo_games_lost.value}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Total amount won in demo games: ${userData.total_amount_won_in_demo_games.value}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Total amount lost in demo games: ${userData.total_amount_lost_in_demo_games.value}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
