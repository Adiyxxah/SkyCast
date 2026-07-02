class DailyWeather {
  final DateTime date;
  final double maxTemperature;
  final double minTemperature;
  final int weatherCode;
  final DateTime sunrise;
  final DateTime sunset;

  const DailyWeather({
    required this.date,
    required this.maxTemperature,
    required this.minTemperature,
    required this.weatherCode,
    required this.sunrise,
    required this.sunset,
  });

  factory DailyWeather.fromJson({
    required String date,
    required num maxTemperature,
    required num minTemperature,
    required int weatherCode,
    required String sunrise,
    required String sunset,
  }) {
    return DailyWeather(
      date: DateTime.parse(date),
      maxTemperature: maxTemperature.toDouble(),
      minTemperature: minTemperature.toDouble(),
      weatherCode: weatherCode,
      sunrise: DateTime.parse(sunrise),
      sunset: DateTime.parse(sunset),
    );
  }
}