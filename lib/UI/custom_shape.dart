import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  final List<double> start;
  final List<double> end;
  final List<double> firstControlPoints;
  final List<double> firstEndPoints;
  final List<double> secondControlPoints;
  final List<double> secondEndPoints;

  CustomShapeClipper({
    this.start,
    this.end,
    this.firstControlPoints,
    this.firstEndPoints,
    this.secondControlPoints,
    this.secondEndPoints,
  });

  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(start[0], size.height - start[1]);

    // first curve [0.35, 70] [0.65, 100]
    var firstControlPoint = Offset(size.width * firstControlPoints[0],
        size.height * firstControlPoints[1]);
    var firstEndPoint =
        Offset(size.width * firstEndPoints[0], size.height * firstEndPoints[1]);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );
    // second curve [0.9, 0.38], [1.1, *0.4]
    var secondControlPoint = Offset(size.width * secondControlPoints[0], size.height * secondControlPoints[1]);
    var secondEndPoint = Offset(size.width * secondEndPoints[0], size.height * secondEndPoints[1]);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width + end[0], end[1]);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
