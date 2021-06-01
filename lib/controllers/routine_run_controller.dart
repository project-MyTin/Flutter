import 'dart:async';

import 'package:get/get.dart';
import 'package:mytin/models/routine_detail.dart';
import 'package:mytin/services/record/post_record.dart';
import 'package:mytin/widgets/routine/routine_run_complete_dialog.dart';

class RoutineRunController extends GetxController {
  int index = 0;
  bool isBreakTime = false;
  List<MotionElement> motionList;
  int breakTime;
  int motionCount;
  Timer timer;
  int currentTime;
  int currentBreakTime;

  RoutineRunController(this.motionList, this.breakTime) {
    motionCount = motionList.length;
    currentTime = motionList[index].time * motionList[index].count;
    currentBreakTime = breakTime;

    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (currentTime < 1) {
        if (index == motionCount - 1) {
          t.cancel();
        } else if (currentBreakTime < 1) {
          passMotion();
        } else {
          isBreakTime = true;
          currentBreakTime--;
        }
      } else currentTime--;
      update();
    });
  }

  void passBreakTime() {
    currentBreakTime = 0;
    update();
  }

  void passMotion() {
    if (index < motionCount-1) {
      index++;
      isBreakTime = false;
      currentTime = motionList[index].time * motionList[index].count;
      currentBreakTime = breakTime;
    } else {
      completeRoutine();
    }
    update();
  }

  void completeRoutine() {
    postRecord(31, 20);
    Get.dialog(RoutineRunCompleteDialog());
  }

  void addBreakTime(int time) {
    currentBreakTime += time;
    update();
  }
}
