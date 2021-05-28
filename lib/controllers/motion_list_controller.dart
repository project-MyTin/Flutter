import 'package:get/get.dart';
import 'package:mytin/models/motion_tile.dart';
import 'package:mytin/repository/motion_tile_repository.dart';

class MotionListController extends GetxController {
  List<MotionTile> motionList = [];

  @override
  void onInit() {
    _loadMotions();
    super.onInit();
  }

  Future<void> _loadMotions() async {
    motionList = await loadMotionList();
    update();
  }
}