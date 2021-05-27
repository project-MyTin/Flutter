import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/widgets/page_bottom_navigation_bar.dart';
import 'package:mytin/widgets/record/data_record_list.dart';
import 'package:mytin/widgets/record/main_data_record.dart';

class RecordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            SizedBox(height: Get.height * 0.03),
            // SafeArea 는 상단 표시줄을 없에기에, 사용하지 않는대신 맨 위에 여백을 줌
            Row(
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back_ios_outlined),
                    onPressed: () {}),
                Text("5월"),
                Text("2021년"),
                IconButton(
                    icon: Icon(Icons.arrow_forward_ios_outlined),
                    onPressed: () {}),
                Spacer(),
                TextButton(onPressed: () {}, child: Text("일")),
                TextButton(onPressed: () {}, child: Text("주")),
                TextButton(onPressed: () {}, child: Text("월")),
              ],
            ),
            MainDataRecord({
              "totalTime": 10,
              "totalExp": 10,
              "countRoutine": 10,
              "countMotion": 10,
            }),
            SizedBox(height: Get.height * 0.02),
            DataRecordList(date: "5월 28일", contentName: "루틴", contentList: []),
            DataRecordList(date: "5월 28일", contentName: "동작", contentList: []),
          ],
        ),
        bottomNavigationBar: PageBottomNavigationBar(),
    );
  }
}
