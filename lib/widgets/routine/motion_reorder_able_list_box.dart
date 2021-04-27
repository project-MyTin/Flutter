/*
 루틴 생성하기에서 루틴에 속하는 동작 리스트 + 동작 요소들의 순서를 드래그로 변경할 수 있는
 리스트 뷰(ReorderableListView)를 만드는 위젯
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/routine_add_controller.dart';
import 'package:mytin/widgets/routine/motion_list_tile.dart';

class MotionReorderAbleListBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;

    return Container(
      child: SizedBox(
        height: 0.4 * height,
        child: GetBuilder<RoutineAddController>(
          builder: (controller) => ReorderableListView(
            children: [
              for (int i = 0; i < controller.motionList.length; i++)
                MotionListTile(i, controller.motionList[i], height),
            ],
            onReorder: (oldI, newI) => controller.changeSequence(oldI, newI),
          ),
        ),
      ),
      padding: EdgeInsets.all(0.01 * height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Color.fromARGB(255, 210, 210, 210))),
    );
  }
}
