import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/routine_management_controller.dart';
import 'package:mytin/models/routine_detail.dart';
import 'package:mytin/widgets/circle_button_box.dart';
import 'package:mytin/widgets/image_circular.dart';
import 'package:mytin/widgets/text_input_box.dart';

import 'button_box.dart';

class RoutineManagementBody extends StatelessWidget {
  final double height, width;

  RoutineManagementBody({this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.1 * width, 0.035 * height, 0.1 * width, 0),
      child: GetBuilder<RoutineManagementController>(builder: (controller) {
        switch (controller.part) {
          case 1:
            return buildFirstBody(height, width);
          case 2:
            return buildSecondBody();
          case 3:
            return buildThirdBody();
          case 4:
            return buildFourthBody();
          case 5:
            return buildFifthBody();
          default:
            return Container();
        }
      }),
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
        buildReorderAbleListBox(height),
      ],
    );
  }

  Container buildReorderAbleListBox(double height) {
    return Container(
      child: SizedBox(
        height: 0.4 * height,
        child: GetBuilder<RoutineManagementController>(
          builder: (controller) => ReorderableListView(
            children: [
              for (int i = 0; i < controller.motionList.length; i++)
                buildMotionTile(i, controller.motionList[i]),
            ],
            onReorder: (oldI, newI) => controller.changeSequence(oldI, newI),
          ),
        ),
      ),
      padding: EdgeInsets.all(0.01 * height),
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 210, 210, 210))),
    );
  }

  Container buildMotionTile(int i, MotionElement motion) {
    return Container(
      key: ValueKey(i),
      child: ListTile(
        leading: ImageCircular(url: motion.imageUrl, diameter: 0.06 * height),
        title: Text(motion.name),
        subtitle: Text(motion.part),
        trailing: Text(motion.count.toString() + "회"),
      ),
      margin: EdgeInsets.all(0.005 * height),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color.fromARGB(255, 220, 220, 220)),
          borderRadius: BorderRadius.all(Radius.circular(15))),
    );
  }

  Column buildSecondBody() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: OutlinedButton(
              onPressed: () => Get.find<RoutineManagementController>().moveTo(3),
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
              buildTimeInputBox("10", "초"),
              buildTimeInputBox("5", "회"),
            ],
          ),
          SizedBox(height: 0.05 * height)
        ],
      ),
    );
  }

  Row buildTimeInputBox(String text, String unit) {
    return Row(
      children: [
        SizedBox(
          child: TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.end,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: text,
                hintStyle:
                TextStyle(fontSize: 0.026 * height, color: Colors.black26)),
            textAlignVertical: TextAlignVertical.bottom,
          ),
          height: 0.05 * height,
          width: 0.2 * width,
        ),
        Text(
          " ($unit)",
          style: TextStyle(color: Colors.black54),
        ),
      ],
    );
  }

  Column buildFourthBody() {
    RoutineManagementController controller = Get.find<RoutineManagementController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("루틴 명", style: TextStyle(fontSize: 0.02 * height)),
        TextInputBox(
          "ex) 키크기 운동",
          controller.routineName,
          1,
          controller.textChangeHandler,
          "name",
        ),
        Text("루틴 준비물", style: TextStyle(fontSize: 0.02 * height)),
        TextInputBox(
          "ex) 고무밴드, 우유",
          controller.routineMaterials,
          1,
          controller.textChangeHandler,
          "materials",
        ),
        Text("루틴 설명", style: TextStyle(fontSize: 0.02 * height)),
        TextInputBox(
          "ex) 유산소 운동과 줄넘기로, 성장판을 자극하고 키 성장도 유도하는 운동 루틴",
          controller.routineDescription,
          5,
          controller.textChangeHandler,
          "description",
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
        buildTimeInputBox("10", "초"),
      ],
    );
  }
}