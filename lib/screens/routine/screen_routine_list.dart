import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/routine_list_controller.dart';
import 'package:mytin/widgets/title_page_header.dart';
import 'package:mytin/widgets/routine/routine_list_tile.dart';

class RoutineListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(RoutineListController());
    return Container(
      child: GetBuilder<RoutineListController>(
        builder: (ctr) => ListView.builder(
          itemCount: ctr.routineList.length + 1,
          itemBuilder: (context, index) => (index == 0)
              ? TitlePageHeader(
                  "Routine", "다양한 운동 루틴을 수행하고 직접 만들어 공유해보세요!", () {})
              : RoutineListTile(ctr.routineList[index - 1]),
        ),
      ),
      color: Colors.black.withOpacity(0.02),
    );
  }
}
