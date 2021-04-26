/*
 루틴 실행시에, 중간 중간 표시되는 운동 휴식 페이지를 만드는 위젯
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/routine_run_controller.dart';
import 'package:mytin/widgets/time_progress_indicator.dart';

class BreakTimeBody extends StatefulWidget {
  @override
  _BreakTimeBodyState createState() => _BreakTimeBodyState();
}

class _BreakTimeBodyState extends State<BreakTimeBody> {
  @override
  Widget build(BuildContext context) {
    CountdownController _controller = Get.find<CountdownController>();
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return Container(
      color: Color.fromARGB(240, 40, 40, 40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Break Time",
              style: TextStyle(
                fontSize: 0.06 * width,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 0.03 * height),
            GetBuilder<CountdownController>(
              builder: (controller) => TimeProgressIndicator(
                width: width * 1.1,
                height: height * 1.1,
                currentTime: controller.currentBreakTime,
                allTime: controller.breakTime,
                textColor: Colors.white,
                backgroundColor: Color.fromARGB(255, 40, 40, 40),
              ),
            ),
            SizedBox(height: 0.04 * height),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _controller.addBreakTime(5),
                  child: Text("5초 연장하기"),
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.resolveWith(
                            (states) => Color.fromARGB(255, 40, 40, 40)),
                    shape: MaterialStateProperty.resolveWith((states) {
                      return RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side:
                        BorderSide(color: Color.fromARGB(255, 40, 40, 40)),
                      );
                    }),
                  ),
                ),
                SizedBox(width: 0.08 * width),
                TextButton(
                  onPressed: () => _controller.passBreakTime(),
                  child: Text("넘어가기"),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.resolveWith((states) {
                      return RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.grey),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

