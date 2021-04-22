import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/routine_add_controller.dart';
import 'package:mytin/models/routine_detail.dart';
import 'package:mytin/widgets/image_circular.dart';
import 'package:mytin/widgets/progress_page_icon.dart';

class RoutineAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;
    Get.put(RoutineAddController());

    return SafeArea(
      child: GetBuilder<RoutineAddController>(
        builder: (controller) => Scaffold(
          body: SingleChildScrollView(
            // SingleChildScrollView 로 키보드 열 때 overflow 제거!
            child: Column(
              children: [
                buildRoutineAddHeader(height),
                RoutineAddBody(height: height, width: width),
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
        onPressed: () => Get.find<RoutineAddController>().submit(),
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
        GetBuilder<RoutineAddController>(
            builder: (controller) =>
                ProgressPageIcon([1, 1, 1, 2, 3][controller.part - 1], 3, 0.38)),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("루틴 명", style: TextStyle(fontSize: 0.02 * height)),
        buildInfoInputBox("ex) 키크기 운동", 1),
        Text("루틴 준비물", style: TextStyle(fontSize: 0.02 * height)),
        buildInfoInputBox("ex) 고무밴드, 우유", 1),
        Text("루틴 설명", style: TextStyle(fontSize: 0.02 * height)),
        buildInfoInputBox("ex) 유산소 운동과 줄넘기로, 성장판을 자극하고 키 성장도 유도하는 운동 루틴", 5),
      ],
    );
  }

  Column buildInfoInputBox(String text, int line) {
    return Column(
      children: [
        SizedBox(height: 0.01 * height),
        SizedBox(
          child: TextField(
            maxLines: line,
            decoration: InputDecoration(
              hintText: text,
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey, width: 0.0),
              ),
              hintStyle:
                  TextStyle(fontSize: 0.02 * height, color: Colors.black26),
            ),
            textAlignVertical: TextAlignVertical.center,
          ),
          height: 0.06 * height + 0.025 * (line - 1) * height,
          width: 0.8 * width,
        ),
        SizedBox(height: 0.025 * height),
      ],
    );
  }

  Column buildFifthBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("루틴 유형", style: TextStyle(fontSize: 0.02 * height)),
        SizedBox(height: 0.01 * height),
        SizedBox(height: 0.03 * height),
        Text("루틴 난이도", style: TextStyle(fontSize: 0.02 * height)),
        SizedBox(height: 0.01 * height),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildDifficultyBox("쉬움"),
            buildDifficultyBox("보통"),
            buildDifficultyBox("어려움"),
          ],
        ),
        SizedBox(height: 0.045 * height),
        buildBreakTimeInputBox(),
      ],
    );
  }

  Container buildDifficultyBox(String text) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(fontSize: 0.022 * height),
      ),
      width: 0.24 * width,
      height: 0.24 * width,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black12),
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
