import '../models/weather_model.dart';

class WeatherService {

  static WeatherModel currentWeather = const WeatherModel(
    city: "Bhubaneswar",
    condition: "Heavy Rain",
    temperature: 27,
    feelsLike: 30,
    humidity: 84,
    windSpeed: 14,
    visibility: 9.5,
    uvIndex: 3,
  );

}