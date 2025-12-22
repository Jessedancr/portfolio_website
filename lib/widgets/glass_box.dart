import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio_website/core/constants.dart';

class GlassBox extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final double? sigmaX;
  final double? sigmaY;
  final double? opacity1;
  final double? opacity2;
  const GlassBox({
    super.key,
    this.width,
    this.height,
    this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(0)),
    this.sigmaX = 2,
    this.sigmaY = 2,
    this.opacity1 = 0.1,
    this.opacity2 = 0.3,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius!,
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            // Blur effect
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: sigmaX!, sigmaY: sigmaY!),
              child: Container(),
            ),

            // Gradient effect
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    context.colorScheme.primary.withOpacity(opacity1!),
                    context.colorScheme.primary.withOpacity(opacity2!),
                  ],
                ),
              ),
            ),

            // Child
            child ?? SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
