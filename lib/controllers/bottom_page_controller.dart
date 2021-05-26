import 'package:get/get.dart';
import 'package:mytin/screens/profile/screen_profile_home.dart';
import 'package:mytin/screens/rank/screen_rank_tabs.dart';
import 'package:mytin/screens/record/screen_record.dart';
import 'package:mytin/screens/screen_main.dart';
import 'package:mytin/screens/screen_routine_and_motion.dart';

class BottomPageController extends GetxController {
  int index = 0;
  final List list = [
    MainPage(),
    RoutineAndMotionPage(),
    RecordPage(),
    RankTabsPage(),
    ProfileHomePage()
  ];

  setIndex(int value) {
    index = value;
    Get.offAll(() => [index]);
    update();
  }
}
