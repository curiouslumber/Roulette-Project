import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roulette_project/backend/requests.dart';
import 'package:roulette_project/backend/sharedpreferences.dart';
import 'package:roulette_project/backend/userdatacontroller.dart';
import 'package:roulette_project/main.dart';
import 'package:roulette_project/views/user/login.dart';
import '../views/user/profile.dart';

enum MenuItem { profile, logout, login, none }

class GameHeader extends StatelessWidget {
  GameHeader({super.key});

  final UserData userData = Get.put(UserData());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Row(
        children: [
          const Expanded(
            flex: 1,
            child: Text(
              "Roulette Wheel V1.0",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
              height: 30,
              width: 30,
              child: Image.asset('assets/images/avatar.jpg')),
          const SizedBox(width: 10),
          Obx(
            () => Container(
              margin: const EdgeInsets.only(right: 65),
              child: Text(
                userData.playingAsGuest.value
                    ? 'Guest'
                    : (userData.user_name.value == ""
                        ? 'User'
                        : userData.user_name.value),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          PopupMenuButton<MenuItem>(
            color: Colors.white,
            onSelected: (value) async {
              if (value == MenuItem.profile) {
                Get.to(() => Profile());
              } else if (value == MenuItem.logout) {
                BackendRequests backendRequests = BackendRequests();
                var res = await backendRequests
                    .checkPassword(userData.user_email.value);
                var deleteActiveUsers = await backendRequests
                    .deleteActiveUser(res!['user_id'].toString());
                userData.user_email.value = "";
                userData.user_name.value = "";
                userData.user_id.value = "";
                userData.user_password.value = "";
                userData.active_user.value = false;
                userData.playingAsGuest.value = false;
                await SharedPreferencesManager.notPlayingAsGuestUser();
                await SharedPreferencesManager.logoutUser();
                if (deleteActiveUsers) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Successfully logged out"),
                    ),
                  );
                  Get.offAll(() => MyApp());
                  print("Successfully deleted active user");
                } else {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Error logging out. Try again"),
                    ),
                  );
                }
              } else if (value == MenuItem.login) {
                Get.to(() => Login());
              } else if (value == MenuItem.none) {
                print("None");
              } else {
                print("Error");
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItem>>[
              const PopupMenuItem<MenuItem>(
                value: MenuItem.profile,
                child: Text('Profile'),
              ),
              userData.playingAsGuest.value
                  ? const PopupMenuItem<MenuItem>(
                      value: MenuItem.login,
                      child: Text('Login'),
                    )
                  : const PopupMenuItem<MenuItem>(
                      value: MenuItem.logout,
                      child: Text('Logout'),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
