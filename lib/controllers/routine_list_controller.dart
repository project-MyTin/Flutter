import 'package:get/get.dart';
import 'package:mytin/models/routine_tile.dart';
import 'package:mytin/services/routine/get_routine_list.dart';

class RoutineListController extends GetxController {
  List<RoutineTile> routineList = [];

  @override
  void onInit() {
    loadRoutines();
    super.onInit();
  }

  Future<void> loadRoutines() async {
    routineList = await loadRoutineList();
    update();
  }
}