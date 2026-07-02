import 'package:flutter/material.dart';

import '../weather/day_phase.dart';
import '../weather/weather_scene_type.dart';
import '../animations/animated_gradient_background.dart';
import '../animations/floating_clouds.dart';

class SceneManager extends StatelessWidget {
  final WeatherSceneType scene;
  final DayPhase phase;
  final Widget child;

  const SceneManager({
    super.key,
    required this.scene,
    required this.phase,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // We'll make this dynamic in the next sprint.
    // For now it simply renders the existing background.

    return AnimatedGradientBackground(
      child: Stack(
        children: [
          const FloatingClouds(),

          child,
        ],
      ),
    );
  }
}