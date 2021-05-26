import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainDataRecord extends StatelessWidget {
  final List<int> dataList;
  final List<List<String>> nameList = [
    ["루틴 수행시간", "분"],
    ["총 경험치", "exp"],
    ["루틴 횟수", "개"],
    ["동작 횟수", "개"],
  ];

  MainDataRecord(Map<String, int> map) :
      dataList = [
        map["totalTime"],
        map["totalExp"],
        map["countRoutine"],
        map["countMotion"]
      ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: Get.height * 0.03),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              child: CircularProgressIndicator(
                value: 0,
                strokeWidth: 24,
                backgroundColor: Color.fromRGBO(0x45, 0xAF, 0xBE, 1),
              ),
              height: Get.width * 0.35,
              width: Get.width * 0.35,
            ),
            Column(
              children: [
                Text(nameList[0][0]),
                Text(dataList[0].toString()),
                Text(nameList[0][1]),
              ],
            ),
          ],
        ),
        SizedBox(height: Get.height * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 1; i < dataList.length; i++)
              Column(
                children: [
                  Text(nameList[i][0]),
                  Text(dataList[i].toString() + " " + nameList[i][1]),
                ],
              ),
          ],
        )
      ],
    );
  }
}
