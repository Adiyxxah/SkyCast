import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/weather/weather_icon_mapper.dart';
import '../../../../providers/weather_provider.dart';
class HourlyForecast extends ConsumerWidget {
  const HourlyForecast({super.key});

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {
    final weatherAsync =
    ref.watch(weatherProvider);


    return weatherAsync.when(

      data: (weather) {

        final hours = weather.hourlyForecast.take(24).toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "24 Hour Forecast",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 130,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,

                itemCount: hours.length,

                separatorBuilder: (context, index) =>
                const SizedBox(width: 14),

                itemBuilder: (context, index) {

                  final hour = hours[index];

                  return Container(
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Text(
                          "${hour.time.hour}:00",
                          style: const TextStyle(
                            color: Colors.white70,
                          ),
                        ),

                        Text(
                          WeatherIconMapper.getIcon(hour.weatherCode),
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                        ),

                        Text(
                          "${hour.temperature.toInt()}°",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },

      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),

      error: (error, stack) => Center(
        child: Text(
          error.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),

    );
  }
}