import 'package:flutter/material.dart';

class RoutineAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return Scaffold(
      body: Column(
          children: [
            Text("루틴 등록하기", style: TextStyle(fontSize: 0.03 * height),)
          ],
      ),
    );
  }
}
