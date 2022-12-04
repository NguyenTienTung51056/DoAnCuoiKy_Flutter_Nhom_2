import 'package:flutter/material.dart';

class CustomShape extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    final path = Path();
    path.moveTo(0, height);
    path.lineTo(0, height/3);
    path.quadraticBezierTo(
        width/2,
        0,
        width,
        height/3
    );
    path.lineTo(width, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

  
}