import 'package:flutter/material.dart';
import 'package:mytin/dummies/routine_list_dummy.dart';
import 'package:mytin/widgets/content_list_header.dart';
import 'package:mytin/widgets/routine/routine_list_tile.dart';

class MotionListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("루틴 리스트 페이지"),
        // ),
        body: Container(
          child: ListView.builder(
            itemCount: routineList.length + 1,
            itemBuilder: (context, index) => (index == 0)
                ? ContentListHeader("Routine", "Share your routine with people", () {})
                : RoutineListTile(routineList[index - 1]),
          ),
          color: Colors.black.withOpacity(0.02),
        ),
      ),
    );
  }
}
