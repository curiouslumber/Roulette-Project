import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:roulette_project/providers/game_provider.dart';
import 'package:roulette_project/providers/game_score_provider.dart';
import 'package:roulette_project/providers/table_select_provider.dart';
import 'package:roulette_project/user/signup.dart';

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
      return const MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: GetMaterialApp(debugShowCheckedModeBanner: false, home: SignUp()),
    );
  }
}
