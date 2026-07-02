import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/scene/sky_renderer.dart';
import '../../../../providers/weather_provider.dart';
import '../widgets/daily_forecast.dart';
import '../widgets/hourly_forecast.dart';
import '../widgets/sidebar.dart';
import '../widgets/sunrise_sunset_card.dart';
import '../widgets/top_bar.dart';
import '../widgets/weather_hero.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {
    final weatherAsync = ref.watch(weatherProvider);

    return weatherAsync.when(
      data: (weather) {
        return Scaffold(
          body: SkyRenderer(
            scene: weather.scene,
            child: SafeArea(
              child: Row(
                children: [
                  // Left Sidebar
                  const Sidebar(),

                  // Right Content
                  Expanded(
                    child: Column(
                      children: [
                        const TopBar(),

                        Expanded(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                WeatherHero(),

                                SizedBox(height: 30),

                                HourlyForecast(),

                                SizedBox(height: 30),

                                DailyForecast(),

                                SizedBox(height: 30),

                                SunriseSunsetCard(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },

      loading: () {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },

      error: (error, stackTrace) {
        return Scaffold(
          body: Center(
            child: Text(
              error.toString(),
            ),
          ),
        );
      },
    );
  }
}