import 'package:get/get.dart';
import 'package:mytin/screens/profile/screen_profile_home.dart';
import 'package:mytin/screens/rank/screen_rank.dart';
import 'package:mytin/screens/record/screen_record.dart';
import 'package:mytin/screens/screen_main.dart';
import 'package:mytin/screens/screen_routine_and_motion.dart';

class BottomPageController extends GetxController {
  int index = 0;

  setIndex(int value) {
    index = value;
    switch (index) {
      case 0:
        Get.offAll(MainPage());
        break;
      case 1:
        Get.offAll(RoutineAndMotionPage());
        break;
      case 2:
        Get.offAll(RecordPage());
        break;
      case 3:
        Get.offAll(RankPage());
        break;
      case 4:
        Get.offAll(ProfileHomePage());
        break;
    }
    update();
  }
}
