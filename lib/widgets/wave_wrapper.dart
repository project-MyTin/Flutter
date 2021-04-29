import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WaveWrapper extends StatelessWidget {
  final Container child;
  final double width, height;
  final List<double> opacityList;
  final List<Color> colorList;

  WaveWrapper(
      {this.child, this.height, this.width, this.opacityList, this.colorList});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (double opacity in opacityList)
          ClipPath(
              clipper: WaveClipper([1 / 4, 2 / 4, 3 / 4, 1], 30),
              child: NullContainer(height, width, colorList, opacity)),
        ClipPath(
            clipper: WaveClipper([1 / 4, 2 / 4, 3 / 4, 1], 30),
            child: child),
      ],
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  final List<double> widthPoints;
  final int waveSize;

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

class NullContainer extends StatelessWidget {
  final double width, height, opacity;
  final List<Color> colorList;

  NullContainer(this.width, this.height, this.colorList, this.opacity);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            colorList[0].withOpacity(opacity),
            colorList[1].withOpacity(opacity)
          ],
        ),
      ),
    );
  }
}
