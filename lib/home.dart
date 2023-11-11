import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roulette_project/game_deck.dart';
import 'components/game_header.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Scaffold(
      body: Column(children: [
        GameHeader(),
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.green[900]),
            child: Container(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 10, top: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1)),
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
                                    color:
                                        const Color.fromARGB(255, 62, 184, 70),
                                    width: 1)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 120,
                                  width: 120,
                                  child: Image.asset('assets/images/wheel.png'),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const GameDeck()),
                            );
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
