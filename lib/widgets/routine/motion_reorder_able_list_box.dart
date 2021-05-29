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
    return Container(
      height: 0.6 * Get.height,
      width: 0.85 * Get.width,
      child: GetBuilder<RoutineAddController>(
        builder: (controller) => (controller.routineMotionList.length > 0)
            ? ReorderableListView(
                children: [
                  for (int i = 0; i < controller.routineMotionList.length; i++)
                    MotionListTile(i, controller.routineMotionList[i],
                        Get.height, controller.deleteMotionToList),
                ],

                onReorder: (oldI, newI) =>
                    controller.changeSequence(oldI, newI),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("루틴 안에 포함되는 동작이 없습니다!",
                      style: TextStyle(
                          fontSize: 0.022 * Get.height, color: Colors.grey)),
                  SizedBox(height: 0.005 * Get.height),
                  Text("'동작 추가하기' 를 눌러 원하는 동작을 추가하세요",
                      style: TextStyle(
                          fontSize: 0.016 * Get.height, color: Colors.grey)),
                ],
              ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: Colors.grey.withOpacity(0.3))),
    );
  }
}
