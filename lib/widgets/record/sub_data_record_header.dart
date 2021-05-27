import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubDataRecordHeader extends StatelessWidget {
  final String date, contentName;

  SubDataRecordHeader({this.date, this.contentName});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      height: Get.height * 0.06,
      child: Row(
        children: [
          SizedBox(width: Get.width * 0.07),
          Text(date, style: TextStyle(color: Colors.white)),
          Spacer(),
          Text(contentName, style: TextStyle(color: Colors.white, fontSize: Get.height * 0.02)),
          SizedBox(width: Get.width * 0.06),
        ],
      ),
    );
  }
}
