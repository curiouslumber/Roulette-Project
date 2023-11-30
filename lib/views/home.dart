import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roulette_project/backend/loginhandler.dart';
import 'package:roulette_project/backend/requests.dart';
import 'package:roulette_project/backend/sharedpreferences.dart';
import 'package:roulette_project/backend/user_data.dart';
import 'package:roulette_project/components/game_header.dart';
import 'package:roulette_project/main.dart';
import 'package:roulette_project/views/menu.dart';
import 'package:roulette_project/views/user/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  UserData userData = Get.put(UserData());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: userData.checkUserConnection(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: Colors.green[900],
            body: const Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.data == true) {
          return FutureBuilder(
              future: SharedPreferencesManager.isLoggedIn(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Scaffold(
                    backgroundColor: Colors.green[900],
                    body: const Center(child: CircularProgressIndicator()),
                  );
                } else if (snapshot.data == true) {
                  return FutureBuilder(
                    future: SharedPreferencesManager.getEmail(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Scaffold(
                          backgroundColor: Colors.green[900],
                          body:
                              const Center(child: CircularProgressIndicator()),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return FutureBuilder(
                            future: BackendRequests()
                                .checkPassword(snapshot.data.toString()),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Scaffold(
                                  backgroundColor: Colors.green[900],
                                  body: const Center(
                                      child: CircularProgressIndicator()),
                                );
                              } else if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                var k = snapshot.data;
                                userData.user_id.value =
                                    k!['user_id'].toString();
                                userData.user_name.value = k['name'];
                                userData.user_email.value = k['email'];

                                DateTime now = DateTime.now();
                                var date = now.toString().split(' ')[0];
                                var time = now.toString().split(' ')[1];
                                time = time[0] +
                                    time[1] +
                                    time[2] +
                                    time[3] +
                                    time[4] +
                                    time[5] +
                                    time[6] +
                                    time[7];

                                return FutureBuilder(
                                  future: BackendRequests().updateActiveUser(
                                      k['user_id'].toString(), date, time),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      userData.active_user.value = true;
                                      userData.playingAsGuest.value = false;

                                      return FutureBuilder(
                                        future: BackendRequests()
                                            .getUserDashboard(userData
                                                .user_id.value
                                                .toString()),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return Scaffold(
                                              backgroundColor:
                                                  Colors.green[900],
                                              body: const Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                            );
                                          } else if (snapshot.connectionState ==
                                              ConnectionState.done) {
                                            return HomePage(userData: userData);
                                          } else {
                                            return const Center(
                                                child: Text('Error'));
                                          }
                                        },
                                      );
                                    } else {
                                      return const Center(child: Text('Error'));
                                    }
                                  },
                                );
                              } else if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Scaffold(
                                  backgroundColor: Colors.green[900],
                                  body: const Center(
                                      child: CircularProgressIndicator()),
                                );
                              } else {
                                return const Center(child: Text('Error'));
                              }
                            });
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Scaffold(
                          backgroundColor: Colors.green[900],
                          body:
                              const Center(child: CircularProgressIndicator()),
                        );
                      } else {
                        return const Center(child: Text('Error'));
                      }
                    },
                  );
                } else if (snapshot.data == false) {
                  return FutureBuilder(
                    future: SharedPreferencesManager.isPlayingAsGuest(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Scaffold(
                          backgroundColor: Colors.green[900],
                          body:
                              const Center(child: CircularProgressIndicator()),
                        );
                      } else if (snapshot.data == true) {
                        userData.playingAsGuest.value = true;
                        return HomePage(userData: userData);
                      } else if (snapshot.data == false) {
                        return FutureBuilder(
                            future: LoginHandler().checkUserLoginStatus(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Scaffold(
                                  backgroundColor: Colors.green[900],
                                  body: const Center(
                                      child: CircularProgressIndicator()),
                                );
                              } else if (snapshot.data == true) {
                                return FutureBuilder(
                                  future: SharedPreferencesManager.getUserId(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Scaffold(
                                        backgroundColor: Colors.green[900],
                                        body: const Center(
                                            child: CircularProgressIndicator()),
                                      );
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      userData.user_id.value =
                                          snapshot.data.toString();

                                      DateTime now = DateTime.now();
                                      var date = now.toString().split(' ')[0];
                                      var time = now.toString().split(' ')[1];
                                      time = time[0] +
                                          time[1] +
                                          time[2] +
                                          time[3] +
                                          time[4] +
                                          time[5] +
                                          time[6] +
                                          time[7];

                                      return FutureBuilder(
                                        future: BackendRequests()
                                            .updateActiveUser(
                                                snapshot.data.toString(),
                                                date,
                                                time),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          } else if (snapshot.connectionState ==
                                              ConnectionState.done) {
                                            userData.active_user.value = true;
                                            userData.playingAsGuest.value =
                                                false;
                                            return HomePage(userData: userData);
                                          } else {
                                            return const Center(
                                                child: Text('Error'));
                                          }
                                        },
                                      );
                                    } else {
                                      return const Center(child: Text('Error'));
                                    }
                                  },
                                );
                              } else if (snapshot.data == false) {
                                return const Login();
                              } else {
                                return const Center(
                                  child: Text('Error'),
                                );
                              }
                            });
                      } else {
                        return const Center(child: Text('Error'));
                      }
                    },
                  );
                } else {
                  return const Center(
                    child: Text('Error'),
                  );
                }
              });
        } else if (snapshot.data == false) {
          // No internet
          userData.userConnection.value = false;
          return FutureBuilder(
              future: SharedPreferencesManager.isPlayingAsGuest(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.data == true) {
                  userData.playingAsGuest.value = true;
                  return HomePage(
                    userData: userData,
                  );
                } else if (snapshot.data == false) {
                  return FutureBuilder(
                      future: SharedPreferencesManager.playingAsGuestUser(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Scaffold(
                            backgroundColor: Colors.green[900],
                            body: const Center(
                                child: CircularProgressIndicator()),
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          userData.playingAsGuest.value = true;
                          return HomePage(
                            userData: userData,
                          );
                        } else {
                          return const Center(child: Text('Error'));
                        }
                      });
                } else {
                  return const Center(child: Text('Error'));
                }
              });
        } else {
          return const Center(
            child: Text('No internet connection'),
          );
        }
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.userData,
  });

  final UserData userData;

  @override
  Widget build(BuildContext context) {
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
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Internet connection established')));
                      Get.offAll(MyApp());
                    } else {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
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
                            style: TextStyle(color: Colors.white, fontSize: 25),
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
                                          color: Colors.white, fontSize: 20),
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
  }
}
