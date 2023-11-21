import 'package:flutter/material.dart';

class WheelAnimation extends StatefulWidget {
  const WheelAnimation({super.key});

  @override
  State<WheelAnimation> createState() => WheelAnimationState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class WheelAnimationState extends State<WheelAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(period: const Duration(seconds: 2));
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RotationTransition(
          turns: _animation,
          child: Stack(children: [
            Positioned(
                child: Align(
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/wheel.png'))),
            const Positioned(
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Icon(Icons.place,
                        size: 40, color: Color.fromRGBO(241, 154, 100, 1))))
          ]),
        ),
      ),
    );
  }
}
