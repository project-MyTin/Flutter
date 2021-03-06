import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/routine_add_controller.dart';
import 'package:mytin/widgets/add_page_app_bar.dart';
import 'package:mytin/widgets/routine/routine_add_body.dart';

class RoutineAddPage extends StatelessWidget {
  final List<String> subTexts = [
    "원하는 동작을 추가하세요",
    "원하는 동작을 선택하세요",
    "동작과 관련된 세부정보를 입력하세요",
    "루틴 이미지를 입력하세요",
    "루틴명과 준비물, 설명을 입력하세요",
    "루틴의 유형과 난이도, 쉬는 시간을 입력하세요",
  ];
  final bool isAdd;
  final int routineId;

  RoutineAddPage({this.isAdd, this.routineId});

  @override
  Widget build(BuildContext context) {
    Get.put(RoutineAddController(isAdd: isAdd, routineId: routineId));
    return GetBuilder<RoutineAddController>(
      builder: (ctr) => Scaffold(
        appBar: AddPageAppBar(
            subTexts: subTexts,
            ctr: Get.find<RoutineAddController>(),
            isMotion: false),
        body: SingleChildScrollView(
          // SingleChildScrollView 로 키보드 열 때 overflow 제거!
          child: Column(
            children: [
              LinearProgressIndicator(
                value: ctr.part / 6,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
                minHeight: Get.height * 0.008,
              ),
              SizedBox(height: Get.height * 0.03),
              RoutineAddBody(),
            ],
          ),
        ),
      ),
    );
  }
}
