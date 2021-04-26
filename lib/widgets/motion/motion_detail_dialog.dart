import 'package:flutter/material.dart';
import 'package:mytin/models/motion_detail.dart';

class MotionDetailDialog extends StatelessWidget {
  final MotionDetail motion;

  MotionDetailDialog(this.motion);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        child: Column(
          children: [
            buildMotionDetailHeader(height, width),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildCircleBorderTextBox(motion.type, width),
                buildCircleBorderTextBox(motion.difficulty, width),
                buildCircleBorderTextBox(motion.time.toString(), width),
              ],
            )
          ],
        ),
        height: 0.6 * height,
        width: 0.8 * width,
      ),
      elevation: 20,
    );
  }

  Container buildCircleBorderTextBox(String text, double width) {
    return Container(
      alignment: Alignment.center,
      child: Text(text, style: TextStyle(fontSize: 0.032 * width)),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
            color: Colors.grey.withOpacity(0.5), width: 0.01 * width),
      ),
      height: 0.16 * width,
      width: 0.16 * width,
    );
  }

  Container buildMotionDetailHeader(double height, double width) {
    return Container(
      height: 0.26 * height,
      width: 0.8 * width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(motion.imageUrl),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.darken)),
      ),
      child: Column(
        children: [
          Spacer(flex: 5),
          Text(motion.name,
              style: TextStyle(color: Colors.white, fontSize: 0.03 * height)),
          SizedBox(height: 0.005 * height),
          Text(motion.publisher,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 0.018 * height)),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
