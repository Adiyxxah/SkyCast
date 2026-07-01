import 'package:flutter/material.dart';
import 'floating_clouds.dart';
class AnimatedGradientBackground extends StatefulWidget {
  final Widget child;

  const AnimatedGradientBackground({
    super.key,
    required this.child,
  });

  @override
  State<AnimatedGradientBackground> createState() =>
      _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState
    extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {

  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, _) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.lerp(
                  const Color(0xff2B5876),
                  const Color(0xff4E4376),
                  controller.value,
                )!,
                Color.lerp(
                  const Color(0xff4E4376),
                  const Color(0xff1E3C72),
                  controller.value,
                )!,
              ],
            ),
          ),
          child: Stack(
            children: [
              const FloatingClouds(),
              widget.child,
            ],
          ),
        );
      },
    );
  }
}