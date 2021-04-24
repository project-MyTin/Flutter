import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/routine_management_controller.dart';
import 'package:mytin/widgets/progress_page_icon.dart';
import 'file:///C:/Users/user/Documents/mytin/lib/widgets/routine/routine_management_body.dart';

enum Mode { add, edit }

class RoutineManagementPage extends StatelessWidget {
  final Mode mode;

  RoutineManagementPage(this.mode) {
    (mode == Mode.add)
        ? Get.put(RoutineManagementController())
        : Get.put(RoutineManagementController());
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return SafeArea(
      child: GetBuilder<RoutineManagementController>(
        builder: (controller) => Scaffold(
          body: SingleChildScrollView(
            // SingleChildScrollView 로 키보드 열 때 overflow 제거!
            child: Column(
              children: [
                buildRoutineAddHeader(height),
                RoutineManagementBody(height: height, width: width),
                if (controller.part < 5)
                  buildRoutineAddNextPageButton(height, width),
              ],
            ),
          ),
          bottomNavigationBar: (controller.part > 4)
              ? buildRoutineAddBottomAppBar(height, width)
              : buildRoutineAddBottomAppBar(0, 0),
        ),
      ),
    );
  }

  Container buildRoutineAddBottomAppBar(double height, double width) {
    return Container(
      width: width,
      height: 0.065 * height,
      color: Colors.grey,
      child: TextButton(
        child: Text(
          "등록 하기",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => Get.find<RoutineManagementController>().submit(),
      ),
    );
  }

  Container buildRoutineAddNextPageButton(double height, double width) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0.035 * height, 0.08 * width, 0),
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        onPressed: () => Get.find<RoutineManagementController>().next(),
        child: Icon(Icons.arrow_forward_ios),
        foregroundColor: Colors.white,
      ),
    );
  }

  GetBuilder buildRoutineAddHeader(double height) {
    return GetBuilder<RoutineManagementController>(builder: (controller) {
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
          ProgressPageIcon([1, 1, 1, 2, 3][controller.part - 1], 3, 0.38),
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
