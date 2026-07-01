class WeatherModel {
  final String city;
  final String condition;
  final double temperature;
  final double feelsLike;
  final int humidity;
  final double windSpeed;
  final double visibility;
  final int uvIndex;

  const WeatherModel({
    required this.city,
    required this.condition,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.visibility,
    required this.uvIndex,
  });
}