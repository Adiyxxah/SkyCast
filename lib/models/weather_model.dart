import '../core/weather/weather_scene_type.dart';
import 'hourly_weather.dart';
import 'daily_weather.dart';
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
  final List<HourlyWeather> hourlyForecast;
  final List<DailyWeather> dailyForecast;

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
    required this.hourlyForecast,
    required this.dailyForecast,
  });

  factory WeatherModel.fromJson(
      Map<String, dynamic> json,
      String city,
      ) {
    final current = json["current"];
    final hourly = json["hourly"];
    final daily = json["daily"];

    final weatherCode = current["weather_code"] ?? 0;

    // Temporary empty list (we'll fill this in the next step)
    final List<HourlyWeather> hourlyForecast = [];

    for (int i = 0; i < 24; i++) {
      hourlyForecast.add(
        HourlyWeather.fromJson(
          time: hourly["time"][i],
          temperature: hourly["temperature_2m"][i],
          weatherCode: hourly["weather_code"][i],
        ),
      );
    }
    final List<DailyWeather> dailyForecast = [];

    for (int i = 0; i < 7; i++) {

      dailyForecast.add(

          DailyWeather.fromJson(
            date: daily["time"][i],
            maxTemperature: daily["temperature_2m_max"][i],
            minTemperature: daily["temperature_2m_min"][i],
            weatherCode: daily["weather_code"][i],
            sunrise: daily["sunrise"][i],
            sunset: daily["sunset"][i],
          )

      );

    }

    return WeatherModel(
      city: city,

      condition: _condition(weatherCode),

      scene: _scene(weatherCode),

      temperature:
      (current["temperature_2m"] as num).toDouble(),

      feelsLike:
      (current["apparent_temperature"] as num).toDouble(),

      humidity:
      (current["relative_humidity_2m"] as num).toInt(),

      windSpeed:
      (current["wind_speed_10m"] as num).toDouble(),

      visibility: 10.0,

      uvIndex: 5,

      hourlyForecast: hourlyForecast,
      dailyForecast: dailyForecast,
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