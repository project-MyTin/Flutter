import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/record_controller.dart';
import 'package:mytin/dummies/record_data_dummy.dart';
import 'package:mytin/widgets/page_bottom_navigation_bar.dart';
import 'package:mytin/widgets/record/calendar_box.dart';
import 'package:mytin/widgets/record/main_data_record.dart';
import 'package:mytin/widgets/record/sub_data_record_body.dart';
import 'package:mytin/widgets/record/sub_data_record_header.dart';

class RecordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(RecordController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.03),
            // SafeArea 는 상단 표시줄을 없에기에, 사용하지 않는대신 맨 위에 여백을 줌
            GetBuilder<RecordController>(
              builder: (ctr) => Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back_ios_outlined),
                      onPressed: () {}),
                  Text("5월"),
                  Text("2021년"),
                  IconButton(
                      icon: Icon(Icons.arrow_forward_ios_outlined),
                      onPressed: () {}),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.41,
              child: PageView.builder(
                itemBuilder: (_, int index) {
                  return CalendarBox();
                },
                controller: PageController(initialPage: 10),
              ),
            ),
            MainDataRecord({
              "totalTime": recordData.totalTime,
              "totalExp": recordData.totalExp,
              "countRoutine": recordData.countRoutine,
              "countMotion": recordData.countMotion,
            }),
            SizedBox(height: Get.height * 0.02),
            GetBuilder<RecordController>(
              builder: (controller) => ExpansionPanelList(
                elevation: 0,
                expandedHeaderPadding: EdgeInsets.zero,
                dividerColor: Get.theme.canvasColor,
                expansionCallback: (i, isOpen) =>
                    controller.setPanelOpen(i, isOpen),
                children: [
                  for (int i = 0; i < 2; i++)
                    ExpansionPanel(
                        canTapOnHeader: true,
                        backgroundColor: Get.theme.canvasColor,
                        headerBuilder: (_, isOpen) => SubDataRecordHeader(
                            date: "5월 28일", contentName: ["루틴", "동작"][i]),
                        body: SubDataRecordBody(
                            [recordData.routineList, recordData.motionList][i]),
                        isExpanded: controller.isPanelsOpen[i]),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: PageBottomNavigationBar(),
    );
  }
}
