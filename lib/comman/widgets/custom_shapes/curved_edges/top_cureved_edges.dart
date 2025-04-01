import 'package:flutter/material.dart';

class TopCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final firstCureve = Offset(0, size.height - 20);
    final lastCureve = Offset(30, size.height - 20);
    path.quadraticBezierTo(
        firstCureve.dx, firstCureve.dy, lastCureve.dx, lastCureve.dy);

    final secondFirstCurve = Offset(0, size.height - 20);
    final secondLastCurve = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(secondFirstCurve.dx, secondFirstCurve.dy,
        secondLastCurve.dx, secondLastCurve.dy);

    final thirdFirstCureve = Offset(size.width, size.height - 20);
    final thirdLastCureve = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdFirstCureve.dx, thirdFirstCureve.dy,
        thirdLastCureve.dx, thirdLastCureve.dy);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
