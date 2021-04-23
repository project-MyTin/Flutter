import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/routine_management_controller.dart';
import 'package:mytin/models/routine_detail.dart';
import 'package:mytin/widgets/image_circular.dart';

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
                buildMotionTile(i, controller.motionList[i], height),
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

  Container buildMotionTile(int i, MotionElement motion, double height) {
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
}
