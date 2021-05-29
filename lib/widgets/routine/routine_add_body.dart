/*
 루틴 생성하기 페이지에서 단계별로 보여줄 위젯 본문(body)들을 만드는 위젯
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/routine_add_controller.dart';
import 'package:mytin/widgets/circle_button_box.dart';
import 'package:mytin/widgets/image_circular.dart';
import 'package:mytin/widgets/routine/motion_select_tile.dart';
import 'package:mytin/widgets/routine/motion_reorder_able_list_box.dart';
import 'package:mytin/widgets/text_input_box.dart';
import 'package:mytin/widgets/button_box.dart';
import 'package:mytin/widgets/text_input_box_with_text.dart';

class RoutineAddBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return GetBuilder<RoutineAddController>(
      builder: (controller) => Padding(
          padding: (controller.part != 2)
              ? EdgeInsets.fromLTRB(0.1 * Get.width, 0.035 * Get.height, 0.1 * Get.width, 0)
              : EdgeInsets.fromLTRB(
                  0.05 * Get.width, 0.04 * Get.height, 0.05 * Get.width, 0),
          child: [
            buildFirstBody(),
            buildSecondBody(),
            buildThirdBody(),
            buildFourthBody(),
            buildFifthBody(),
            buildSixthBody(),
          ][controller.part - 1]),
    );
  }

  Column buildFirstBody() {
    return Column(
      children: [
        Container(
          alignment: Alignment.topRight,
          child: OutlinedButton(
            onPressed: () => Get.find<RoutineAddController>().moveTo(2),
            child: Text(
              "  동작 추가하기  ",
              style: TextStyle(fontSize: 0.016 * Get.height),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.resolveWith((states) {
                return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20));
              }),
            ),
          ),
          margin: EdgeInsets.fromLTRB(0, 0.02 * Get.height, 0, 0.02 * Get.height),
        ),
        MotionReorderAbleListBox(),
      ],
    );
  }

  Column buildSecondBody() {
    RoutineAddController controller = Get.find<RoutineAddController>();
    controller.getMotionTileList();
    return Column(
      children: [
        Container(
          child: GridView.builder(
            itemCount: controller.motionTileList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 6 / 7,
                mainAxisSpacing: 12,
                crossAxisSpacing: 10),
            itemBuilder: (_, index) => MotionSelectTile(
                index,
                controller.motionTileList[index],
                controller.select,
                index,
                controller.selectIndex == index
            ),
          ),
          height: 0.515 * Get.height,
          padding: EdgeInsets.all(0.005 * Get.height),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Color.fromARGB(255, 210, 210, 210))),
        ),
      ],
    );
  }

  GetBuilder buildThirdBody() {
    return GetBuilder<RoutineAddController>(
      builder: (controller) => Column(
        children: [
          ImageCircular(
            url: controller.newMotion.imageUrl,
            diameter: 0.24 * Get.height,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0.02 * Get.height, 0, 0.04 * Get.height),
            child: Text(
              controller.newMotion.name,
              style: TextStyle(fontSize: 0.033 * Get.height),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "동작 시간",
                style:
                TextStyle(fontSize: 0.02 * Get.height, color: Colors.black54),
              ),
              Text(
                "동작 횟수",
                style:
                TextStyle(fontSize: 0.02 * Get.height, color: Colors.black54),
              ),
            ],
          ),
          SizedBox(height: 0.008 * Get.height),
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
          SizedBox(height: 0.05 * Get.height)
        ],
      ),
    );
  }

  Column buildFourthBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("루틴 대표 이미지", style: TextStyle(fontSize: 0.02 * Get.height)),
        SizedBox(height: 0.03 * Get.height),
        GetBuilder<RoutineAddController>(
          builder: (controller) => GestureDetector(
            child: (controller.image == null)
                ? Container(
              // 이미지 선택 전 뷰
              alignment: Alignment.center,
              child: Icon(Icons.add_rounded,
                  size: 0.09 * Get.height,
                  color: Colors.black.withOpacity(0.1)),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black.withOpacity(0.1)),
              ),
              height: 0.8 * Get.width,
              width: 0.8 * Get.width,
            )
                : Container(
              // 이미지 선택 후 뷰
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: controller.image is String ? NetworkImage(controller.image) : FileImage(controller.image),
                    fit: BoxFit.cover),
              ),
              height: 0.8 * Get.width,
              width: 0.8 * Get.width,
            ),
            onTap: () => controller.uploadImage(),
          ),
        ),
      ],
    );
  }

  Column buildFifthBody() {
    RoutineAddController controller = Get.find<RoutineAddController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("루틴 명", style: TextStyle(fontSize: 0.02 * Get.height)),
        TextInputBox(
          hint: "ex) 키크기 운동",
          text: controller.routineName ?? "",
          inputFunc: controller.textChangeHandler,
          widthSize: 0.8,
          line: 1,
          type: "name",
        ),
        Text("루틴 준비물", style: TextStyle(fontSize: 0.02 * Get.height)),
        TextInputBox(
          hint: "ex) 고무밴드, 우유",
          text: controller.routineMaterials ?? "",
          inputFunc: controller.textChangeHandler,
          widthSize: 0.8,
          line: 2,
          type: "materials",
        ),
        Text("루틴 설명", style: TextStyle(fontSize: 0.02 * Get.height)),
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

  GetBuilder buildSixthBody() {
    return GetBuilder<RoutineAddController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("루틴 유형", style: TextStyle(fontSize: 0.02 * Get.height)),
          SizedBox(height: 0.01 * Get.height),
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
          SizedBox(height: 0.05 * Get.height),
          Text("루틴 난이도", style: TextStyle(fontSize: 0.02 * Get.height)),
          SizedBox(height: 0.01 * Get.height),
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
          SizedBox(height: 0.05 * Get.height),
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
