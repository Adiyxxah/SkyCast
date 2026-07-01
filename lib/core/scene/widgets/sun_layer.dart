import 'package:flutter/material.dart';

class SunLayer extends StatefulWidget {
  const SunLayer({super.key});

  @override
  State<SunLayer> createState() => _SunLayerState();
}

class _SunLayerState extends State<SunLayer>
    with SingleTickerProviderStateMixin {

  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
      lowerBound: 0.96,
      upperBound: 1.04,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Positioned(
      top: 60,
      right: 80,

      child: ScaleTransition(
        scale: controller,

        child: Container(
          width: 180,
          height: 180,

          decoration: BoxDecoration(
            shape: BoxShape.circle,

            gradient: const RadialGradient(
              colors: [
                Color(0xFFFFF6BF),
                Color(0xFFFFD54F),
                Colors.transparent,
              ],
            ),

            boxShadow: [
              BoxShadow(
                color: Colors.yellow.withValues(alpha: 0.45),
                blurRadius: 120,
                spreadRadius: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}