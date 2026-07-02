class HourlyWeather {
  final DateTime time;
  final double temperature;
  final int weatherCode;

  const HourlyWeather({
    required this.time,
    required this.temperature,
    required this.weatherCode,
  });

  factory HourlyWeather.fromJson({
    required String time,
    required num temperature,
    required int weatherCode,
  }) {
    return HourlyWeather(
      time: DateTime.parse(time),
      temperature: temperature.toDouble(),
      weatherCode: weatherCode,
    );
  }
}