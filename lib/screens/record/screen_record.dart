import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/widgets/page_bottom_navigation_bar.dart';
import 'package:mytin/widgets/record/data_record_list.dart';
import 'package:mytin/widgets/record/main_data_record.dart';

class RecordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                IconButton(icon: Icon(Icons.arrow_back_ios_outlined), onPressed: () {}),
                Text("5월"),
                Text("2021년"),
                IconButton(
                    icon: Icon(Icons.arrow_forward_ios_outlined), onPressed: () {}),
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
            SizedBox(height: Get.height * 0.05),
            DataRecordList(),
          ],
        ),
        bottomNavigationBar: PageBottomNavigationBar(),
      ),
    );
  }
}
