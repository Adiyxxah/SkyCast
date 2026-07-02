import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {

  static const String baseUrl =
      "https://api.open-meteo.com/v1/forecast";

  Future<Map<String, dynamic>> getWeather({

    required double latitude,
    required double longitude,

  }) async {

    final url =
        "$baseUrl"
        "?latitude=$latitude"
        "&longitude=$longitude"
        "&current="
        "temperature_2m,"
        "relative_humidity_2m,"
        "apparent_temperature,"
        "weather_code,"
        "wind_speed_10m"
        "&hourly="
        "temperature_2m,"
        "weather_code"

        "&daily="
        "weather_code,"
        "temperature_2m_max,"
        "temperature_2m_min,"
        "sunrise,"
        "sunset"

        "&forecast_days=7"
        "&timezone=auto";

    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {

      final json = jsonDecode(response.body);


      return json;
    }

    throw Exception(
      "Unable to load weather",
    );
  }
}