import 'package:flutter/material.dart';
import 'package:mytin/dummies/routine_list_dummy.dart';
import 'package:mytin/widgets/routine/routine_list_tile.dart';

class RoutineListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("루틴 리스트 페이지"),
        // ),
        body: ListView.builder(
                itemCount: routineList.length,
                itemBuilder: (context, index) => RoutineListTile(routineList[index])
        ),
      ),
    );
  }
}
