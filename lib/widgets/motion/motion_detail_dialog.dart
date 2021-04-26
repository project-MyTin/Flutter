import 'package:flutter/material.dart';
import 'package:mytin/models/motion_detail.dart';

class MotionDetailDialog extends StatelessWidget {
  final MotionDetail motion;

  MotionDetailDialog(this.motion);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(motion.name),
      actions: [
        ElevatedButton(onPressed: () {}, child: Text("닫기"))
      ],
      elevation: 20,
    );
  }
}
