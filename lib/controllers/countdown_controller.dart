import 'dart:async';

import 'package:get/get.dart';
import 'package:mytin/models/routine_detail.dart';

class CountdownController extends GetxController {
  int index = 0;
  bool isBreakTime = false;
  List<MotionElement> motionList;
  int breakTime;
  int motionCount;
  Timer timer;
  int currentTime;
  int currentBreakTime;

  CountdownController(this.motionList, this.breakTime) {
    motionCount = motionList.length;
    currentTime = motionList[index].time * motionList[index].count;
    currentBreakTime = breakTime;

    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (currentTime < 1) {
        // 동작 카운트가 끝났을 경우
        if (index == motionCount - 1) {
          // 마지막 동작 카운트가 끝난 경우 => 타이머 종료
          t.cancel();
        } else if (currentBreakTime < 1) {
          // 휴식 카운트도 끝난 경우 => 다음 동작으로
          index++;
          isBreakTime = false;
          currentTime = motionList[index].time * motionList[index].count;
          currentBreakTime = breakTime;
        } else {
          // 휴식 시간은 안 끝난 경우
          isBreakTime = true;
          currentBreakTime--;
        }
      } else {
        // 루틴 시간이 안 끝난 경우
        currentTime--;
      }
      update();
    });
  }

  void shutdownCountdown() {
    timer.cancel();
  }
}