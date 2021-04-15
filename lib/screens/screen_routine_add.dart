import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/routine_add_controller.dart';

class RoutineAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;
    Get.put(RoutineAddController());

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            buildRoutineAddHeader(height),
            RoutineAddBody(height: height, width: width),
          ],
        ),
      ),
    );
  }

  Column buildRoutineAddHeader(double height) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {},
          ),
        ),
        Text(
          "루틴 등록하기",
          style: TextStyle(fontSize: 0.04 * height),
        ),
        Text(
          "원하는 동작을 추가해주세요",
          style: TextStyle(fontSize: 0.018 * height),
        ),
      ],
    );
  }
}

class RoutineAddBody extends StatelessWidget {
  final double height, width;

  RoutineAddBody({this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          0.1 * width, 0.05 * height, 0.1 * width, 0.05 * height),
      child: GetBuilder<RoutineAddController>(builder: (controller) {
        switch (controller.part) {
          case 1: return buildFirstBody();
          case 2: return buildSecondBody();
          case 3: return buildThirdBody();
          default: return Container();
        }
      }),
    );
  }

  Column buildFirstBody() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: OutlinedButton(onPressed: () {
            Get.find<RoutineAddController>().next();
          }, child: Text("동작 추가하기")),
        )
      ],
    );
  }

  Column buildSecondBody() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: OutlinedButton(onPressed: () {Get.find<RoutineAddController>().next();}, child: Text("동작 추가ㅋㅋ")),
        )
      ],
    );
  }

  Column buildThirdBody() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: OutlinedButton(onPressed: () {Get.find<RoutineAddController>().next();}, child: Text("스콰트")),
        )
      ],
    );
  }
}
