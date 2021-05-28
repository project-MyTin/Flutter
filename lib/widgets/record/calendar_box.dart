import 'package:date_util/date_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/record_controller.dart';
import 'package:mytin/dummies/calendar_data_dummy.dart';

class CalendarBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> dayName = ["일", "월", "화", "수", "목", "금", "토"];
    final Color valueColor = Colors.lightBlue;
    final int maxValue = 100;

    RecordController ctr = Get.find<RecordController>();
    DateUtil dateUtil = DateUtil();
    int numOfColumns = {
      DateMode.day: 7,
      DateMode.week: 1,
      DateMode.month: 4,
    }[ctr.mode];
    int numOfDays =
        dateUtil.daysInMonth(ctr.currentViewMonth, ctr.currentViewYear);
    int beforeDays =
        -(DateTime(ctr.currentViewYear, ctr.currentViewMonth, 2).weekday - 1);

    print(numOfDays.toString());
    print(beforeDays.toString());

    return Container(
      padding: EdgeInsets.fromLTRB(
          Get.width * 0.07, 0, Get.width * 0.07, Get.height * 0.01),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [BoxShadow(color: Colors.grey)]),
      child: GetBuilder<RecordController>(
        builder: (_) => Table(
          children: [
            if (ctr.mode == DateMode.day)
              TableRow(children: [
                for (int i = 0; i < numOfColumns; i++) DayCell(text: dayName[i])
              ]),
            for (int i = beforeDays; i < numOfDays; i += numOfColumns)
              TableRow(children: [
                for (int j = i; j < i + numOfColumns; j++)
                  DayCell(
                    text: j >= 0 && j < numOfDays ? (j + 1).toString() : "",
                    backColor: valueColor.withOpacity(j < 0 || j >= numOfDays
                        ? 0
                        : calendarData.valueList[j] > maxValue
                            ? 1
                            : calendarData.valueList[j] / maxValue),
                  )
              ])
          ],
        ),
      ),
    );
  }
}

class DayCell extends StatelessWidget {
  final String text;
  final double height;
  final Color textColor, backColor;

  DayCell({this.text, this.height, this.textColor, this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(Get.width * 0.007, Get.width * 0.005,
          Get.width * 0.007, Get.width * 0.005),
      height: height ?? Get.width * 0.105,
      width: Get.width * 0.1,
      alignment: Alignment.center,
      child: Text(text, style: TextStyle(color: textColor ?? Colors.black)),
      decoration: BoxDecoration(
        color: backColor ?? Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
