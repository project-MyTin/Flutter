/*
 이미지 링크(url)와 지름(diameter)을 입력받아, 원 모양 테두리로 이미지를 보여주는 위젯
 */
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
