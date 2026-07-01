import 'package:flutter/material.dart';
import '../../../../core/weather/weather_scene_type.dart';
enum WeatherSceneType {
  sunny,
  cloudy,
  rain,
  storm,
  snow,
  fog,
  night,
}

class SceneManager {

  static LinearGradient gradient(WeatherSceneType scene) {

    switch (scene) {

      case WeatherSceneType.sunny:
        return const LinearGradient(
          colors: [
            Color(0xff4FACFE),
            Color(0xff00F2FE),
          ],
        );

      case WeatherSceneType.cloudy:
        return const LinearGradient(
          colors: [
            Color(0xff667db6),
            Color(0xff485563),
          ],
        );

      case WeatherSceneType.rain:
        return const LinearGradient(
          colors: [
            Color(0xff314755),
            Color(0xff26A0DA),
          ],
        );

      case WeatherSceneType.storm:
        return const LinearGradient(
          colors: [
            Color(0xff232526),
            Color(0xff414345),
          ],
        );

      case WeatherSceneType.snow:
        return const LinearGradient(
          colors: [
            Color(0xffE6DADA),
            Color(0xff274046),
          ],
        );

      case WeatherSceneType.fog:
        return const LinearGradient(
          colors: [
            Color(0xffBDC3C7),
            Color(0xff2C3E50),
          ],
        );

      case WeatherSceneType.night:
        return const LinearGradient(
          colors: [
            Color(0xff141E30),
            Color(0xff243B55),
          ],
        );

    }
  }
}