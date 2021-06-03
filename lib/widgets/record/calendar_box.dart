import 'package:date_util/date_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/record_controller.dart';

class CalendarBox extends StatelessWidget {
  final int monthYear;
  final MODE mode;

  CalendarBox(this.monthYear, this.mode);

  @override
  Widget build(BuildContext context) {
    final int month = monthYear % 100;
    final int year = monthYear ~/ 100;
    final List<String> dayName = ["일", "월", "화", "수", "목", "금", "토"];
    final Color valueColor = Colors.lightBlue;

    DateUtil dateUtil = DateUtil();
    int numOfColumns = {MODE.DAY: 7, MODE.WEEK: 1, MODE.MONTH: 4}[mode];
    int numOfDays = dateUtil.daysInMonth(month, year);
    int beforeDays = -(DateTime(year, month, 2).weekday - 1);

    return Container(
      padding: EdgeInsets.fromLTRB(
          Get.width * 0.07, 0, Get.width * 0.07, Get.height * 0.01),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Colors.grey.withOpacity(0.15))),
      child: Table(
        children: [
          if (mode == MODE.DAY)
            TableRow(children: [
              for (int i = 0; i < numOfColumns; i++) DayCell(text: dayName[i])
            ]),
          for (int i = beforeDays; i < numOfDays; i += numOfColumns)
            TableRow(children: [
              for (int j = i; j < i + numOfColumns; j++)
                GetBuilder<RecordController>(
                  builder: (ctr) => DayCell(
                    text: j >= 0 && j < numOfDays ? (j + 1).toString() : "",
                    backColor: valueColor.withOpacity(j < 0 || j >= numOfDays
                        ? 0
                        : ctr.calendarValueMap.containsKey(monthYear)
                            ? ctr.calendarValueMap[monthYear][j]
                            : 0),
                  ),
                ),
            ]),
        ],
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
    return GestureDetector(
      onTap: () => int.tryParse(text) != null
          ? Get.find<RecordController>().setDay(int.parse(text))
          : {},
      child: Container(
        margin: EdgeInsets.fromLTRB(Get.width * 0.007, Get.width * 0.005,
            Get.width * 0.007, Get.width * 0.005),
        height: height ?? Get.width * 0.105,
        width: Get.width * 0.1,
        alignment: Alignment.center,
        child: Text(text, style: TextStyle(color: textColor ?? Colors.black)),
        decoration: BoxDecoration(
          color: backColor ?? Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
