import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/screens/motion/screen_motion_add.dart';
import 'package:mytin/screens/motion/screen_motion_list.dart';
import 'package:mytin/screens/routine/screen_routine_add.dart';
import 'package:mytin/screens/routine/screen_routine_list.dart';
import 'package:mytin/widgets/add_floating_button.dart';
import 'package:mytin/widgets/page_bottom_navigation_bar.dart';

class RoutineAndMotionPage extends StatefulWidget {
  final int index;

  RoutineAndMotionPage({this.index});

  @override
  _RoutineAndMotionPageState createState() => _RoutineAndMotionPageState();
}

class _RoutineAndMotionPageState extends State<RoutineAndMotionPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        TabController(length: 2, vsync: this, initialIndex: widget.index ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: TabBar(
          labelColor: Colors.lightBlue,
          unselectedLabelColor: Colors.black,
          labelStyle: TextStyle(fontSize: Get.height * 0.018),
          indicatorColor: Colors.lightBlue,
          indicatorWeight: Get.height * 0.006,
          tabs: [Tab(text: "루틴"), Tab(text: "동작")],
          controller: _controller,
        ),
      ),
      body: TabBarView(
        children: [RoutineListPage(), MotionListPage()],
        controller: _controller,
      ),
      floatingActionButton: AddFloatingButton(() => Get.to(() =>
          _controller.index == 0
              ? RoutineAddPage()
              : MotionAddPage(isAdd: true))),
      bottomNavigationBar: PageBottomNavigationBar(),
    );
  }
}
