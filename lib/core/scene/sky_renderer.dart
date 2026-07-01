import 'package:flutter/material.dart';

import '../animations/animated_gradient_background.dart';
import '../animations/floating_clouds.dart';

class SkyRenderer extends StatelessWidget {
  final Widget child;

  const SkyRenderer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedGradientBackground(
      child: Stack(
        children: [

          //----------------------------------
          // Cloud Layer
          //----------------------------------

          const FloatingClouds(),

          //----------------------------------
          // Dashboard UI
          //----------------------------------

          child,
        ],
      ),
    );
  }
}