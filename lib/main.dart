import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:roulette_project/backend/loginhandler.dart';
import 'package:roulette_project/backend/user_data.dart';
import 'package:roulette_project/home.dart';
import 'package:roulette_project/providers/game_provider.dart';
import 'package:roulette_project/providers/game_score_provider.dart';
import 'package:roulette_project/providers/table_select_provider.dart';
import 'package:roulette_project/user/login.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (ccontext) => TableSelectProvider(),
      ),
      ChangeNotifierProvider(
        create: (ccontext) => GameProvider(),
      ),
      ChangeNotifierProvider(
        create: (ccontext) => GameScoreProvider(),
      ),
    ],
    builder: (context, child) {
      return MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final UserData userData = Get.put(UserData());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: FutureBuilder(
            future: userData.checkUserConnection(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.none) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error ${snapshot.error}'),
                );
              }

              return FutureBuilder(
                  future: LoginHandler().checkUserLoginStatus(),
                  builder: (context, AsyncSnapshot<bool> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return const Center(child: CircularProgressIndicator());
                      case ConnectionState.waiting:
                        return const Center(child: CircularProgressIndicator());
                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          return Center(
                            child: Text('Error ${snapshot.error}'),
                          );
                        } else {
                          bool isLoggedIn = snapshot.data ?? false;
                          if (isLoggedIn == true) {
                            return const Home();
                          } else {
                            return Login();
                          }
                        }
                      case ConnectionState.active:
                        return const Center(child: CircularProgressIndicator());
                    }
                  });
            },
          )),
    );
  }
}
