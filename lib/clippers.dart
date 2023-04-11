import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var width = size.width;
    var height = size.height;
    var centerWidth = width / 2;
    var centerHeight = height / 2;

    Path path = Path();
    path.lineTo(width * 0.38, 0);
    path.quadraticBezierTo(
        centerWidth, centerHeight - height * 0.01, width * 0.62, 0);
    path.lineTo(width, 0);
    path.quadraticBezierTo(width - width * 0.11, height * 0.5, width, height);
    path.lineTo(0, height);
    path.quadraticBezierTo(width - width * 0.9, height * 0.5, 0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
