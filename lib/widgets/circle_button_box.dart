import 'package:flutter/material.dart';

class CircleButtonBox extends StatelessWidget {
  final String text;

  CircleButtonBox(this.text);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return Container(
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(fontSize: 0.022 * height),
      ),
      width: 0.24 * width,
      height: 0.24 * width,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black12),
    );
  }
}
