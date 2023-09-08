import 'dart:ui';
import 'package:adventure/pages/details/utils/blurr_clip_path.dart';
import 'package:adventure/pages/details/utils/constants.dart';
import 'package:adventure/theme/colors.dart';
import 'package:flutter/material.dart';

class BlurredContainer extends StatelessWidget {
  const BlurredContainer(
      {super.key, required this.value, required this.height});
  final double height;
  final double value;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: TweenAnimationBuilder(
        duration: ANIMATION_DURATION,
        tween: Tween<double>(begin: 0.0, end: height),
        builder: (_, double val, __) => ClipPath(
          clipper: WavesPattern(animationOffset: val),
          child: AnimatedContainer(
            duration: ANIMATION_DURATION,
            width: double.infinity,
            height: value,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: getSurfaceColor(context, opacity: 0.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
