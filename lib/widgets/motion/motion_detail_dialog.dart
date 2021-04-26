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
              width: 0.8 * width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(motion.imageUrl),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.4), BlendMode.darken)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(motion.name, style: TextStyle(color: Colors.white, fontSize: 0.03 * height)),
                  SizedBox(height: 0.02 * height),
                  Text(motion.publisher, style: TextStyle(color: Colors.white, fontSize: 0.03 * height)),
                ],
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
