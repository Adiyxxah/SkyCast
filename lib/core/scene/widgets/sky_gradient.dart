import 'package:flutter/material.dart';

import '../../weather/weather_scene_type.dart';

class SkyGradient extends StatelessWidget {
  final WeatherSceneType scene;

  const SkyGradient({
    super.key,
    required this.scene,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: _colors(scene),
        ),
      ),
    );
  }

  List<Color> _colors(WeatherSceneType scene) {
    switch (scene) {
      case WeatherSceneType.sunny:
        return const [
          Color(0xff67B7FF),
          Color(0xffBEE7FF),
        ];

      case WeatherSceneType.cloudy:
        return const [
          Color(0xff5E6B87),
          Color(0xff95A2B8),
        ];

      case WeatherSceneType.rain:
        return const [
          Color(0xff273B66),
          Color(0xff566D9B),
        ];

      case WeatherSceneType.storm:
        return const [
          Color(0xff101521),
          Color(0xff293852),
        ];

      case WeatherSceneType.snow:
        return const [
          Color(0xffBFD8F6),
          Color(0xffEDF7FF),
        ];

      case WeatherSceneType.fog:
        return const [
          Color(0xff8E9AA8),
          Color(0xffC8CFD8),
        ];

      case WeatherSceneType.night:
        return const [
          Color(0xff030712),
          Color(0xff182540),
        ];
    }
  }
}