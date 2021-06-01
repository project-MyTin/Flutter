import 'package:get/get.dart';
import 'package:mytin/controllers/routine_run_controller.dart';
import 'package:mytin/dummies/routine_detail_dummy.dart';
import 'package:flutter/material.dart';
import 'package:mytin/widgets/routine/break_time_body.dart';
import 'package:mytin/widgets/time_progress_indicator.dart';

class RoutineRunPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(RoutineRunController(currentRoutine.motions, currentRoutine.breakTime));
    return GetBuilder<RoutineRunController>(
      builder: (controller) => Scaffold(
        appBar: buildRoutineRunAppBar(
            controller.motionList[controller.index].name, Get.height),
        body: Stack(
          children: [
            Column(
              children: <Widget>[
                buildRoutineRunBody(controller, Get.width, Get.height),
                SizedBox(height: 0.03 * Get.height),
                Text(
                  controller.motionList[controller.index].name,
                  style: TextStyle(fontSize: 0.06 * Get.width),
                ),
                Text(
                  controller.motionList[controller.index].count.toString() + "회",
                  style: TextStyle(
                      fontSize: 0.05 * Get.width,
                      color: Color.fromARGB(255, 100, 100, 100)),
                ),
                Spacer(),
                buildRoutineRunBottomAppBar(controller, Get.height, Get.width),
              ],
            ),
            if (controller.isBreakTime) BreakTimeBody(),
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
            child: Image.network(
                controller.motionList[controller.index].imageUrl,
                fit: BoxFit.cover,
                width: 1 * width,
                height: 0.55 * height),
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
      height: 0.64 * height,
    );
  }

  Container buildRoutineRunBottomAppBar(
      RoutineRunController controller, double height, double width) {
    return Container(
      color: Colors.grey,
      height: 0.06 * height,
      child: Row(
        children: <Widget>[
          Spacer(flex: 4),
          Text(
            (controller.index + 1).toString() +
                "/" +
                controller.motionList.length.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 0.023 * height),
          ),
          Spacer(flex: 3),
          IconButton(
            onPressed: () => Get.find<RoutineRunController>().passMotion(),
            icon: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 0.06 * width,
            ),
          ),
        ],
      ),
    );
  }

  PreferredSize buildRoutineRunAppBar(String title, double height) {
    return PreferredSize(
      preferredSize: Size.fromHeight(0.07 * height),
      child: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 0.024 * height, color: Colors.white),
        ),
        leading: Container(),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(0.014 * height),
            child: TextButton(
              onPressed: () => Get.back(),
              child: Text(
                "   종료하기    ",
                style: TextStyle(fontSize: 0.015 * height, color: Colors.white),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.resolveWith((states) {
                  return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.white),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
