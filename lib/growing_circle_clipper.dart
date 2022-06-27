import 'package:flutter/material.dart';

class GrowingCircleClipper extends CustomClipper<Path> {
  GrowingCircleClipper({required this.radius, required this.offset});
  final double radius;
  final Offset offset;

  @override
  Path getClip(Size size) {
    var path = Path()
      ..addOval(
        Rect.fromCircle(center: offset, radius: radius),
      )
      ..addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height))
      ..fillType = PathFillType.evenOdd;

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
