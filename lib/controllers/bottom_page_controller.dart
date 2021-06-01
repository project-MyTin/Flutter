import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/screens/rank/screen_rank_tabs.dart';
import 'package:mytin/screens/record/screen_record.dart';
import 'package:mytin/screens/screen_main.dart';
import 'package:mytin/screens/screen_routine_and_motion.dart';

class BottomPageController extends GetxController {
  int index = 0;
  final List<Widget> list = <Widget>[   // List 요소 타입을 Widget 제네릭으로 지정하지 않으면 에러님
    MainPage(),
    RoutineAndMotionPage(),
    RecordPage(),
    RankTabsPage(),
  ];

  setIndex(int value) {
    index = value;
    Get.offAll(() => list[index]);
    update();
  }
}
