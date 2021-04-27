import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/motion_add_controller.dart';
import 'package:mytin/dummies/motion_list_dummy.dart';
import 'package:mytin/screens/motion/screen_motion_add.dart';
import 'package:mytin/widgets/add_floating_button.dart';
import 'package:mytin/widgets/motion/motion_grid_tile.dart';
import 'package:mytin/widgets/list_view_header.dart';

class MotionListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black.withOpacity(0.02),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: ListViewHeader(
                    "Motion", "많은 운동 동작들을 찾아보고 직접 만들어 공유해보세요!", () {}),
              ),
              SliverPadding(
                padding: EdgeInsets.all(0.04 * width),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        MotionGridTile(index, motionList[index]),
                    childCount: motionList.length,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 5 / 3,
                    mainAxisSpacing: 0.03 * width,
                    crossAxisSpacing: 0.03 * width,
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: AddFloatingButton(() {
          Get.to(() => MotionAddPage(), transition: Transition.noTransition);
        }),
      ),
    );
  }
}
