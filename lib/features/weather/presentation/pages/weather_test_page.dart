import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/weather_provider.dart';

class WeatherTestPage extends ConsumerWidget {
  const WeatherTestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(weatherProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather API Test"),
      ),
      body: weather.when(
        data: (data) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("City : ${data.city}"),
                Text("Condition : ${data.condition}"),
                Text("Temperature : ${data.temperature}°C"),
                Text("Feels Like : ${data.feelsLike}°C"),
                Text("Humidity : ${data.humidity}%"),
                Text("Wind : ${data.windSpeed} km/h"),
                Text("Visibility : ${data.visibility} km"),
                Text("UV Index : ${data.uvIndex}"),
              ],
            ),
          );
        },
        loading: () =>
        const Center(child: CircularProgressIndicator()),
        error: (e, s) =>
            Center(child: Text(e.toString())),
      ),
    );
  }
}