import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoutineDataValueBox extends StatelessWidget {
  final String text;
  final IconData icon;

  RoutineDataValueBox(this.text, this.icon);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(Get.width * 0.04),
          child: Icon(icon, color: Colors.lightBlue, size: Get.width * 0.05),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1), shape: BoxShape.circle),
        ),
        SizedBox(height: Get.height * 0.01),
        Text(text),
      ],
    );
  }
}