import 'package:flutter/material.dart';

import 'glass_container.dart';

class WeatherMetricCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const WeatherMetricCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.white70,
            size: 28,
          ),
          const SizedBox(height: 18),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}