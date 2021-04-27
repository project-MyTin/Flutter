import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mytin/dummies/motion_detail_dummy.dart';
import 'package:mytin/models/motion_detail.dart';
import 'package:mytin/screens/motion/screen_motion_list.dart';

import 'add_abstract_controller.dart';

class MotionAddController extends GetxController implements AddController {
  List<String> difficulty = ["초급", "중급", "고급"];
  List<String> type = ["다이어트", "홈 트레이닝", "건강", "헬스", "여가", "취미"];
  List<String> motionPart = ["등", "어께", "복근", "하체", "전신", "가슴", "코어", "허리"];
  bool isCreate;
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

  MotionAddController.create() {
    this.isCreate = true;

    update();
    printObject();
  }

  MotionAddController.edit(int motionId) {
    this.isCreate = false;

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
    if (part == 1) {
      Get.off(MotionListPage(), transition: Transition.noTransition);
      // Get.back();
      return;
    } else
      part--;
    update();
  }

  @override
  void submit() {
    // TODO : 서버 http 통신 -> 이후 성공 다이얼로그 출력
    update();
    moveTo(1);
  }

  void printObject() {
    print("currentDifficulty: $currentDifficulty / currentType: $currentType / " +
        "currentMotionPart: $currentMotionPart / name: $motionName / description: $motionDescription / " +
        "time: $motionTime / referenceUrl : $motionReferenceUrl");
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
