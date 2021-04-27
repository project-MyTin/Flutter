import 'package:get/get.dart';
import 'package:mytin/dummies/routine_detail_dummy.dart';
import 'package:mytin/models/routine_detail.dart';

import 'add_abstract_controller.dart';

class RoutineAddController extends GetxController implements AddController {
  List<String> difficulty = ["초급", "중급", "고급"];
  List<String> type = ["다이어트", "홈 트레이닝", "건강", "헬스", "여가", "취미"];
  int part = 1;
  bool isAdd;
  String currentType;
  String currentDifficulty;
  String routineName;
  String routineMaterials;
  String routineDescription;
  int breakTime;
  int motionTime;
  int motionCount;
  List<MotionElement> motionList = [];
  MotionElement newMotion;
  RoutineDetail routine;

  RoutineAddController.add() {
    isAdd = true;
    update();
  }

  RoutineAddController.edit(int routineId) {
    isAdd = false;

    this.routine = currentRoutine;
    // TODO motionId로 서버에 Get 요청 => routine 에 저장

    this.motionList = routine.motions;
    this.newMotion = routine.motions[0];
    this.currentType = routine.type;
    this.currentDifficulty = routine.difficulty;
    this.routineName = routine.name;
    this.routineMaterials = routine.materials.toString();
    this.routineDescription = routine.description;
    this.breakTime = routine.breakTime;

    update();
  }

  void moveTo(int page) {
    part = page;
    update();
  }

  @override
  void next() {
    if (part == 1)
      part += 3;
    else if (part == 3)
      part = 1;
    else
      part++;

    update();
  }

  @override
  void back() {
    if (part == 1){
      Get.back();
      return;
    } else if (part == 4)
      part = 1;
    else
      part--;

    update();
  }

  @override
  void submit() {
    // TODO : 서버 http 통신 -> 이후 성공 다이얼로그 출력
    update();
    moveTo(1);
  }

  void changeSequence(oldIndex, newIndex) {
    if (oldIndex < newIndex) newIndex -= 1;
    final MotionElement item = motionList.removeAt(oldIndex);
    motionList.insert(newIndex, item);
    update();
  }

  void printObject() {
    print("currentDifficulty: $currentDifficulty / currentType: $currentType / " +
        "name: $routineName / materials: $routineMaterials / description: $routineDescription / " +
    "time: $motionTime / count: $motionCount / breakTime: $breakTime / isAdd : $isAdd");
  }

  void difficultyToggle(String difficulty) {
    currentDifficulty = difficulty;
    update();
  }

  void typeToggle(String type) {
    currentType = type;
    update();
  }

  void textChangeHandler(String type, String text) {
    if (type == "name")
      routineName = text;
    else if (type == "materials")
      routineMaterials = text;
    else if (type == "description")
      routineDescription = text;
    else if (type == "time")
      motionTime = int.parse(text);
    else if (type == "count")
      motionCount = int.parse(text);
    else if (type == "breakTime")
      breakTime = int.parse(text);

    update();
  }
}
