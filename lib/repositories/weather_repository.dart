import '../models/weather_model.dart';
import '../services/api_service.dart';

class WeatherRepository {

  final ApiService api =
  ApiService();

  Future<WeatherModel> getWeather() async {

    final json =
    await api.getWeather(

      latitude: 20.2961,
      longitude: 85.8245,

    );

    return WeatherModel.fromJson(
      json,
      "Bhubaneswar",
    );
  }
}