import 'package:get/get.dart';
import 'package:mytin/controllers/routine_run_controller.dart';
import 'package:flutter/material.dart';
import 'package:mytin/models/routine_detail.dart';
import 'package:mytin/widgets/routine/break_time_body.dart';
import 'package:mytin/widgets/time_progress_indicator.dart';

class RoutineRunPage extends StatelessWidget {
  final List<MotionElement> motions;
  final int breakTime;
  final int id;

  RoutineRunPage(this.motions, this.breakTime, this.id);

  @override
  Widget build(BuildContext context) {
    Get.put(RoutineRunController(motions, breakTime, id));
    return GetBuilder<RoutineRunController>(
      builder: (ctr) => Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: Get.height * 0.0285),
                LinearProgressIndicator(
                  value: (ctr.index + 1) / ctr.motionCount,
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
                  minHeight: Get.height * 0.006,
                ),
                SizedBox(
                  height: Get.height * 0.08,
                  child: Stack(
                    children: [
                      Container(
                        color: Colors.blueAccent.withOpacity(0.1),
                        width:
                            Get.width * (ctr.index + 1) / ctr.motionCount,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            SizedBox(width: Get.width * 0.06),
                            Text("${ctr.index + 1}",
                                style: TextStyle(fontSize: Get.height * 0.034)),
                            SizedBox(width: Get.width * 0.01),
                            Text("/",
                                style: TextStyle(fontSize: Get.height * 0.02)),
                            SizedBox(width: Get.width * 0.01),
                            Text("${ctr.motionList.length}",
                                style: TextStyle(fontSize: Get.height * 0.02)),
                            Spacer(),
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: Container(
                                height: Get.height * 0.05,
                                padding: EdgeInsets.fromLTRB(Get.height * 0.02, Get.height * 0.006, Get.height * 0.02, Get.height * 0.006),
                                child: Text("종료하기", style: TextStyle(fontSize: Get.height * 0.018, color: Colors.grey)),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Colors.grey.withOpacity(0.14),
                                ),
                              ),
                            ),
                            SizedBox(width: Get.width * 0.04),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                buildRoutineRunBody(ctr, Get.width, Get.height),
                SizedBox(height: 0.04 * Get.height),
                Text(ctr.motionList[ctr.index].name,
                    style: TextStyle(fontSize: Get.height * 0.031)),
                SizedBox(height: Get.height * 0.012),
                Text("${ctr.motionList[ctr.index].count}회",
                    style: TextStyle(
                        fontSize: Get.height * 0.0223, color: Colors.grey)),
                Spacer(),
                GestureDetector(
                  onTap: () => ctr.passMotion(),
                  child: Container(
                    height: Get.height * 0.066,
                    width: Get.width * 0.86,
                    alignment: Alignment.center,
                    child: ctr.index == ctr.motionCount - 1 ? Row(
                      children: [
                        SizedBox(width: Get.width * 0.02),
                        Spacer(flex: 5),
                        Text("루틴 종료", style: TextStyle(color: Colors.white)),
                        Spacer(flex: 4),
                        Icon(Icons.arrow_forward, color: Colors.white),
                        SizedBox(width: Get.width * 0.02),
                      ],
                    ) : Text("다음 동작", style: TextStyle(color: Colors.white)),
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                  ),
                ),
                SizedBox(height: 0.03 * Get.height),
              ],
            ),
            if (ctr.isBreakTime) BreakTimeBody(),
          ],
        ),
      ),
    );
  }

  SizedBox buildRoutineRunBody(
      RoutineRunController controller, double width, double height) {
    return SizedBox(
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            child: Container(
              height: Get.height * 0.475,
              child: Image.network(
                controller.motionList[controller.index].imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TimeProgressIndicator(
              width: width,
              height: height,
              currentTime: controller.currentTime,
              allTime: controller.motionList[controller.index].time *
                  controller.motionList[controller.index].count,
              textColor: Color.fromARGB(255, 100, 100, 100),
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
      width: width,
      height: 0.57 * height,
    );
  }
}
