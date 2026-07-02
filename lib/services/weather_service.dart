import '../core/weather/weather_scene_type.dart';
import '../models/weather_model.dart';

class WeatherService {
  static const WeatherModel currentWeather = WeatherModel(
    city: "Bhubaneswar",
    condition: "Heavy Rain",
    scene: WeatherSceneType.rain,
    temperature: 27,
    feelsLike: 30,
    humidity: 84,
    windSpeed: 14,
    visibility: 9.5,
    uvIndex: 3,
    hourlyForecast: [],
    dailyForecast: [],
  );
}