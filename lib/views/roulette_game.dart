import 'dart:math';
import 'package:flutter/material.dart';

class RouletteGame extends StatefulWidget {
  const RouletteGame({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RouletteGameState createState() => _RouletteGameState();
}

class _RouletteGameState extends State<RouletteGame>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _result = 0;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
    _animation.addListener(() {
      setState(() {
        _result = (_animation.value * 36).floor();
      });
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isPlaying = false;
        });
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Result'),
              content: Text('You got $_result'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _play() {
    if (_isPlaying) return;
    _isPlaying = true;
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Roulette Wheel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: pi * 2 / 37 * _result,
              child: Image.asset(
                'assets/images/wheel.png',
                width: 300,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _play,
              child: const Text('Spin the Wheel'),
            ),
          ],
        ),
      ),
    );
  }
}
