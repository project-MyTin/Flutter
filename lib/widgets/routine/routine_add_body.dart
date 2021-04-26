/*
 루틴 생성하기 페이지에서 단계별로 보여줄 위젯 본문(body)들을 만드는 위젯
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/routine_add_controller.dart';
import 'package:mytin/widgets/circle_button_box.dart';
import 'package:mytin/widgets/image_circular.dart';
import 'package:mytin/widgets/routine/motion_reorder_able_list_box.dart';
import 'package:mytin/widgets/text_input_box.dart';
import 'package:mytin/widgets/button_box.dart';
import 'package:mytin/widgets/text_input_box_with_text.dart';

class RoutineAddBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return Padding(
      padding: EdgeInsets.fromLTRB(0.1 * width, 0.035 * height, 0.1 * width, 0),
      child: GetBuilder<RoutineAddController>(
          builder: (controller) => [
                buildFirstBody(height),
                buildSecondBody(),
                buildThirdBody(height),
                buildFourthBody(height),
                buildFifthBody(height)
              ][controller.part - 1]),
    );
  }

  Column buildFirstBody(double height) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topRight,
          child: OutlinedButton(
            onPressed: () => Get.find<RoutineAddController>().moveTo(2),
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
              onPressed: () => Get.find<RoutineAddController>().moveTo(3),
              child: Text("2")),
        )
      ],
    );
  }

  GetBuilder buildThirdBody(double height) {
    return GetBuilder<RoutineAddController>(
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
                    hint: "4",
                    text: controller.motionTime?.toString(),
                    inputFunc: controller.textChangeHandler,
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
                    hint: "5",
                    text: controller.motionCount?.toString(),
                    inputFunc: controller.textChangeHandler,
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

  Column buildFourthBody(double height) {
    RoutineAddController controller = Get.find<RoutineAddController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("루틴 명", style: TextStyle(fontSize: 0.02 * height)),
        TextInputBox(
          hint: "ex) 키크기 운동",
          text: controller.routineName ?? "",
          inputFunc: controller.textChangeHandler,
          widthSize: 0.8,
          line: 1,
          type: "name",
        ),
        Text("루틴 준비물", style: TextStyle(fontSize: 0.02 * height)),
        TextInputBox(
          hint: "ex) 고무밴드, 우유",
          text: controller.routineMaterials ?? "",
          inputFunc: controller.textChangeHandler,
          widthSize: 0.8,
          line: 1,
          type: "materials",
        ),
        Text("루틴 설명", style: TextStyle(fontSize: 0.02 * height)),
        TextInputBox(
          hint: "ex) 유산소 운동과 줄넘기로, 성장판을 자극하고 키 성장도 유도하는 운동 루틴",
          text: controller.routineDescription ?? "",
          inputFunc: controller.textChangeHandler,
          widthSize: 0.8,
          line: 5,
          type: "description",
        ),
      ],
    );
  }

  GetBuilder buildFifthBody(double height) {
    return GetBuilder<RoutineAddController>(
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
                  controller.currentType == name,
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
          TextInputBoxWithText(
              title: "동작 쉬는 시간",
              subTitle: "동작 사이마다의 쉬는 시간을 입력하세요",
              hint: "10",
              text: controller.breakTime?.toString(),
              type: "breakTime",
              line: 1,
              widthSize: 0.14,
              inputFunc: controller.textChangeHandler,
              numberType: "초",
          ),
        ],
      ),
    );
  }
}
