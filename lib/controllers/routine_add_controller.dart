import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mytin/dummies/routine_detail_dummy.dart';
import 'package:mytin/models/motion_tile.dart';
import 'package:mytin/models/routine_detail.dart';
import 'package:mytin/screens/screen_routine_and_motion.dart';
import 'package:mytin/services/motion/get_motion_list.dart';
import 'package:mytin/services/routine/post_routine.dart';
import 'package:mytin/utils/show_snack_bar.dart';

class RoutineAddController extends GetxController {
  List<String> difficulty = ["초급", "중급", "고급"];
  List<String> type = ["다이어트", "홈 트레이닝", "건강", "헬스", "여가", "취미"];
  List<MotionTile> motionTileList = [];
  int part = 1;
  int selectIndex = -1;
  bool isAdd;
  String currentType;
  String currentDifficulty;
  String routineName;
  String routineMaterials;
  String routineDescription;
  int routineTime = 0;
  int breakTime;
  int motionTime;
  int motionCount;
  List<MotionElement> routineMotionList = [];
  MotionElement newMotion;
  RoutineDetail routine;
  var image;

  RoutineAddController.add() {
    isAdd = true;
    getMotionTileList();
    update();
  }

  RoutineAddController.edit(int routineId) {
    isAdd = false;
    getMotionTileList();

    this.routine = currentRoutine;
    // TODO motionId로 서버에 Get 요청 => routine 에 저장

    this.routineMotionList = routine.motions;
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

  void next() {
    switch (part) {
      case 1:
        part += 3;
        break;
      case 2:
        if (selectIndex != -1) {
          createNewMotion();
          part++;
        } else {
          showSnackBar("동작이 선택되지 않았습니다!", "루틴에 추가할 동작을 선택해주세요", "warning");
        }
        break;
      case 3:
        if (motionTime != null && motionCount != null) {
          addMotionToList();
          part = 1;
        } else {
          showSnackBar("동작 시간과 횟수가 비여있습니다!", "동작 시간과 횟수를 입력해주세요", "warning");
        }
        break;
      default:
        part++;
    }
    update();
  }

  void back() {
    if (part == 1) {
      Get.back();
      part = 1;
      return;
    } else if (part == 4)
      part = 1;
    else
      part--;

    update();
  }

  Future<void> submit() async {
    final Map<String, dynamic> requestMap = {
      "name": routineName,
      "materials": routineMaterials,
      "description": routineDescription,
      "type": currentType,
      "difficulty": currentDifficulty,
      "breakTime": breakTime,
      "motions": [
        for (MotionElement motion in routineMotionList)
          {
            "motion_id": motion.id,   // todo : id 값으로 불러온다고? (수정, 삭제 이상 발생)
            "motion_time": motion.time,
            "numOfMotion": motion.count,
          }
      ],
      "img": image,
    };
    final response = await postRoutine(requestMap);
    // Get.put(RoutineListController());
    // Get.find<RoutineListController>().loadRoutines();
    Get.offAll(() => RoutineAndMotionPage(index: 0));
    showSnackBar("생성 완료", "루틴이 성공적으로 추가되었습니다", "info");
  }

  void changeSequence(oldIndex, newIndex) {
    if (oldIndex < newIndex) newIndex -= 1;
    final MotionElement item = routineMotionList.removeAt(oldIndex);
    routineMotionList.insert(newIndex, item);
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
    else if (type == "breakTime") breakTime = int.parse(text);

    update();
  }

  Future<void> getMotionTileList() async {
    motionTileList = await loadMotionList();
    print(motionTileList);
  }

  void select(int index) {
    selectIndex = index;
    update();
  }

  void createNewMotion() {
    MotionTile motion = motionTileList[selectIndex];
    this.newMotion = MotionElement.fromMap({
      "name": motion.name,
      "part": motion.part,
      "count": null,
      "imageUrl": motion.imageUrl,
      "time": null,
      "id": motion.id,
    });
    selectIndex = -1;
  }

  void addMotionToList() {
    newMotion.time = motionTime;
    newMotion.count = motionCount;
    routineMotionList.add(newMotion);
    routineTime += motionTime.toInt();
    motionTime = motionCount = null;
  }

  void deleteMotionToList(int index) {
    routineMotionList.removeAt(index);
    update();
  }

  Future<void> uploadImage() async {
    final pickedFile =
    await ImagePicker().getImage(source: ImageSource.gallery);
    image = File(pickedFile.path);

    update();
  }
}
