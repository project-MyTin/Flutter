import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mytin/dummies/motion_detail_dummy.dart';
import 'package:mytin/models/motion_detail.dart';
import 'package:mytin/screens/screen_routine_and_motion.dart';
import 'package:mytin/services/post_motion.dart';
import 'package:mytin/utils/show_snack_bar.dart';

import 'add_abstract_controller.dart';

class MotionAddController extends GetxController implements AddController {
  List<String> difficulty = ["초급", "중급", "고급"];
  List<String> type = ["다이어트", "홈 트레이닝", "건강", "헬스", "여가", "취미"];
  List<String> motionPart = ["등", "어께", "복근", "하체", "전신", "가슴", "코어", "허리"];
  bool isAdd;
  int part = 1;
  String currentType;
  String currentDifficulty;
  String currentMotionPart;
  String motionName;
  String motionDescription;
  String motionReferenceUrl;
  int motionTime;
  var image;
  MotionDetail motion;

  MotionAddController.add() {
    this.isAdd = true;

    update();
    printObject();
  }

  MotionAddController.edit(int motionId) {
    this.isAdd = false;

    motion = currentMotion;
    // TODO motionId로 서버에 Get 요청 => motion 에 저장

    this.currentType = motion.type;
    this.currentDifficulty = motion.difficulty;
    this.currentMotionPart = motion.part;
    this.motionName = motion.name;
    this.motionDescription = motion.description;
    this.motionReferenceUrl = motion.referenceUrl;
    this.motionTime = motion.time;
    this.image = motion.imageUrl;

    update();
    printObject();
  }

  void moveTo(int page) {
    part = page;
    update();
  }

  @override
  void next() {
    part++;
    update();
  }

  @override
  void back() {
    if (part > 1) {
      part--;
      update();
    } else
      Get.back();
  }

  @override
  void submit() {
    postMotion({
      "name": motionName,
      "parts": "[$currentMotionPart]",
      "difficulty": currentDifficulty,
      "file": image,
      "time": motionTime,
      "url": motionReferenceUrl,
      "type": currentType,
      "description": motionDescription,
    });
    Get.offAll(() => RoutineAndMotionPage(index: 1));
    showSnackBar("생성 완료", "동작이 성공적으로 추가되었습니다", "info");
  }

  void printObject() {
    print("currentDifficulty: $currentDifficulty / currentType: $currentType / " +
        "currentMotionPart: $currentMotionPart / name: $motionName / description: $motionDescription / " +
        "time: $motionTime / referenceUrl : $motionReferenceUrl / isAdd : $isAdd");
  }

  void difficultyToggle(String difficulty) {
    currentDifficulty = difficulty;
    update();
    // printObject();
  }

  void typeToggle(String type) {
    currentType = type;
    update();
    // printObject();
  }

  void motionPartToggle(String motionPart) {
    currentMotionPart = motionPart;
    update();
    // printObject();
  }

  void textChangeHandler(String type, String text) {
    if (type == "name")
      motionName = text;
    else if (type == "description")
      motionDescription = text;
    else if (type == "url")
      motionReferenceUrl = text;
    else if (type == "time") motionTime = int.parse(text);

    update();
    // printObject();
  }

  Future<void> uploadImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    image = File(pickedFile.path);

    update();
  }
}
