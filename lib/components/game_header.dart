import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roulette_project/backend/user_data.dart';
import 'package:roulette_project/user/login.dart';
import '../user/profile.dart';

enum MenuItem { profile, logout }

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
                userData.user_name.value == ""
                    ? 'User'
                    : userData.user_name.value,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          PopupMenuButton<MenuItem>(
            color: Colors.white,
            onSelected: (value) {
              if (value == MenuItem.profile) {
                Get.to(() => const Profile());
              } else if (value == MenuItem.logout) {
                Get.offAll(() => Login());
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItem>>[
              const PopupMenuItem<MenuItem>(
                value: MenuItem.profile,
                child: Text('Profile'),
              ),
              const PopupMenuItem<MenuItem>(
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
