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
            SizedBox(height: Get.height * 0.04),
            GetBuilder<RecordController>(
              builder: (ctr) => Row(
                children: [
                  SizedBox(width: Get.width * 0.06),
                  Text("${ctr.currentViewMonth}월",
                      style: TextStyle(fontSize: Get.height * 0.034)),
                  SizedBox(width: Get.width * 0.02),
                  Text("${ctr.currentViewYear}년",
                      style: TextStyle(fontSize: Get.height * 0.02)),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.01),
            SizedBox(
              height: Get.height * 0.4,
              child: PageView(
                children: [
                  for (int number =
                          Get.find<RecordController>().leftmostMotionYear;
                      number < Get.find<RecordController>().rightmostMotionYear;
                      number = (number % 100 > 11)
                          ? (number ~/ 100 + 1) * 100 + 2
                          : number + 1)
                    CalendarBox(number, MODE.DAY)
                ],
                onPageChanged: (int index) =>
                    Get.find<RecordController>().changeMonth(index),
                controller: PageController(
                    initialPage: Get.find<RecordController>().startIndex),
              ),
            ),
            SizedBox(height: Get.height * 0.012),
            GetBuilder<RecordController>(
              builder: (ctr) => Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: Get.width * 0.6),
                    child: Text(
                      "${ctr.currentYear}년 ${ctr.currentMonth}월 ${ctr.currentDay}일",
                      style: TextStyle(fontSize: Get.height * 0.019),
                    ),
                  ),
                  if (ctr.recordDetail != null)
                    Column(
                      children: [
                        MainDataRecord({
                          "totalTime": ctr.recordDetail.totalTime,
                          "totalExp": ctr.recordDetail.totalExp,
                          "countRoutine": ctr.recordDetail.countRoutine,
                          "countMotion": ctr.recordDetail.countMotion,
                        }),
                        SizedBox(height: Get.height * 0.03),
                        ExpansionPanelList(
                          elevation: 0,
                          expandedHeaderPadding: EdgeInsets.zero,
                          dividerColor: Get.theme.canvasColor,
                          expansionCallback: (i, isOpen) =>
                              ctr.setPanelOpen(i, isOpen),
                          children: [
                            for (int i = 0; i < 2; i++)
                              ExpansionPanel(
                                  canTapOnHeader: true,
                                  backgroundColor: Get.theme.canvasColor,
                                  headerBuilder: (_, isOpen) =>
                                      SubDataRecordHeader(
                                          date: "5월 28일",
                                          contentName: ["루틴", "동작"][i]),
                                  body: SubDataRecordBody([
                                    recordData.routineList,
                                    recordData.motionList
                                  ][i]),
                                  isExpanded: ctr.isPanelsOpen[i]),
                          ],
                        ),
                      ],
                    ),
                  if (ctr.recordDetail == null)
                    Container(
                      height: Get.height * 0.3,
                      alignment: Alignment.center,
                      child: Text("운동기록이 없습니다.. 분발하세요!", style: TextStyle(color: Colors.grey, fontSize: Get.height * 0.02)),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: PageBottomNavigationBar(),
    );
  }
}
