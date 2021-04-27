import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/dummies/motion_list_dummy.dart';
import 'package:mytin/dummies/routine_detail_dummy.dart';
import 'package:mytin/models/motion_tile.dart';
import 'package:mytin/models/routine_detail.dart';

import 'add_abstract_controller.dart';

class RoutineAddController extends GetxController implements AddController {
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
  int breakTime;
  int motionTime;
  int motionCount;
  List<MotionElement> routineMotionList = [];
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

  @override
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
          showSnackBar(
            "동작이 선택되지 않았습니다!",
            "루틴에 추가할 동작을 선택해주세요",
          );
        }
        break;
      case 3:
        if (motionTime != null && motionCount != null) {
          addMotionToList();
          part = 1;
        } else {
          showSnackBar("동작 시간과 횟수가 비여있습니다!", "동작 시간과 횟수를 입력해주세요");
        }
        break;
      default:
        part++;
    }
    update();
  }

  @override
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

  @override
  void submit() {
    // TODO : 서버 http 통신 -> 이후 성공 다이얼로그 출력
    update();
    moveTo(1);
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

  void getMotionTileList() {
    // TODO 서버에서 동작 타일 리스트를 가져오기 (GET)
    motionTileList = motionList;
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
    });
    selectIndex = -1;
  }

  void showSnackBar(String title, String body) {
    Get.snackbar(
      title,
      body,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.deepOrange,
      colorText: Colors.white,
      animationDuration: Duration(milliseconds: 600),
      icon: Icon(
        Icons.warning,
        color: Colors.white,
      ),
    );
  }

  void addMotionToList() {
    newMotion.time = motionTime;
    newMotion.count = motionCount;
    routineMotionList.add(newMotion);

    motionTime = motionCount = null;
  }

  void deleteMotionToList(int index) {
    routineMotionList.removeAt(index);
    update();
  }
}
