import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/weather/weather_icon_mapper.dart';
import '../../../../providers/weather_provider.dart';

class DailyForecast extends ConsumerWidget {
  const DailyForecast({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final weatherAsync = ref.watch(weatherProvider);

    return weatherAsync.when(

      data: (weather) {

        final days = weather.dailyForecast;

        return Container(

          padding: const EdgeInsets.all(24),

          decoration: BoxDecoration(

            color: Colors.white.withValues(alpha: 0.08),

            borderRadius: BorderRadius.circular(28),

          ),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              const Text(

                "7-Day Forecast",

                style: TextStyle(

                  color: Colors.white,

                  fontSize: 22,

                  fontWeight: FontWeight.bold,

                ),

              ),

              const SizedBox(height: 20),

              ...days.map((day) {

                return Padding(

                  padding: const EdgeInsets.symmetric(vertical: 10),

                  child: Row(

                    children: [

                      SizedBox(

                        width: 80,

                        child: Text(

                          _weekday(day.date),

                          style: const TextStyle(

                            color: Colors.white,

                            fontSize: 16,

                          ),

                        ),

                      ),

                      Text(

                        WeatherIconMapper.getIcon(day.weatherCode),

                        style: const TextStyle(

                          fontSize: 28,

                        ),

                      ),

                      const Spacer(),

                      Text(

                        "${day.maxTemperature.toInt()}°",

                        style: const TextStyle(

                          color: Colors.white,

                          fontWeight: FontWeight.bold,

                          fontSize: 18,

                        ),

                      ),

                      const SizedBox(width: 15),

                      Text(

                        "${day.minTemperature.toInt()}°",

                        style: const TextStyle(

                          color: Colors.white54,

                          fontSize: 18,

                        ),

                      ),

                    ],

                  ),

                );

              }),

            ],

          ),

        );

      },

      loading: () => const Center(

        child: CircularProgressIndicator(),

      ),

      error: (e, _) => Center(

        child: Text(

          e.toString(),

          style: const TextStyle(color: Colors.white),

        ),

      ),

    );

  }

  String _weekday(DateTime date) {

    const names = [

      "Mon",

      "Tue",

      "Wed",

      "Thu",

      "Fri",

      "Sat",

      "Sun",

    ];

    return names[date.weekday - 1];

  }

}