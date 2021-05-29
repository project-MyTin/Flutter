import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/motion_add_controller.dart';
import 'package:mytin/widgets/add_page_app_bar.dart';
import 'package:mytin/widgets/motion/motion_add_body.dart';

class MotionAddPage extends StatelessWidget {
  final List<String> subTexts = [
    "동작 이미지를 입력하세요",
    "동작명과 시간, 설명을 입력하세요",
    "동작의 유형과 난이도, 운동 부위를 입력하세요",
  ];
  final bool isAdd;
  final int motionId;

  MotionAddPage({this.isAdd, this.motionId});

  @override
  Widget build(BuildContext context) {
    Get.put(MotionAddController(isAdd: isAdd, motionId: motionId));
    return GetBuilder<MotionAddController>(
      builder: (ctr) => Scaffold(
        appBar: AddPageAppBar(
            subTexts: subTexts,
            ctr: Get.find<MotionAddController>(),
            isMotion: true),
        body: SingleChildScrollView(
          // == 키보드 열때 overflow 제거
          child: Column(
            children: [
              LinearProgressIndicator(
                value: ctr.part / 3,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
                minHeight: Get.height * 0.008,
              ),
              SizedBox(height: 0.03 * Get.height),
              MotionAddBody(),
            ],
          ),
        ),
      ),
    );
  }
}
