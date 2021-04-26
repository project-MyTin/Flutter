import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/models/routine_detail.dart';
import 'package:mytin/screens/motion/screen_motion_add.dart';
import 'package:mytin/screens/motion/screen_motion_list.dart';
import 'package:mytin/screens/routine/screen_routine_add.dart';
import 'package:mytin/screens/routine/screen_routine_list.dart';
import 'package:mytin/screens/routine/screen_routine_run.dart';
import 'package:mytin/screens/routine/screens_routine_detail.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '마이틴 데모',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      // home: MotionListPage(),
      // home: RoutineListPage(),
      // home: RoutineRunPage(),
      // home: RoutineDetailPage(),
      // home: RoutineAddPage(),
      home: MotionAddPage(),
    );
  }
}
