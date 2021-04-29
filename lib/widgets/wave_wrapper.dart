import 'package:flutter/material.dart';

class Wave extends StatelessWidget {
  final List<Color> colorList;
  final List<double> widthPoints;
  final double height, width, waveSize;

  Wave({this.colorList, this.widthPoints, this.waveSize, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipper(widthPoints, waveSize),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: colorList,
          ),
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  final List<double> widthPoints;
  final double waveSize;

  WaveClipper(this.widthPoints, this.waveSize);

  @override
  Path getClip(Size size) {
    double width = size.width, height = size.height;

    Path path = Path();
    path.lineTo(0, height);
    for (int i = 0; i < widthPoints.length - 1; i += 2) {
      path.quadraticBezierTo(
        widthPoints[i] * width,
        height + waveSize,
        widthPoints[i + 1] * width,
        height - waveSize,
      );
    }
    path.lineTo(width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
