import 'package:flutter/cupertino.dart';

class TapClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0.0, size.height * 0.54);

    path.lineTo(size.width * 0.38, size.height * 0.54); //
    path.lineTo(size.width * 0.38, size.height * 0.46);
    path.lineTo(size.width * 0.27, size.height * 0.46);

    path.lineTo(size.width * 0.27, size.height * 0.40);
    path.lineTo(size.width * 0.56, size.height * 0.40);

    path.lineTo(size.width * 0.56, size.height * 0.46);
    path.lineTo(size.width * 0.44, size.height * 0.46);
    path.lineTo(size.width * 0.44, size.height * 0.54);
    path.lineTo(size.width * 0.85, size.height * 0.54);
    path.quadraticBezierTo(
        size.width * 0.95, size.height * 0.54, size.width, size.height); //
    path.lineTo(size.width * 0.74, size.height);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.76,
        size.width * 0.70, size.height * 0.76);
    path.lineTo(0.0, size.height * 0.76);
    path.close();
    path.addOval(Rect.fromCircle(
        center: Offset(size.width * 0.27, size.height * 0.43),
        radius: size.width * 0.05));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width * 0.56, size.height * 0.43),
        radius: size.width * 0.05));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
