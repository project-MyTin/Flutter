import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/screens/motion/screen_motion_list.dart';
import 'package:mytin/screens/routine/screen_routine_list.dart';
import 'package:mytin/screens/screen_main.dart';

class PageBottomNavigationBar extends StatelessWidget {
  PageBottomNavigationBar(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        if (value != index) {
          if (value == 0)
            Get.to(() => MotionListPage(), transition: Transition.noTransition);
          else if (value == 1)
            Get.to(() => MainPage(), transition: Transition.noTransition);
          else if (value == 2)
            Get.to(() => RoutineListPage(), transition: Transition.noTransition);
        }
      },
      currentIndex: index,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.directions_run), label: "동작"),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
        BottomNavigationBarItem(icon: Icon(Icons.art_track), label: "루틴"),
      ],
    );
  }
}
