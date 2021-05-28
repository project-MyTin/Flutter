/*
 동작 & 루틴 조회하기 페이지에 들어가는 헤더 위젯
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitlePageHeader extends StatelessWidget {
  final String title, subText;
  final Function searchFunc;

  TitlePageHeader(this.title, this.subText, this.searchFunc);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 0.034 * Get.height)),
          Text(subText, style: TextStyle(color: Colors.black.withOpacity(0.3))),
        ],
      ),
      color: Colors.white,
      padding:
          EdgeInsets.fromLTRB(0.04 * Get.width, 0.022 * Get.height, 0, 0.03 * Get.height),
    );
  }
}
