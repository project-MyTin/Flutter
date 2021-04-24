import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/routine_management_controller.dart';
import 'package:mytin/widgets/motion_list_tile.dart';

class MotionReorderAbleListBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;

    return Container(
      child: SizedBox(
        height: 0.4 * height,
        child: GetBuilder<RoutineManagementController>(
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
          border: Border.all(color: Color.fromARGB(255, 210, 210, 210))),
    );
  }
}
