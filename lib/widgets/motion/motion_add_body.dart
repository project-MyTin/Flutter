import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/motion_add_controller.dart';
import 'package:mytin/widgets/button_box.dart';
import 'package:mytin/widgets/circle_button_box.dart';
import 'package:mytin/widgets/text_input_box.dart';
import 'package:mytin/widgets/text_input_box_with_text.dart';

class MotionAddBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: EdgeInsets.fromLTRB(0.1 * Get.width, 0.035 * Get.height, 0.1 * Get.width, 0),
      child: GetBuilder<MotionAddController>(
          builder: (controller) => [
                buildFirstBody(),
                buildSecondBody(),
                buildThirdBody(),
              ][controller.part - 1]),
    );
  }

  Column buildFirstBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("동작 대표 이미지", style: TextStyle(fontSize: 0.02 * Get.height)),
        SizedBox(height: 0.03 * Get.height),
        GetBuilder<MotionAddController>(
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

  Column buildSecondBody() {
    MotionAddController controller = Get.find<MotionAddController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("동작 명", style: TextStyle(fontSize: 0.02 * Get.height)),
        TextInputBox(
          hint: "ex) 스쿼트",
          text: controller.motionName ?? "",
          inputFunc: controller.textChangeHandler,
          widthSize: 0.8,
          line: 1,
          type: "name",
        ),
        Text("동작 설명", style: TextStyle(fontSize: 0.02 * Get.height)),
        TextInputBox(
          hint: "ex) 스쿼트는 상체를 고정한 상태에서 하체 힘으로 기마자세를 유지하고, 다시 바르게 선 자세를 유지하는 동작입니다.",
          text: controller.motionDescription ?? "",
          inputFunc: controller.textChangeHandler,
          widthSize: 0.8,
          line: 4,
          type: "description",
        ),
        Text("동작 참고 자료 URL", style: TextStyle(fontSize: 0.02 * Get.height)),
        TextInputBox(
          hint: "ex) http://",
          text: controller.motionReferenceUrl ?? "",
          inputFunc: controller.textChangeHandler,
          widthSize: 0.8,
          line: 2,
          type: "url",
        ),
        TextInputBoxWithText(
          title: "동작 시간",
          subTitle: "동작 하나당 수행 시간을 입력하세요",
          hint: "3",
          text: controller.motionTime?.toString(),
          type: "time",
          line: 1,
          widthSize: 0.14,
          inputFunc: controller.textChangeHandler,
          numberType: "초",
        ),
      ],
    );
  }

  Column buildThirdBody() {
    MotionAddController controller = Get.find<MotionAddController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("동작 유형", style: TextStyle(fontSize: 0.02 * Get.height)),
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
        Text("동작 부위", style: TextStyle(fontSize: 0.02 * Get.height)),
        SizedBox(height: 0.01 * Get.height),
        Wrap(
          children: [
            for (String name in controller.motionPart)
              ButtonBox(
                name,
                controller.currentMotionPart == name,
                controller.motionPartToggle,
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
      ],
    );
  }
}
