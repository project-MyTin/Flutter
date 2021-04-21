import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/routine_add_controller.dart';
import 'package:mytin/models/routine_detail.dart';
import 'package:mytin/widgets/image_circular.dart';

class RoutineAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;
    Get.put(RoutineAddController());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          // SingleChildScrollView 로 키보드 열 때 overflow 제거!
          child: GetBuilder<RoutineAddController>(
            builder: (controller) => Column(
              children: [
                buildRoutineAddHeader(height),
                RoutineAddBody(height: height, width: width),
                if (controller.part < 5)
                  buildRoutineAddNextPageButton(height, width),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildRoutineAddNextPageButton(double height, double width) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0.035 * height, 0.08 * width, 0),
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        onPressed: () => Get.find<RoutineAddController>().next(),
        child: Icon(Icons.arrow_forward_ios),
        foregroundColor: Colors.white,
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
          style: TextStyle(fontSize: 0.045 * height),
        ),
        GetBuilder<RoutineAddController>(builder: (controller) {
          List<String> messageList = [
            "원하는 동작을 추가해주세요",
            "원하는 동작을 선택해주세요",
            "동작과 관련된 세부정보를 입력해주세요",
            "루틴명과 준비물, 설명을 입력해주세요",
            "루틴의 유형과 난이도, 쉬는 시간을 입력해주세요",
          ];

          return Text(
            messageList[controller.part - 1],
            style: TextStyle(
              fontSize: 0.019 * height,
              color: Colors.grey,
            ),
          );
        }),
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
      padding: EdgeInsets.fromLTRB(0.1 * width, 0.035 * height, 0.1 * width, 0),
      child: GetBuilder<RoutineAddController>(builder: (controller) {
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
        buildReorderAbleListBox(height),
      ],
    );
  }

  Container buildReorderAbleListBox(double height) {
    return Container(
      child: SizedBox(
        height: 0.4 * height,
        child: GetBuilder<RoutineAddController>(
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
              onPressed: () => Get.find<RoutineAddController>().moveTo(3),
              child: Text("2")),
        )
      ],
    );
  }

  GetBuilder buildThirdBody() {
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
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: OutlinedButton(
              onPressed: () => Get.find<RoutineAddController>().moveTo(5),
              child: Text("4")),
        )
      ],
    );
  }

  Column buildFifthBody() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: OutlinedButton(
              onPressed: () => Get.find<RoutineAddController>().moveTo(1),
              child: Text("5")),
        ),
        SizedBox(height: 0.3 * height),
        buildRoutineAddBottomAppBar(height, width)
      ],
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
        onPressed: () => Get.find<RoutineAddController>().submit(),
      ),
    );
  }
}
