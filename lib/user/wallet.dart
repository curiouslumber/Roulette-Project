import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(25),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.white, width: 1)),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: 400,
                child: InkWell(
                  mouseCursor: MaterialStateMouseCursor.clickable,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Wallet',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.white))),
              alignment: Alignment.center,
              width: 400,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.wallet,
                        color: Colors.white,
                      )),
                  Expanded(
                      flex: 2,
                      child: Text(
                        'Deposit Wallet',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        'Rs.0',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.white))),
              alignment: Alignment.center,
              width: 400,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.wallet,
                        color: Colors.white,
                      )),
                  Expanded(
                      flex: 2,
                      child: Text(
                        'Game Wallet',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        'Rs.0',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.white))),
              alignment: Alignment.center,
              width: 400,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.wallet,
                        color: Colors.white,
                      )),
                  Expanded(
                      flex: 2,
                      child: Text(
                        'Demo Wallet',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        'Rs.0',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.white))),
              alignment: Alignment.center,
              width: 400,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.wallet,
                        color: Colors.white,
                      )),
                  Expanded(
                      flex: 2,
                      child: Text(
                        'Winning Wallet',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        'Rs.0',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ))
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
