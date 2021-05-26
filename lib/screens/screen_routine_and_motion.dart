import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/screens/motion/screen_motion_list.dart';
import 'package:mytin/screens/routine/screen_routine_list.dart';
import 'package:mytin/widgets/page_bottom_navigation_bar.dart';

class RoutineAndMotionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: TabBar(
            labelColor: Colors.white,
            labelStyle: TextStyle(fontSize: Get.height * 0.018),
            indicatorColor: Colors.white,
            indicatorWeight: Get.height * 0.006,
            tabs: [
              Tab(text: "루틴"),
              Tab(text: "동작"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            RoutineListPage(),
            MotionListPage(),
          ],
        ),
        bottomNavigationBar: PageBottomNavigationBar(),
      ),
    );
  }
}
