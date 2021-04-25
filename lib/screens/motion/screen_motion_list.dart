import 'package:flutter/material.dart';
import 'package:mytin/dummies/motion_list_dummy.dart';
import 'package:mytin/widgets/content_list_header.dart';
import 'package:mytin/widgets/motion/motion_grid_tile.dart';
import 'package:mytin/widgets/sliver_list_header.dart';

class MotionListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverListHeader("Motion", "많은 운동 동작들을 찾아보고 직접 만들어 공유해보세요!", () {}),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => MotionGridTile(index, motionList[index]),
                childCount: motionList.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 5 / 3,
                mainAxisSpacing: 0.03 * width,
                crossAxisSpacing: 0.03 * width,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
