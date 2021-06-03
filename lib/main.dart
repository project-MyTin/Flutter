import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/screens/screen_main.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '마이틴',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      defaultTransition: Transition.noTransition,
      home: MainPage(),
    );
  }
}
