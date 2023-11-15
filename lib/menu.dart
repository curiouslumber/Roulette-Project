import 'package:flutter/material.dart';
import 'package:roulette_project/components/game_header.dart';

class RouletteMenu extends StatelessWidget {
  const RouletteMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
      body: Column(
        children: [
          GameHeader(),
          const Text(
            'Roulette Game',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          Image.asset(
            'assets/images/wheel.png',
            scale: 2,
          )
        ],
      ),
    );
  }
}
