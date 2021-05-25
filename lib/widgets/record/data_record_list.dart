import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataRecordList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color.fromRGBO(0x45, 0xAF, 0xBE, 1),
          height: Get.height * 0.06,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("2021년 5월"),
              Text("루틴"),
            ],
          ),
        )
      ],
    );
  }
}
