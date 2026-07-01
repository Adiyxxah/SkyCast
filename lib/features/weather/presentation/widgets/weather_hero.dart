import 'package:flutter/material.dart';
import '../../../../core/widgets/weather_metric_card.dart';
import '../../../../services/weather_service.dart';

class WeatherHero extends StatelessWidget {
  const WeatherHero({super.key});

  @override
  Widget build(BuildContext context) {
    final weather = WeatherService.currentWeather;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff4F8CFF),
            Color(0xff263B67),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [

              const Icon(
                Icons.location_on,
                color: Colors.white,
              ),

              const SizedBox(width: 8),

              Text(
                weather.city,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              const Text(
                "Updated just now",
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          Text(
            "${weather.temperature.toInt()}°",
            style: const TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          Text(
            weather.condition,
            style: const TextStyle(
              fontSize: 28,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 40),

          Wrap(
            spacing: 18,
            runSpacing: 18,
            children: [

              SizedBox(
                width: 150,
                child: WeatherMetricCard(
                  icon: Icons.thermostat,
                  title: "Feels Like",
                  value: "${weather.feelsLike}°",
                ),
              ),

              SizedBox(
                width: 150,
                child: WeatherMetricCard(
                  icon: Icons.water_drop,
                  title: "Humidity",
                  value: "${weather.humidity}%",
                ),
              ),

              SizedBox(
                width: 150,
                child: WeatherMetricCard(
                  icon: Icons.air,
                  title: "Wind",
                  value: "${weather.windSpeed} km/h",
                ),
              ),

              SizedBox(
                width: 150,
                child: WeatherMetricCard(
                  icon: Icons.visibility,
                  title: "Visibility",
                  value: "${weather.visibility} km",
                ),
              ),

              SizedBox(
                width: 150,
                child: WeatherMetricCard(
                  icon: Icons.wb_sunny,
                  title: "UV Index",
                  value: weather.uvIndex.toString(),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}