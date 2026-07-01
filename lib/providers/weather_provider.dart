import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/weather_model.dart';
import '../repositories/weather_repository.dart';

final weatherRepositoryProvider =
Provider<WeatherRepository>((ref) {
  return WeatherRepository();
});

final weatherProvider =
FutureProvider<WeatherModel>((ref) async {
  final repository =
  ref.read(weatherRepositoryProvider);

  return repository.getWeather();
});