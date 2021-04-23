import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/routine_management_controller.dart';
import 'package:mytin/widgets/circle_button_box.dart';
import 'package:mytin/widgets/image_circular.dart';
import 'package:mytin/widgets/motion_reorder_able_list_box.dart';
import 'package:mytin/widgets/text_input_box.dart';

import 'button_box.dart';

class RoutineManagementBody extends StatelessWidget {
  final double height, width;

  RoutineManagementBody({this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.1 * width, 0.035 * height, 0.1 * width, 0),
      child: GetBuilder<RoutineManagementController>(
          builder: (controller) => [
                buildFirstBody(height, width),
                buildSecondBody(),
                buildThirdBody(),
                buildFourthBody(),
                buildFifthBody()
              ][controller.part-1]),
    );
  }

  Column buildFirstBody(double height, double width) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topRight,
          child: OutlinedButton(
            onPressed: () => Get.find<RoutineManagementController>().moveTo(2),
            child: Text(
              "  동작 추가하기  ",
              style: TextStyle(fontSize: 0.015 * height),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.resolveWith((states) {
                return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20));
              }),
            ),
          ),
          margin: EdgeInsets.fromLTRB(0, 0.02 * height, 0, 0.02 * height),
        ),
        MotionReorderAbleListBox(),
      ],
    );
  }

  Column buildSecondBody() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: OutlinedButton(
              onPressed: () =>
                  Get.find<RoutineManagementController>().moveTo(3),
              child: Text("2")),
        )
      ],
    );
  }

  GetBuilder buildThirdBody() {
    return GetBuilder<RoutineManagementController>(
      builder: (controller) => Column(
        children: [
          ImageCircular(
            url: controller.newMotion.imageUrl,
            diameter: 0.24 * height,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0.02 * height, 0, 0.04 * height),
            child: Text(
              controller.newMotion.name,
              style: TextStyle(fontSize: 0.033 * height),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "동작 시간",
                style:
                    TextStyle(fontSize: 0.02 * height, color: Colors.black54),
              ),
              Text(
                "동작 횟수",
                style:
                    TextStyle(fontSize: 0.02 * height, color: Colors.black54),
              ),
            ],
          ),
          SizedBox(height: 0.008 * height),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  TextInputBox(
                    hint: "6",
                    text: "",
                    function: controller.textChangeHandler,
                    widthSize: 0.2,
                    line: 1,
                    type: "time",
                  ),
                  Text("  (초)", style: TextStyle(color: Colors.black54)),
                ],
              ),
              Row(
                children: [
                  TextInputBox(
                    hint: "6",
                    text: "",
                    function: controller.textChangeHandler,
                    widthSize: 0.2,
                    line: 1,
                    type: "count",
                  ),
                  Text("  (회)", style: TextStyle(color: Colors.black54)),
                ],
              )
            ],
          ),
          SizedBox(height: 0.05 * height)
        ],
      ),
    );
  }

  Column buildFourthBody() {
    RoutineManagementController controller =
        Get.find<RoutineManagementController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("루틴 명", style: TextStyle(fontSize: 0.02 * height)),
        TextInputBox(
          hint: "ex) 키크기 운동",
          text: controller.routineName,
          function: controller.textChangeHandler,
          widthSize: 0.8,
          line: 1,
          type: "name",
        ),
        Text("루틴 준비물", style: TextStyle(fontSize: 0.02 * height)),
        TextInputBox(
          hint: "ex) 고무밴드, 우유",
          text: controller.routineMaterials,
          function: controller.textChangeHandler,
          widthSize: 0.8,
          line: 1,
          type: "materials",
        ),
        Text("루틴 설명", style: TextStyle(fontSize: 0.02 * height)),
        TextInputBox(
          hint: "ex) 유산소 운동과 줄넘기로, 성장판을 자극하고 키 성장도 유도하는 운동 루틴",
          text: controller.routineDescription,
          function: controller.textChangeHandler,
          widthSize: 0.8,
          line: 5,
          type: "description",
        ),
      ],
    );
  }

  GetBuilder buildFifthBody() {
    return GetBuilder<RoutineManagementController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("루틴 유형", style: TextStyle(fontSize: 0.02 * height)),
          SizedBox(height: 0.01 * height),
          Wrap(
            children: [
              for (String name in controller.type)
                ButtonBox(
                  name,
                  controller.currentType.contains(name),
                  controller.typeToggle,
                ),
              // TODO : 기타 운동 유형 박스 + 사용자가 보조 텍스트를 입력 가능하게
            ],
          ),
          SizedBox(height: 0.05 * height),
          Text("루틴 난이도", style: TextStyle(fontSize: 0.02 * height)),
          SizedBox(height: 0.01 * height),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (String difficulty in controller.difficulty)
                CircleButtonBox(
                    difficulty,
                    difficulty == controller.currentDifficulty,
                    controller.difficultyToggle),
            ],
          ),
          SizedBox(height: 0.05 * height),
          buildBreakTimeInputBox(),
        ],
      ),
    );
  }

  Row buildBreakTimeInputBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("동작 쉬는 시간", style: TextStyle(fontSize: 0.02 * height)),
            Text(
              "동작 사이마다 쉬는 시간을 입력하세요",
              style: TextStyle(fontSize: 0.015 * height, color: Colors.grey),
            ),
          ],
        ),
        Row(
          children: [
            TextInputBox(
              hint: "6",
              text: "",
              function:
                  Get.find<RoutineManagementController>().textChangeHandler,
              line: 1,
              widthSize: 0.2,
              type: "breakTime",
            ),
            Text("  (초)", style: TextStyle(color: Colors.black54)),
          ],
        ),
      ],
    );
  }
}
