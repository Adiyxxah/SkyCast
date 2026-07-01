import 'package:flutter/material.dart';

import '../../../../core/scene/sky_renderer.dart';
import '../widgets/sidebar.dart';
import '../widgets/top_bar.dart';
import '../widgets/weather_hero.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SkyRenderer(
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
                        child: const Column(
                          children: [
                            WeatherHero(),
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
  }
}