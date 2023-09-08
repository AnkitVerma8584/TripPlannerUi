import 'package:adventure/pages/details/utils/constants.dart';
import 'package:flutter/material.dart';

class WavesPattern extends CustomClipper<Path> {
  final double animationOffset;

  WavesPattern({super.reclip, required this.animationOffset});

  @override
  Path getClip(Size size) {
    final x = size.width;
    final y = size.height;
    final centerX = x / 2;

    const waveOffset = 25;

    Offset topLeft = Offset(0, MIN_HEIGHT - animationOffset);
    Offset topRight = Offset(x, MIN_HEIGHT - animationOffset);
    Offset bottomLeft = Offset(0, y);
    Offset bottomRight = Offset(x, y);

    Offset start =
        Offset(centerX - waveOffset * 4, MIN_HEIGHT - animationOffset);
    Offset ref11 = Offset(centerX - waveOffset, MIN_HEIGHT - animationOffset);
    Offset ref12 = Offset(centerX - waveOffset, 0);

    Offset center = Offset(centerX, 0);
    Offset ref21 = Offset(centerX + waveOffset, 0);
    Offset ref22 = Offset(centerX + waveOffset, MIN_HEIGHT - animationOffset);
    Offset end = Offset(centerX + waveOffset * 4, MIN_HEIGHT - animationOffset);

    Path path = Path();
    path.moveTo(topLeft.dx, topLeft.dy);
    path.lineTo(start.dx, start.dy);
    path.cubicTo(ref11.dx, ref11.dy, ref12.dx, ref12.dy, center.dx, center.dy);
    path.cubicTo(ref21.dx, ref21.dy, ref22.dx, ref22.dy, end.dx, end.dy);
    path.lineTo(topRight.dx, topRight.dy);
    path.lineTo(bottomRight.dx, bottomRight.dy);
    path.lineTo(bottomLeft.dx, bottomLeft.dy);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
