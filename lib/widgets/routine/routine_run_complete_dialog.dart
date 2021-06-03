import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mytin/screens/screen_routine_and_motion.dart';

class RoutineRunCompleteDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return AlertDialog(
      content: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text("루틴 완료",
                  style:
                      TextStyle(color: Colors.white, fontSize: 0.024 * height)),
              alignment: Alignment.center,
              color: Colors.blue.withOpacity(0.8),
              height: 0.08 * height,
              width: 0.7 * width,
            ),
            SizedBox(height: 0.035 * height),
            Text("이번 루틴 획득 경험치", style: TextStyle(fontSize: 0.022 * height)),
            Text(
              "${19}EX",
              style: TextStyle(
                  fontSize: 0.026 * height,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  0.06 * width, 0.015 * height, 0.06 * width, 0),
              child: Text(
                "※ 자세한 경험치는 사이드 메뉴 > 어디어디 또는 하단의 확인하기 버튼을 통해서 확인하실 수 있습니다.",
                maxLines: 5,
                style: TextStyle(fontSize: 0.014 * height, color: Colors.grey),
              ),
            ),
          ],
        ),
        height: 0.28 * height,
        width: 0.6 * width,
      ),
      actions: [
        TextButton(
            onPressed: () => Get.offAll(RoutineAndMotionPage()),
            child: Text("루틴 종료", style: TextStyle(fontSize: 0.018 * height))),
      ],
      contentPadding: const EdgeInsets.all(0),
      elevation: 20,
    );
  }
}
