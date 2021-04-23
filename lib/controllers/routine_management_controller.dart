import 'package:get/get.dart';
import 'package:mytin/dummies/routine_detail_dummy.dart';
import 'package:mytin/models/routine_detail.dart';

class RoutineManagementController extends GetxController {
  List<String> difficulty = ["초급", "중급", "고급"];
  List<String> type = ["다이어트", "홈 트레이닝", "건강", "헬스", "여가", "취미"];
  int part = 1;
  List<String> currentType = [];
  String currentDifficulty = "";
  String routineName = "";
  String routineMaterials = "";
  String routineDescription = "";
  int breakTime;
  int motionTime;
  int motionCount;

  // List<MotionElement> motionList = [];
  List<MotionElement> motionList = routine.motions;

  // MotionElement newMotion;
  MotionElement newMotion = routine.motions[0];

  void moveTo(int page) {
    part = page;
    update();
  }

  void next() {
    if (part == 1)
      part += 3;
    else if (part == 3)
      part = 1;
    else
      part++;

    update();
  }

  void back() {
    if (part == 1)
      return;
    else if (part == 4)
      part = 1;
    else
      part--;

    update();
  }

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
    print("currentDifficulty: $currentDifficulty / currentType: $currentType /" +
        "name: $routineName / materials: $routineMaterials / description: $routineDescription");
  }

  void difficultyToggle(String difficulty) {
    currentDifficulty = difficulty;
    update();
    printObject();
  }

  void typeToggle(String type) {
    if (currentType.contains(type))
      currentType.remove(type);
    else
      currentType.add(type);
    update();
    printObject();
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
      motionTime = int.parse(text);
    else if (type == "breakTime")
      motionTime = int.parse(text);


    update();
    printObject();
  }
}
