import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/routine_add_controller.dart';
import 'package:mytin/widgets/add_page_header.dart';
import 'package:mytin/widgets/next_page_floating_button.dart';
import 'package:mytin/widgets/routine/routine_add_body.dart';
import 'package:mytin/widgets/button_bottom_app_bar.dart';

class RoutineAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(RoutineAddController());    // FIXME 루틴 생성&수정 페이지로 이동하기 바로 전에 해주기

    return SafeArea(
      child: GetBuilder<RoutineAddController>(
        builder: (controller) => Scaffold(
          body: SingleChildScrollView(
            // SingleChildScrollView 로 키보드 열 때 overflow 제거!
            child: Column(
              children: [
                AddPageHeader(
                  title: "루틴 생성하기",
                  subText: [
                    "원하는 동작을 추가해주세요",
                    "원하는 동작을 선택해주세요",
                    "동작과 관련된 세부정보를 입력해주세요",
                    "루틴명과 준비물, 설명을 입력해주세요",
                    "루틴의 유형과 난이도, 쉬는 시간을 입력해주세요",
                  ][controller.part - 1],
                  part: controller.part - 1,
                  backPageFunc: Get.find<RoutineAddController>().back,
                  pageNumbering: [1, 1, 1, 2, 3],
                ),
                RoutineAddBody(),
                if (controller.part < 5)
                  NextPageFloatingButton(Get.find<RoutineAddController>().next),
              ],
            ),
          ),
          bottomNavigationBar: ButtonBottomAppBar(
            clickFunc: Get.find<RoutineAddController>().submit,
            isShow: controller.part > 4,
            isDialog: false,
            text: "생성하기",
          ),
        ),
      ),
    );
  }
}
