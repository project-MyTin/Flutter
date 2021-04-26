import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/motion_add_controller.dart';
import 'package:mytin/widgets/text_input_box.dart';
import 'package:mytin/widgets/text_input_box_with_text.dart';

class MotionAddBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return Padding(
      padding: EdgeInsets.fromLTRB(0.1 * width, 0.035 * height, 0.1 * width, 0),
      child: GetBuilder<MotionAddController>(
          builder: (controller) => [
            buildFirstBody(height),
            buildSecondBody(height),
            buildThirdBody(height),
          ][controller.part - 1]),
    );
  }

  Column buildFirstBody(double height) {
    return Column(
      children: [
        Text("동작 대표 이미지"),
      ],
    );
  }

  Column buildSecondBody(double height) {
    MotionAddController controller = Get.find<MotionAddController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("동작 명", style: TextStyle(fontSize: 0.02 * height)),
        TextInputBox(
          hint: "ex) 공중부양",
          text: controller.motionName ?? "",
          inputFunc: controller.textChangeHandler,
          widthSize: 0.8,
          line: 1,
          type: "name",
        ),

        Text("동작 설명", style: TextStyle(fontSize: 0.02 * height)),
        TextInputBox(
          hint: "ex) 허경영을 따라해보세요 ^^7",
          text: controller.motionDescription ?? "",
          inputFunc: controller.textChangeHandler,
          widthSize: 0.8,
          line: 5,
          type: "description",
        ),

        Text("동작 참고 자료 URL", style: TextStyle(fontSize: 0.02 * height)),
        TextInputBox(
          hint: "ex) http://",
          text: controller.motionReferenceUrl ?? "",
          inputFunc: controller.textChangeHandler,
          widthSize: 0.8,
          line: 1,
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

  Column buildThirdBody(double height) {
    return Column(
      children: [

      ],
    );
  }
}
