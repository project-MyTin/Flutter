import 'package:flutter/material.dart';
import 'package:mytin/models/motion_tile.dart';
import 'package:mytin/widgets/motion/motion_grid_tile.dart';

class MotionSelectGridBox extends StatelessWidget {
  final List<MotionTile> motions;

  MotionSelectGridBox(this.motions);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: motions.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 10,
          crossAxisSpacing: 10
        ),
        itemBuilder: (_, index) => MotionGridTile(index, motions[index], () {

        }));
  }
}
