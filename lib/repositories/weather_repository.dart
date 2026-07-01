import '../models/weather_model.dart';
import '../services/api_service.dart';
import '../services/location_service.dart';

class WeatherRepository {

  final ApiService api = ApiService();

  final LocationService locationService =
  LocationService();

  Future<WeatherModel> getWeather() async {

    final position =
    await locationService.getCurrentLocation();

    final city =
    await locationService.getCityName(
      position.latitude,
      position.longitude,
    );

    final json =
    await api.getWeather(
      latitude: position.latitude,
      longitude: position.longitude,
    );

    return WeatherModel.fromJson(
      json,
      city,
    );
  }
}