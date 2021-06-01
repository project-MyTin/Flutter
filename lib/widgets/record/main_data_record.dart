import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainDataRecord extends StatelessWidget {
  final routineGoalTime = 120;
  final List<int> dataList;
  final List<List<String>> nameList = [
    ["루틴 수행시간", "분"],
    ["총 경험치", "exp"],
    ["루틴 횟수", "개"],
    ["동작 횟수", "개"],
  ];

  MainDataRecord(Map<String, int> map)
      : dataList = [
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
        SizedBox(height: Get.height * 0.02),
        Text(nameList[0][0]),
        SizedBox(height: Get.height * 0.025),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              child: CircularProgressIndicator(
                value: dataList[0] / routineGoalTime,
                strokeWidth: 22,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlue),
                backgroundColor: Colors.grey.withOpacity(0.2),
              ),
              height: Get.width * 0.35,
              width: Get.width * 0.35,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Get.height * 0.01),
              child: Text(
                dataList[0].toString(),
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: Get.height * 0.06,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Get.height * 0.062),
              child: Text(nameList[0][1],
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: Get.height * 0.016,
                  )),
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
                  Row(children: [
                    Text(
                      dataList[i].toString(),
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: Get.height * 0.035),
                    ),
                    SizedBox(width: Get.width * 0.01),
                    Text(nameList[i][1],
                        style: TextStyle(color: Colors.lightBlue)),
                  ]),
                ],
              ),
          ],
        )
      ],
    );
  }
}
