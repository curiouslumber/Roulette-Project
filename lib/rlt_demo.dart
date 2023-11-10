import 'dart:math';
import 'package:flutter/material.dart';

class RouletteTable extends StatefulWidget {
  const RouletteTable({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RouletteTableState createState() => _RouletteTableState();
}

class _RouletteTableState extends State<RouletteTable> {
  int _selectedNumber = 0;
  final List<String> _redNumbers = [
    '1',
    '3',
    '5',
    '7',
    '9',
    '12',
    '14',
    '16',
    '18',
    '19',
    '21',
    '23',
    '25',
    '27',
    '30',
    '32',
    '34',
    '36'
  ];
  final List<String> _blackNumbers = [
    '2',
    '4',
    '6',
    '8',
    '10',
    '11',
    '13',
    '15',
    '17',
    '20',
    '22',
    '24',
    '26',
    '28',
    '29',
    '31',
    '33',
    '35'
  ];

  void _spinWheel() {
    Random random = Random();
    setState(() {
      _selectedNumber = random.nextInt(37);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Roulette Table',
          style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16.0),
        Container(
          width: 300.0,
          height: 300.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.black),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              for (int i = 0; i < 37; i++)
                Positioned(
                  left: 150.0,
                  top: 0.0,
                  child: Transform.rotate(
                    angle: i * pi / 18,
                    child: Container(
                      width: 120.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: _redNumbers.contains(i.toString())
                            ? Colors.red
                            : _blackNumbers.contains(i.toString())
                                ? Colors.black
                                : Colors.green,
                        border: Border.all(width: 2.0, color: Colors.white),
                      ),
                      child: Center(
                        child: Text(
                          i == 0 ? '0' : i.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                ),
              Positioned(
                left: 140.0,
                top: 140.0,
                child: InkWell(
                  onTap: _spinWheel,
                  child: Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        Text(
          'Selected number: $_selectedNumber',
          style: const TextStyle(fontSize: 20.0),
        ),
      ],
    );
  }
}
