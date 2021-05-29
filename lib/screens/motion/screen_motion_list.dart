import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/motion_list_controller.dart';
import 'package:mytin/services/motion/get_motion_detail.dart';
import 'package:mytin/widgets/motion/motion_detail_dialog.dart';
import 'package:mytin/widgets/motion/motion_grid_tile.dart';
import 'package:mytin/widgets/title_page_header.dart';

class MotionListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(MotionListController());
    return Container(
      color: Colors.black.withOpacity(0.02),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TitlePageHeader(
                "Motion", "많은 운동 동작들을 찾아보고 직접 만들어 공유해보세요!", () {}),
          ),
          GetBuilder<MotionListController>(
            builder: (ctr) => ctr.motionList.length > 0
                ? SliverPadding(
                    padding: EdgeInsets.all(0.04 * Get.width),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return MotionGridTile(
                            index,
                            ctr.motionList[index],
                            (int id) async {
                              final motion = await loadMotionDetail(id);
                              Get.dialog(MotionDetailDialog(motion));
                            },
                            ctr.motionList[index].id,
                            false,
                          );
                        },
                        childCount: ctr.motionList.length,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 5 / 3,
                        mainAxisSpacing: 0.03 * Get.width,
                        crossAxisSpacing: 0.03 * Get.width,
                      ),
                    ),
                  )
                : SliverToBoxAdapter(
                    child: Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(top: Get.height * 0.07),
                      child: Text(
                        "동작이 텅 비여있습니다?",
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.6),
                            fontSize: Get.height * 0.022),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
