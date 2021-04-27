import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/dummies/routine_list_dummy.dart';
import 'package:mytin/screens/routine/screen_routine_add.dart';
import 'package:mytin/widgets/add_floating_button.dart';
import 'package:mytin/widgets/list_view_header.dart';
import 'package:mytin/widgets/page_bottom_navigation_bar.dart';
import 'package:mytin/widgets/routine/routine_list_tile.dart';

class RoutineListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: ListView.builder(
            itemCount: routineList.length + 1,
            itemBuilder: (context, index) => (index == 0)
                ? ListViewHeader(
                    "Routine", "다양한 운동 루틴을 수행하고 직접 만들어 공유해보세요!", () {})
                : RoutineListTile(routineList[index - 1]),
          ),
          color: Colors.black.withOpacity(0.02),
        ),
        floatingActionButton: AddFloatingButton(() => Get.to(
            () => RoutineAddPage(),
            transition: Transition.noTransition)),
        bottomNavigationBar: PageBottomNavigationBar(2),
      ),
    );
  }
}
