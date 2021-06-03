import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/models/record_data.dart';

class SubDataRecordBody extends StatelessWidget {
  final List<RecordTile> list;

  SubDataRecordBody(this.list);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      for (int i = 0; i < list.length; i++)
        Container(
          color: Colors.white,
          height: Get.height * 0.1,
          child: Row(
            children: [
              SizedBox(width: Get.width * 0.06),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(list[i].imageUrl),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle),
                height: Get.height * 0.08,
                width: Get.height * 0.08,
              ),
              SizedBox(width: Get.width * 0.03),
              Text(list[i].name, style: TextStyle(fontSize: Get.height * 0.018)),
              Spacer(),
              Text("${list[i].time} 초 / 회", style: TextStyle(fontSize: Get.height * 0.017, color: Colors.grey)),
              SizedBox(width: Get.width * 0.06),
            ],
          ),
        )
    ]);
  }
}
