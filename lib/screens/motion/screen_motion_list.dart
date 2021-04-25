import 'package:flutter/material.dart';
import 'package:mytin/dummies/motion_list_dummy.dart';
import 'package:mytin/widgets/content_list_header.dart';
import 'package:mytin/widgets/motion/motion_grid_tile.dart';

class MotionListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2
                  ),
                  itemCount: motionList.length + 2,
                  itemBuilder: (context, index) => (index == 0)
                      ? ContentListHeader(
                          "Motion", "다양한 운동 동작을 찾아보고 직접 만들어 공유해보세요!", () {})
                      : (index == 1)
                          ? Container()
                          : MotionGridTile(motionList[index-2]),
                ),
                color: Colors.black.withOpacity(0.02),
                padding: EdgeInsets.fromLTRB(
                    0.03 * width, 0.015 * height, 0.03 * width, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
