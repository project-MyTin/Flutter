import 'package:flutter/material.dart';

class Wave extends StatelessWidget {
  final List<Color> colorList;
  final List<List<double>> points;
  final double height, width, waveHeight, waveWidth;
  final int startIndex;

  Wave(
      {this.colorList,
      this.points,
      this.waveHeight,
      this.waveWidth,
      this.height,
      this.width,
      this.startIndex});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipper(points, waveHeight, waveWidth, startIndex),
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
  final List<List<double>> points;
  final double waveHeight, waveWidth;
  final int index;

  WaveClipper(this.points, this.waveHeight, this.waveWidth, this.index);

  @override
  Path getClip(Size size) {
    final double width = size.width, height = size.height;
    final List<double> waveHeights = [
      height - waveHeight,
      height - waveHeight * 2,
      height - waveHeight,
      height
    ];

    Path path = Path();
    path.lineTo(0, waveHeights[index == 0 ? 3 : index - 1]);
    // path.quadraticBezierTo(width / 4, height - 80, width / 2, height - 40);
    // path.quadraticBezierTo(3 / 4 * width, height, width, height - 40);
    for (int i = 0; i / (4 * waveWidth) < 1; i += 2) {
      path.quadraticBezierTo(
        (i + 1) / 4 * waveWidth * width,
        waveHeights[(i + index) % 4],
        (i + 2) / 4 * waveWidth * width,
        waveHeights[(i + 1 + index) % 4],
      );
    }
    path.lineTo(width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
