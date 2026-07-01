import '../core/weather/weather_scene_type.dart';

class WeatherModel {
  final String city;

  final String condition;

  final WeatherSceneType scene;

  final double temperature;

  final double feelsLike;

  final int humidity;

  final double windSpeed;

  final double visibility;

  final int uvIndex;

  const WeatherModel({
    required this.city,
    required this.condition,
    required this.scene,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.visibility,
    required this.uvIndex,
  });

  factory WeatherModel.fromJson(
      Map<String, dynamic> json,
      String city,
      ) {
    final weatherCode = json["weather_code"] ?? 0;

    return WeatherModel(
      city: city,

      condition: _condition(weatherCode),

      scene: _scene(weatherCode),

      temperature:
      (json["temperature_2m"] as num).toDouble(),

      feelsLike:
      (json["apparent_temperature"] as num).toDouble(),

      humidity:
      (json["relative_humidity_2m"] as num).toInt(),

      windSpeed:
      (json["wind_speed_10m"] as num).toDouble(),

      visibility: 10.0,
      uvIndex: 5,
    );
  }

  static String _condition(int code) {
    switch (code) {
      case 0:
        return "Clear Sky";

      case 1:
      case 2:
      case 3:
        return "Partly Cloudy";

      case 45:
      case 48:
        return "Fog";

      case 51:
      case 53:
      case 55:
        return "Drizzle";

      case 61:
      case 63:
      case 65:
        return "Rain";

      case 71:
      case 73:
      case 75:
        return "Snow";

      case 95:
        return "Thunderstorm";

      default:
        return "Cloudy";
    }
  }

  static WeatherSceneType _scene(int code) {
    switch (code) {
      case 0:
        return WeatherSceneType.sunny;

      case 1:
      case 2:
      case 3:
        return WeatherSceneType.cloudy;

      case 45:
      case 48:
        return WeatherSceneType.fog;

      case 51:
      case 53:
      case 55:
      case 61:
      case 63:
      case 65:
        return WeatherSceneType.rain;

      case 71:
      case 73:
      case 75:
        return WeatherSceneType.snow;

      case 95:
      case 96:
      case 99:
        return WeatherSceneType.storm;

      default:
        return WeatherSceneType.cloudy;
    }
  }
}