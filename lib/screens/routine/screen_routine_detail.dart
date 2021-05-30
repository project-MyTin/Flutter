import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/models/routine_detail.dart';
import 'package:mytin/screens/routine/screen_routine_add.dart';
import 'package:mytin/screens/routine/screen_routine_run.dart';
import 'package:mytin/utils/open_delete_dialog.dart';
import 'package:mytin/widgets/button_bottom_app_bar.dart';
import 'package:mytin/widgets/routine/motion_list_tile.dart';
import 'package:mytin/widgets/routine/routine_data_value_box.dart';

class RoutineDetailPage extends StatelessWidget {
  final RoutineDetail routine;

  RoutineDetailPage(this.routine);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: Get.height * 0.028),
            height: Get.height * 0.31,
            width: Get.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(routine.imageUrl), fit: BoxFit.cover)),
            alignment: Alignment.topCenter,
            child: Container(
              color: Colors.black.withOpacity(0.1),
              child: Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Get.back()),
                  Spacer(),
                  IconButton(
                      icon: Icon(Icons.mode_edit, color: Colors.white),
                      onPressed: () => Get.to(() => RoutineAddPage(),
                          arguments: routine.id)),
                  IconButton(
                      icon: Icon(Icons.delete, color: Colors.white),
                      onPressed: () => openDeleteDialog("루틴", 0)),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Get.height * 0.62,
              width: Get.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
              padding: EdgeInsets.fromLTRB(
                  Get.width * 0.1, Get.height * 0.03, Get.width * 0.1, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(routine.name,
                          style: TextStyle(fontSize: Get.height * 0.03)),
                      SizedBox(width: Get.width * 0.02),
                      Text("made by " + routine.publisher,
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.5))),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.014),
                  Text(routine.description,
                      style: TextStyle(color: Colors.black.withOpacity(0.3))),
                  SizedBox(height: Get.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RoutineDataValueBox(
                          "${routine.time}분", Icons.access_alarm),
                      RoutineDataValueBox(
                          routine.materials[0], Icons.local_mall),
                      RoutineDataValueBox(routine.type, Icons.bookmark),
                      RoutineDataValueBox(routine.difficulty, Icons.star),
                    ],
                  ),
                  Container(
                    margin:
                        EdgeInsets.fromLTRB(0, 0.01 * height, 0, 0.01 * height),
                    padding: EdgeInsets.all(0.005 * height),
                    color: Colors.grey.withOpacity(0.2),
                    height: 0.2 * height,
                    child: ListView(
                      padding: EdgeInsets.fromLTRB(Get.width * 0.1,
                          Get.height * 0.03, Get.width * 0.1, 0),
                      scrollDirection: Axis.vertical,
                      children: [
                        for (int i = 0; i < routine.motions.length; i++)
                          MotionListTile(i, routine.motions[i], height, null)
                        // 위젯에서 반복문 쓰기!
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ButtonBottomAppBar(
        isDialog: false,
        isShow: true,
        text: "시작하기",
        clickFunc: () => Get.to(() => RoutineRunPage()),
      ),
    );
  }
}
