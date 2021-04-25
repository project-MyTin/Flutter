import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/routine_add_controller.dart';
import 'package:mytin/widgets/next_page_floating_button.dart';
import 'package:mytin/widgets/progress_page_icon.dart';
import 'package:mytin/widgets/routine/routine_add_body.dart';
import 'package:mytin/widgets/submit_bottom_app_bar.dart';

class RoutineAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;
    Get.put(RoutineAddController());    // FIXME 루틴 생성&수정 페이지로 이동하기 바로 전에 해주기

    return SafeArea(
      child: GetBuilder<RoutineAddController>(
        builder: (controller) => Scaffold(
          body: SingleChildScrollView(
            // SingleChildScrollView 로 키보드 열 때 overflow 제거!
            child: Column(
              children: [
                buildRoutineAddHeader(height),
                RoutineAddBody(),
                if (controller.part < 5)
                  NextPageFloatingButton(Get.find<RoutineAddController>().next),
              ],
            ),
          ),
          bottomNavigationBar: SubmitBottomAppBar(
            submitFunc: Get.find<RoutineAddController>().submit,
            isShow: controller.part > 4,
            isAdd: true,
          ),
        ),
      ),
    );
  }

  GetBuilder buildRoutineAddHeader(double height) {
    return GetBuilder<RoutineAddController>(builder: (controller) {
      List<String> messageList = [
        "원하는 동작을 추가해주세요",
        "원하는 동작을 선택해주세요",
        "동작과 관련된 세부정보를 입력해주세요",
        "루틴명과 준비물, 설명을 입력해주세요",
        "루틴의 유형과 난이도, 쉬는 시간을 입력해주세요",
      ];

      return Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
                size: 0.04 * height,
              ),
              onPressed: () => controller.back(),
            ),
          ),
          ProgressPageIcon([1, 1, 1, 2, 3][controller.part - 1], 3, 0.41),
          Text(
            "루틴 등록하기",
            style: TextStyle(
                fontSize: 0.045 * height, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 0.007 * height),
          Text(
            messageList[controller.part - 1],
            style: TextStyle(
              fontSize: 0.018 * height,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    });
  }
}
