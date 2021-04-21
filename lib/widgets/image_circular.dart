import 'package:flutter/material.dart';

class ImageCircular extends StatelessWidget {
  final String url;
  final double diameter;

  ImageCircular({this.url, this.diameter});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(
            url,
          ),
          fit: BoxFit.cover,
        ),
      ),
      width: diameter,
      height: diameter,
    );
  }
}
