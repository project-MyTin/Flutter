import 'package:get/get.dart';
import 'package:mytin/screens/motion/screen_motion_list.dart';
import 'package:mytin/screens/record/screen_record.dart';
import 'package:mytin/screens/routine/screen_routine_list.dart';
import 'package:mytin/screens/screen_main.dart';

class BottomPageController extends GetxController {
  int index = 1;

  setIndex(int value) {
    index = value;
    switch (index) {
      case 0:
        Get.offAll(MotionListPage());
        break;
      case 1:
        Get.offAll(MainPage());
        break;
      case 2:
        Get.offAll(RoutineListPage());
        break;
      case 3:
        Get.offAll(RecordPage());
        break;
    }
    update();
  }
}
