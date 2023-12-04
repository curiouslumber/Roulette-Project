import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roulette_project/backend/sharedpreferences.dart';
import 'package:roulette_project/backend/userdatacontroller.dart';
import 'package:roulette_project/views/user/login.dart';
import 'package:roulette_project/views/home.dart';
import 'package:roulette_project/views/roulette/rouletteboardcontroller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(SafeArea(
          child: GetMaterialApp(
              builder: (context, child) {
                ScreenUtil.init(context, designSize: const Size(320, 534));
                return child!;
              },
              debugShowCheckedModeBanner: false,
              home: const MyApp())));
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final UserData userData = Get.put(UserData());
  final RouletteBoardController rouletteBoardController =
      Get.put(RouletteBoardController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // try getting demo balance from shared preferences
        future: SharedPreferencesManager.getDemoBalance(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              backgroundColor: Colors.green[900],
              body: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          } else if (snapshot.data == null) {
            // if demo balance is not set, set it to 1500
            return FutureBuilder(
                future: SharedPreferencesManager.setDemoBalance(1500),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    userData.current_demo_balance.value = 1500;
                    return FutureBuilder(
                        // check if shared preferences default values are initialized
                        future: SharedPreferencesManager.isInitialized(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Scaffold(
                              backgroundColor: Colors.green[900],
                              body: const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          } else if (snapshot.data == false) {
                            // if not, initialize them
                            return FutureBuilder(
                                future:
                                    SharedPreferencesManager.initializeValues(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return const Login();
                                  } else if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Scaffold(
                                      backgroundColor: Colors.green[900],
                                      body: const Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Scaffold(
                                      backgroundColor: Colors.green[900],
                                      body: const Center(
                                        child: Text('Error'),
                                      ),
                                    );
                                  }
                                });
                          } else if (snapshot.data == true) {
                            // if initialized, go to home
                            return const Home();
                          } else {
                            return Scaffold(
                                backgroundColor: Colors.green[900],
                                body: const Center(
                                  child: Text('Error'),
                                ));
                          }
                        });
                  } else {
                    return Scaffold(
                        backgroundColor: Colors.green[900],
                        body: const Center(
                          child: Text('Error'),
                        ));
                  }
                });
          } else if (snapshot.data != null) {
            // if demo balance exists, set it to the value from shared preferences
            userData.current_demo_balance.value = snapshot.data!;

            return FutureBuilder(
                future: SharedPreferencesManager.isInitialized(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // check if shared preferences default values are initialized
                    return Scaffold(
                      backgroundColor: Colors.green[900],
                      body: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    );
                  } else if (snapshot.data == false) {
                    // if not, initialize them
                    return FutureBuilder(
                        future: SharedPreferencesManager.initializeValues(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return const Login();
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Scaffold(
                              backgroundColor: Colors.green[900],
                              body: const Center(
                                  child: CircularProgressIndicator()),
                            );
                          } else {
                            return Scaffold(
                              backgroundColor: Colors.green[900],
                              body: const Center(
                                child: Text('Error'),
                              ),
                            );
                          }
                        });
                  } else if (snapshot.data == true) {
                    // if initialized, go to home
                    return const Home();
                  } else {
                    return Scaffold(
                        backgroundColor: Colors.green[900],
                        body: const Center(
                          child: Text('Error'),
                        ));
                  }
                });
          } else {
            return Scaffold(
                backgroundColor: Colors.green[900],
                body: const Center(
                  child: Text('Error'),
                ));
          }
        });
  }
}
