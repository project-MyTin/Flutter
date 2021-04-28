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
    double height = screenSize.height, width = screenSize.width;

    return Container(
      height: 0.4 * height,
      width: 0.8 * width,
      child: GetBuilder<RoutineAddController>(
        builder: (controller) => (controller.routineMotionList.length > 0)
            ? ReorderableListView(
                children: [
                  for (int i = 0; i < controller.routineMotionList.length; i++)
                    MotionListTile(i, controller.routineMotionList[i], height,
                        controller.deleteMotionToList),
                ],
                onReorder: (oldI, newI) =>
                    controller.changeSequence(oldI, newI),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("읎어요", style: TextStyle(fontSize: 0.04 * height)),
                  SizedBox(height: 0.01 * height),
                  Text("오른쪽 상단의 '동작 추가하기' 버튼을 눌러 원하는 동작을 추가하세요",
                      style: TextStyle(
                          fontSize: 0.012 * height, color: Colors.grey)),
                ],
              ),
      ),
      padding: EdgeInsets.all(0.01 * height),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Color.fromARGB(255, 210, 210, 210))),
    );
  }
}
