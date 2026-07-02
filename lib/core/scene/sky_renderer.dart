import 'package:flutter/material.dart';

import '../weather/day_phase_helper.dart';
import '../weather/weather_scene_type.dart';

import 'scene_manager.dart';

class SkyRenderer extends StatelessWidget {

  final Widget child;

  final WeatherSceneType scene;

  const SkyRenderer({

    super.key,

    required this.child,

    required this.scene,

  });

  @override
  Widget build(BuildContext context) {

    final phase =

    DayPhaseHelper.fromHour(

      DateTime.now().hour,

    );

    return SceneManager(

      scene: scene,

      phase: phase,

      child: child,

    );

  }

}