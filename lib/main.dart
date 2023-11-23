import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:roulette_project/backend/sharedpreferences.dart';
import 'package:roulette_project/backend/user_data.dart';
import 'package:roulette_project/views/home.dart';
import 'package:roulette_project/views/roulette/rouletteboardcontroller.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) =>
      runApp(Sizer(builder: (context, orientation, deviceType) => MyApp())));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final UserData userData = Get.put(UserData());
  final RouletteBoardController rouletteBoardController =
      Get.put(RouletteBoardController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder<int?>(
          future: SharedPreferencesManager.getDemoBalance(),
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.data == null) {
              return FutureBuilder(
                  future: SharedPreferencesManager.setDemoBalance(1500),
                  builder: (context, snapshot) {
                    userData.current_demo_balance.value = 1500;
                    rouletteBoardController.userBalance.value = 1500;
                    return const Home();
                  });
            }
            userData.current_demo_balance.value = snapshot.data!;
            rouletteBoardController.userBalance.value = snapshot.data!;
            return const Home();
          },
        ),
      ),
    );
  }
}
