import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roulette_project/backend/sharedpreferences.dart';
import 'package:roulette_project/backend/user_data.dart';
import 'package:roulette_project/views/home.dart';
import 'package:roulette_project/views/roulette/rouletteboardcontroller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(MyApp());
    },
  );
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
      initialBinding: BindingsBuilder(() {}),
      builder: (context, child) {
        ScreenUtil.init(context, designSize: const Size(320, 534));
        return child!;
      },
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<int?>(
        future: SharedPreferencesManager.getDemoBalance(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.data == null) {
            return FutureBuilder(
                future: SharedPreferencesManager.setDemoBalance(1500),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    rouletteBoardController.userBalance.value = 1500;
                    userData.current_demo_balance.value = 1500;
                    return const Home();
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Scaffold(
                      body: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return const Scaffold(
                      body: Center(
                        child: Text('Error'),
                      ),
                    );
                  }
                });
          } else {
            rouletteBoardController.userBalance.value = snapshot.data!;
            userData.current_demo_balance.value = snapshot.data!;
            return const Home();
          }
        },
      ),
    ));
  }
}
