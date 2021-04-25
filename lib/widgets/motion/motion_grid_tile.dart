import 'package:flutter/material.dart';
import 'package:mytin/models/motion_tile.dart';

class MotionGridTile extends StatelessWidget {
  final MotionTile motion;
  final int index;

  MotionGridTile(this.index, this.motion) : super(key: ValueKey(index));

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return Container(
      child: Row(
        children: [
          Text(motion.name),
        ],
      ),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color.fromARGB(255, 220, 220, 220)),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(0, 1),
          ),
        ],
      ),
    );
  }
}
