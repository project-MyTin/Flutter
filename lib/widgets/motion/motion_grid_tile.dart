/*
 동작 조회하기 페이지(그리드 뷰)에 들어가는 커스텀 타일 위젯
 */
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:mytin/models/motion_tile.dart';
import 'package:mytin/services/motion/get_motion_detail.dart';
import 'package:mytin/widgets/motion/motion_detail_dialog.dart';

class MotionGridTile extends StatelessWidget {
  final MotionTile motion;

  MotionGridTile(this.motion);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final motion = await loadMotionDetail(this.motion.id);
        Get.dialog(MotionDetailDialog(motion));
      },
      child: Container(
        child: Container(
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                      motion.name.length > 12
                          ? motion.name.substring(0, 12) // 12자 이내
                          : motion.name,
                      style: TextStyle(
                          color: Colors.white, fontSize: 0.036 * Get.width)),
                  Text(motion.part,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 0.03 * Get.width)),
                ],
              ),
              Spacer(),
              Container(
                child: Text(motion.difficulty,
                    style: TextStyle(
                        color: Colors.white, fontSize: 0.028 * Get.width)),
                alignment: Alignment.center,
                height: Get.width * 0.055,
                padding: EdgeInsets.fromLTRB(Get.width * 0.02, Get.width * 0.01,
                    Get.width * 0.02, Get.width * 0.01),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ],
          ),
          padding: EdgeInsets.fromLTRB(Get.width * 0.02, Get.width * 0.018,
              Get.width * 0.02, Get.width * 0.01),
          height: Get.height * 0.057,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
          ),
        ),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 3)],
            color: Colors.black38,
            image: DecorationImage(
                image: NetworkImage(motion.imageUrl), fit: BoxFit.cover)),
      ),
    );
  }
}
