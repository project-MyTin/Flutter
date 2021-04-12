import 'package:flutter/material.dart';
import 'package:mytin/models/routine_detail.dart';
import 'package:mytin/screens/screen_routine_list.dart';
import 'package:mytin/screens/screen_routine_run.dart';
import 'package:mytin/screens/screens_routine_detail.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '마이틴 데모',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: RoutineRunPage(),
      // home: RoutineDetailPage(),
      // home: RoutineListPage(),
    );
  }
}


