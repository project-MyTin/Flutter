import 'package:get/get.dart';

class MotionSelectController extends GetxController {
  int selectIndex = -1;

  void select(int index) {
    selectIndex = index;
    update();
  }
}