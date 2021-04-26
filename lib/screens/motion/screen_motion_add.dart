import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/motion_add_controller.dart';
import 'package:mytin/widgets/add_page_header.dart';
import 'package:mytin/widgets/next_page_floating_button.dart';
import 'package:mytin/widgets/submit_bottom_app_bar.dart';

class MotionAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(MotionAddController());    // FIXME 동작 생성&수정 페이지로 이동하기 바로 전에 해주기

    return SafeArea(
      child: GetBuilder<MotionAddController>(
        builder: (controller) => Scaffold(
          body: SingleChildScrollView(
            // SingleChildScrollView 로 키보드 열 때 overflow 제거!
            child: Column(
              children: [
                AddPageHeader(
                  title: "동작 생성하기",
                  subText: [
                    "동작 이미지를 입력해주세요",
                    "동작명과 시간, 설명을 입력해주세요",
                    "동작의 유형과 난이도, 운동 부위를 입력해주세요",
                  ][controller.part - 1],
                  part: controller.part - 1,
                  backPageFunc: Get.find<MotionAddController>().back,
                  pageNumbering: [1, 2, 3],
                ),
                // RoutineAddBody(),
                if (controller.part < 3)
                  NextPageFloatingButton(Get.find<MotionAddController>().next),
              ],
            ),
          ),
          bottomNavigationBar: SubmitBottomAppBar(
            submitFunc: Get.find<MotionAddController>().submit,
            isShow: controller.part > 2,
            isAdd: true,
          ),
        ),
      ),
    );
  }
}
