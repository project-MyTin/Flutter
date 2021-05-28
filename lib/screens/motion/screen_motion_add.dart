import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/motion_add_controller.dart';
import 'package:mytin/widgets/add_page_header.dart';
import 'package:mytin/widgets/motion/motion_add_body.dart';
import 'package:mytin/widgets/next_page_floating_button.dart';
import 'package:mytin/widgets/button_bottom_app_bar.dart';

class MotionAddPage extends StatelessWidget {
  final List<String> subTexts = [
    "동작 이미지를 입력해주세요",
    "동작명과 시간, 설명을 입력해주세요",
    "동작의 유형과 난이도, 운동 부위를 입력해주세요",
  ];
  MotionAddPage() {
    Get.arguments == null
        ? Get.put(MotionAddController.add())
        : Get.put(MotionAddController.edit(Get.arguments));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<MotionAddController>(
        builder: (ctr) => Scaffold(
          body: SingleChildScrollView(
            // == 키보드 열때 overflow 제거
            child: Column(
              children: [
                AddPageHeader(
                  title: ctr.isAdd ? "동작 생성하기" : "동작 수정하기",
                  subText: subTexts[ctr.part - 1],
                  part: ctr.part - 1,
                  backPageFunc: ctr.back,
                  pageNumbering: [1, 2, 3],
                ),
                MotionAddBody(),
                if (ctr.part < 3)
                  NextPageFloatingButton(ctr.next),
              ],
            ),
          ),
          bottomNavigationBar: ButtonBottomAppBar(
            clickFunc: Get.find<MotionAddController>().submit,
            isShow: ctr.part > 2,
            isDialog: false,
            text: ctr.isAdd ? "생성하기" : "수정하기",
          ),
        ),
      ),
    );
  }
}
