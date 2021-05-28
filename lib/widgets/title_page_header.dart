/*
 동작 & 루틴 조회하기 페이지에 들어가는 헤더 위젯
 */
import 'package:flutter/material.dart';

class TitlePageHeader extends StatelessWidget {
  final String title, subText;
  final Function searchFunc;

  TitlePageHeader(this.title, this.subText, this.searchFunc);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height, width = screenSize.width;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 0.034 * height)),
          Text(subText, style: TextStyle(color: Colors.black.withOpacity(0.3))),
        ],
      ),
      color: Colors.white,
      padding:
          EdgeInsets.fromLTRB(0.04 * width, 0.03 * height, 0, 0.03 * height),
    );
  }
}
