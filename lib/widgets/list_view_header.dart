/*
 동작 & 루틴 조회하기 페이지에 들어가는 헤더 위젯
 */
import 'package:flutter/material.dart';

class ListViewHeader extends StatelessWidget {
  final String title, subText;
  final Function searchFunc;

  ListViewHeader(this.title, this.subText, this.searchFunc);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height, width = screenSize.width;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(icon: Icon(Icons.keyboard_backspace), onPressed: () {}),
          Padding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontSize: 0.036 * height, fontWeight: FontWeight.bold)),
                Text(subText),
              ],
            ),
            padding: EdgeInsets.fromLTRB(0.03 * width, 0, 0, 0),
          ),
        ],
      ),
      color: Colors.white,
      padding: EdgeInsets.all(0.03 * width),
    );
  }
}