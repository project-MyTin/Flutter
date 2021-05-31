/*
 루틴 조회하기 페이지(리스트뷰)에 들어가는 커스텀 타일 위젯
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/models/routine_detail.dart';
import 'package:mytin/models/routine_tile.dart';
import 'package:mytin/screens/routine/screen_routine_detail.dart';
import 'package:mytin/services/routine/get_routine_detail.dart';

class RoutineListTile extends StatelessWidget {
  final RoutineTile routine;

  RoutineListTile(this.routine);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final RoutineDetail routineDetail = await loadRoutineDetail(routine.id);
        Get.to(() => RoutineDetailPage(routineDetail));
      },
      child: Container(
        child: Row(
          children: [
            buildImageBox(Get.width),
            SizedBox(width: Get.width * 0.005),
            Container(
              padding: EdgeInsets.only(
                  top: Get.height * 0.005, left: Get.width * 0.02),
              width: 0.64 * Get.width,
              height: 0.12 * Get.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(routine.name,
                          style: TextStyle(fontSize: 0.02 * Get.height)),
                      Spacer(),
                      Icon(Icons.star,
                          color: Colors.yellow, size: Get.width * 0.04),
                      Text(routine.difficulty),
                      SizedBox(width: Get.width * 0.03),
                      Text(
                        routine.type,
                        style: TextStyle(
                            fontSize: 0.016 * Get.height,
                            color: Colors.grey.withOpacity(0.6)),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.004),
                  SizedBox(
                    width: Get.width * 0.57,
                    child: Text(
                      routine.description?? "",
                      style: TextStyle(
                          fontSize: 0.016 * Get.height, color: Colors.grey),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        padding: EdgeInsets.all(0.022 * Get.width),
        margin: EdgeInsets.fromLTRB(
            Get.height * 0.02, Get.height * 0.008, Get.height * 0.02, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }

  Container buildImageBox(double width) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        image: DecorationImage(
            image: NetworkImage(routine.imageUrl !=
                    "https://mytin-bucket.s3.ap-northeast-2.amazonaws.com/test_image_path"
                ? routine.imageUrl
                : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIb3xwXMfx9yqNX1blthyTmMJgPZT-gk1ptSnQH2mLESyhz5tmdihQJqi2kDsgp8cfQQM&usqp=CAU"),
            fit: BoxFit.cover),
      ),
      height: 0.22 * width,
      width: 0.22 * width,
    );
  }
}
