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
              clipper: WaveClipper([
                [2/4 * width, height + 30],
                [3/4 * width, height - 30],
                [4/4 * width, height + 30],
              ]),
              child: NullContainer(height, width, colorList, opacity)),
        ClipPath(clipper: WaveClipper([
          [2/4 * width, height - 30],
          [3/4 * width, height + 30],
          [4/4 * width, height - 30],
        ]), child: child),
      ],
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  final List<List<double>> points;

  WaveClipper(this.points);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    for(int i = 0; i < points.length -1; i++) {
      path.quadraticBezierTo(points[i][0], points[i][1], points[i+1][0], points[i+1][1]);
    }
    path.lineTo(size.width, 0);
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
