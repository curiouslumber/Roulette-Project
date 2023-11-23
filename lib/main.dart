import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roulette_project/backend/sharedpreferences.dart';
import 'package:roulette_project/backend/user_data.dart';
import 'package:roulette_project/views/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final UserData userData = Get.put(UserData());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder<int?>(
          future: SharedPreferencesManager.getDemoBalance(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return FutureBuilder(
                  future: SharedPreferencesManager.setDemoBalance(1500),
                  builder: (context, snapshot) => const Home());
            }
            return const Home();
          },
        ),
      ),
    );
  }
}
