import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/motion_add_controller.dart';
import 'package:mytin/widgets/text_input_box.dart';

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
