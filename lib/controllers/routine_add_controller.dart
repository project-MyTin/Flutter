import 'package:get/get.dart';
import 'package:mytin/models/routine_detail.dart';

class RoutineAddController extends GetxController{
  int part = 1;
  List<MotionElement> motionList = [];

  void moveTo(int page) {
    part = page;
    update();
  }

  void next() {
    if (part == 1) {
      part += 2;
    } else {
      part ++;
    }
    update();
  }

  void submit() {
    // TODO : 서버 http 통신 -> 이후 성공 다이얼로그 출력
    update();
  }
}