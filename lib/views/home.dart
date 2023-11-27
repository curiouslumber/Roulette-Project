import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:roulette_project/backend/loginhandler.dart';
import 'package:roulette_project/backend/user_data.dart';
import 'package:roulette_project/components/game_header.dart';
import 'package:roulette_project/views/menu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  UserData userData = Get.put(UserData());

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(320, 534));
    return FutureBuilder(
      future: userData.checkUserConnection(),
      builder: (context, snapshot) {
        print(snapshot.data);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.data == true) {
          return FutureBuilder(
              future: LoginHandler().checkUserLoginStatus(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.data == true) {
                  print(snapshot.data);
                  userData.playingAsGuest.value = false;
                  return Obx(
                    () => Scaffold(
                        body: Column(children: [
                      GameHeader(),
                      userData.userConnection.value == false
                          ? Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () async {
                                  await userData.checkUserConnection();
                                  if (userData.userConnection.value == true) {
                                    // ignore: use_build_context_synchronously
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Internet connection established')));
                                  } else {
                                    // ignore: use_build_context_synchronously
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'No internet connection')));
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  color: Colors.grey,
                                  child: const Text(
                                    'Not connected to the internet. Tap to Refresh',
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      Expanded(
                        flex: 14,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.green[900]),
                          child: Container(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10, top: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white, width: 1)),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    const Row(
                                      children: [
                                        Text(
                                          'Casino Games',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 30),
                                    Row(
                                      children: [
                                        const SizedBox(width: 20),
                                        Center(
                                          child: InkWell(
                                            mouseCursor:
                                                SystemMouseCursors.click,
                                            child: Container(
                                              padding: const EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 62, 184, 70),
                                                      width: 1)),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 120,
                                                    width: 120,
                                                    child: Image.asset(
                                                        'assets/images/wheel.png'),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  const Text(
                                                    'Roulette Game',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  )
                                                ],
                                              ),
                                            ),
                                            onTap: () {
                                              Get.to(
                                                  () => const RouletteMenu());
                                            },
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ])),
                  );
                } else if (snapshot.data == false) {
                  userData.playingAsGuest.value = true;
                  return Obx(
                    () => Scaffold(
                        body: Column(children: [
                      GameHeader(),
                      userData.userConnection.value == false
                          ? Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () async {
                                  await userData.checkUserConnection();
                                  if (userData.userConnection.value == true) {
                                    // ignore: use_build_context_synchronously
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Internet connection established')));
                                  } else {
                                    // ignore: use_build_context_synchronously
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'No internet connection')));
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  color: Colors.grey,
                                  child: const Text(
                                    'Not connected to the internet. Tap to Refresh',
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      Expanded(
                        flex: 14,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.green[900]),
                          child: Container(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10, top: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white, width: 1)),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    const Row(
                                      children: [
                                        Text(
                                          'Casino Games',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 30),
                                    Row(
                                      children: [
                                        const SizedBox(width: 20),
                                        Center(
                                          child: InkWell(
                                            mouseCursor:
                                                SystemMouseCursors.click,
                                            child: Container(
                                              padding: const EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 62, 184, 70),
                                                      width: 1)),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 120,
                                                    width: 120,
                                                    child: Image.asset(
                                                        'assets/images/wheel.png'),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  const Text(
                                                    'Roulette Game',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  )
                                                ],
                                              ),
                                            ),
                                            onTap: () {
                                              Get.to(
                                                  () => const RouletteMenu());
                                            },
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ])),
                  );
                } else {
                  return const Center(
                    child: Text('Error'),
                  );
                }
              });
        } else if (snapshot.data == false) {
          userData.userConnection.value = false;
          return Obx(
            () => Scaffold(
                body: Column(children: [
              GameHeader(),
              userData.userConnection.value == false
                  ? Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () async {
                          await userData.checkUserConnection();
                          if (userData.userConnection.value == true) {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Internet connection established')));
                          } else {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('No internet connection')));
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.grey,
                          child: const Text(
                            'Not connected to the internet. Tap to Refresh',
                          ),
                        ),
                      ),
                    )
                  : Container(),
              Expanded(
                flex: 14,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.green[900]),
                  child: Container(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10, top: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1)),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Text(
                                  'Casino Games',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Row(
                              children: [
                                const SizedBox(width: 20),
                                Center(
                                  child: InkWell(
                                    mouseCursor: SystemMouseCursors.click,
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 62, 184, 70),
                                              width: 1)),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 120,
                                            width: 120,
                                            child: Image.asset(
                                                'assets/images/wheel.png'),
                                          ),
                                          const SizedBox(height: 20),
                                          const Text(
                                            'Roulette Game',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          )
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      Get.to(() => const RouletteMenu());
                                    },
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                ),
              ),
            ])),
          );
        } else {
          return const Center(
            child: Text('No internet connection'),
          );
        }
      },
    );
  }
}
