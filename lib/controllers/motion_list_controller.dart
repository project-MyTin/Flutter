import 'package:get/get.dart';
import 'package:mytin/models/motion_tile.dart';
import 'package:mytin/services/get_motion_list.dart';

class MotionListController extends GetxController {
  List<MotionTile> motionList = [];

  @override
  void onInit() {
    _loadMotions();
    super.onInit();
  }

  Future<void> _loadMotions() async {
    motionList = await loadMotionList();
    motionList.forEach((element) => print(element.name + element.imageUrl));
    update();
  }
}