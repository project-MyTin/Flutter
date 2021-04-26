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
            Container(
              height: 0.26 * height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(motion.imageUrl),
                  fit: BoxFit.cover
                )
              ),
            ),
          ],
        ),
        height: 0.6 * height,
        width: 0.8 * width,
      ),
      elevation: 20,
    );
  }
}
