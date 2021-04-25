import 'package:flutter/material.dart';
import 'package:mytin/dummies/routine_list_dummy.dart';
import 'package:mytin/widgets/content_list_header.dart';
import 'package:mytin/widgets/routine/routine_list_tile.dart';

class RoutineListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: ListView.builder(
            itemCount: routineList.length + 1,
            itemBuilder: (context, index) => (index == 0)
                ? ContentListHeader("Routine", "다양한 운동 루틴을 수행하고 직접 만들어 공유해보세요!", () {})
                : RoutineListTile(routineList[index - 1]),
          ),
          color: Colors.black.withOpacity(0.02),
        ),
      ),
    );
  }
}
