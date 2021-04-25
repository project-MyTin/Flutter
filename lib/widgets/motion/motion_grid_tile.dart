import 'package:flutter/material.dart';
import 'package:mytin/models/motion_tile.dart';
import 'package:mytin/widgets/image_circular.dart';

class MotionGridTile extends StatelessWidget {
  final MotionTile motion;
  final int index;

  MotionGridTile(this.index, this.motion) : super(key: ValueKey(index));

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return Container(
      child: Container(
        child: Row(
          children: [
            Text("  " + motion.name, style: TextStyle(
              color: Colors.white,
              fontSize: 0.04 * width
            )),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 1,
              spreadRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
          image: DecorationImage(
            image: NetworkImage(motion.imageUrl),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken)
          ),
        ),
      ),
    );
  }
}
