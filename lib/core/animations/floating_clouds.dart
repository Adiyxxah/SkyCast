import 'package:flutter/material.dart';

class FloatingClouds extends StatefulWidget {
  const FloatingClouds({super.key});

  @override
  State<FloatingClouds> createState() => _FloatingCloudsState();
}

class _FloatingCloudsState extends State<FloatingClouds>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 25),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget cloud(double top, double size, double opacity, double speedFactor) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_,_) {
        final screenWidth = MediaQuery.of(context).size.width;

        final x =
            (_controller.value * screenWidth * speedFactor) - (size * 2);

        return Positioned(
          top: top,
          left: x,
          child: Opacity(
            opacity: opacity,
            child: Icon(
              Icons.cloud,
              size: size,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          cloud(40, 120, .10, 1.0),
          cloud(140, 90, .08, .75),
          cloud(260, 150, .06, .55),
        ],
      ),
    );
  }
}