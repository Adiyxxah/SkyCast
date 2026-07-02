import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/glass_container.dart';
import '../../../../providers/weather_provider.dart';

class SunriseSunsetCard extends ConsumerWidget {
  const SunriseSunsetCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsync = ref.watch(weatherProvider);

    return weatherAsync.when(
      data: (weather) {
        final today = weather.dailyForecast.first;

        String format(DateTime time) {
          final hour = time.hour > 12 ? time.hour - 12 : time.hour;
          final minute = time.minute.toString().padLeft(2, '0');
          final period = time.hour >= 12 ? "PM" : "AM";

          return "$hour:$minute $period";
        }

        return GlassContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "Sunrise & Sunset",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              Row(
                children: [

                  Expanded(
                    child: Column(
                      children: [

                        const Icon(
                          Icons.wb_sunny_outlined,
                          color: Colors.orange,
                          size: 34,
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          "Sunrise",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          format(today.sunrise),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Column(
                      children: [

                        const Icon(
                          Icons.nights_stay_outlined,
                          color: Colors.amber,
                          size: 34,
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          "Sunset",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          format(today.sunset),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}