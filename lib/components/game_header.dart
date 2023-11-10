import 'package:flutter/material.dart';
import 'package:roulette_project/user/login.dart';
import 'package:roulette_project/user/signup.dart';

import '../user/profile.dart';

enum MenuItem { profile, logout }

class GameHeader extends StatelessWidget {
  const GameHeader({super.key});

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
          Container(
            margin: const EdgeInsets.only(right: 65),
            child: const Text(
              'User',
              style: TextStyle(color: Colors.white),
            ),
          ),
          PopupMenuButton<MenuItem>(
            color: Colors.white,
            onSelected: (value) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  if (value == MenuItem.profile) {
                    return const Profile();
                  } else if (value == MenuItem.logout) {
                    return const SignUp();
                  }
                  return const Login();
                }),
              );
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
