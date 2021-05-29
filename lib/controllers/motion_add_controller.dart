import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mytin/controllers/motion_list_controller.dart';
import 'package:mytin/models/motion_detail.dart';
import 'package:mytin/screens/screen_routine_and_motion.dart';
import 'package:mytin/services/get_motion_detail.dart';
import 'package:mytin/services/post_motion.dart';
import 'package:mytin/utils/show_snack_bar.dart';

class MotionAddController extends GetxController {
  List<String> difficulty = ["초급", "중급", "고급"];
  List<String> type = ["다이어트", "홈 트레이닝", "건강", "헬스", "여가", "취미"];
  List<String> motionPart = ["등", "어께", "복근", "하체", "전신", "가슴", "코어", "허리"];
  bool isAdd = true;
  int part = 1;
  String currentType;
  String currentDifficulty;
  String currentMotionPart;
  String motionName;
  String motionDescription;
  String motionReferenceUrl;
  int motionTime;
  var image;  // fixme : 고용량? 카메라로 찍은 사진 첨부시 413 에러 (용량때문이라 추측)
  MotionDetail motion;

  MotionAddController({bool isAdd, int motionId}) {
    this.isAdd = isAdd;
    if(!isAdd) loadMotion(motionId);
    update();
  }

  Future<void> loadMotion(int id) async {
    motion = await loadMotionDetail(id);
    this.currentType = motion.type;
    this.currentDifficulty = motion.difficulty;
    this.currentMotionPart = motion.part;
    this.motionName = motion.name;
    this.motionDescription = motion.description;
    this.motionReferenceUrl = motion.referenceUrl;
    this.motionTime = motion.time;
    this.image = motion.imageUrl;
    update();
  }

  void moveTo(int page) {
    part = page;
    update();
  }

  void next() {
    part++;
    update();
  }

  void back() {
    if (part > 1) {
      part--;
      update();
    } else
      Get.back();
  }

  Future<void> submit() async {
    /*
     - 생성, 삭제 api로 서버와 통신하는 함수엔 await 를 걸어 동기로 처리해야함
     - 생성 페이지, 다이얼로그로 넘어가서 그런지 컨트롤러가 onDelete() 됨
          => 리스트 페이지를 들어갈 때 Get.put()으로 페이지의 컨트롤러를 수동으로 추가해야함
     - 컨트롤러에서 리스트를 새로 불러오는 함수도 수동으로 호출해야함
     */
    if (isAdd) {
      final res = await postMotion({
        "name": motionName,
        "parts": [currentMotionPart],
        "difficulty": currentDifficulty,
        "img": image,
        "time": motionTime,
        "url": motionReferenceUrl,
        "type": currentType,
        "description": motionDescription,
      });
    } else {
      // todo 수정 api 통신
    }
    Get.put(MotionListController());
    Get.find<MotionListController>().loadMotions();
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
