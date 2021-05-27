import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataRecordList extends StatelessWidget {
  final String date, contentName;
  final List contentList;

  DataRecordList({this.date, this.contentName, this.contentList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
        )
      ],
    );
  }
}

class DataRecordTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

