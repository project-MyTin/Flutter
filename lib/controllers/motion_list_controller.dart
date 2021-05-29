import 'package:get/get.dart';
import 'package:mytin/models/motion_tile.dart';
import '../services/motion/get_motion_list.dart';

class MotionListController extends GetxController {
  List<MotionTile> motionList = [];

  @override
  void onInit() {
    loadMotions();
    super.onInit();
  }

  Future<void> loadMotions() async {
    motionList = await loadMotionList();
    update();
  }
}