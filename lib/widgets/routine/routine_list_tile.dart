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
        routine.id = 25;
        final RoutineDetail routineDetail = await loadRoutineDetail(routine.id);
        Get.to(() => RoutineDetailPage(routineDetail));
      },
      child: Container(
        child: Row(
          children: [
            buildImageBox(Get.width),
            SizedBox(width: Get.width * 0.005),
            Container(
              width: 0.6 * Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(routine.name,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 0.044 * Get.width)),
                  SizedBox(height: Get.height * 0.002),
                  SizedBox(
                    width: Get.width * 0.57,
                    child: Text(
                      routine.description,
                      style: TextStyle(fontSize: 0.028 * Get.width),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 0.04 * Get.width),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildInfoColumn(
                          "소요시간", routine.time.toString() + "분", Get.width),
                      buildInfoColumn("난이도", routine.difficulty, Get.width),
                      buildInfoColumn(
                          "권한",
                          (routine.authority == Authority.admin) ? "공식" : "비공식",
                          Get.width),
                      buildInfoColumn("유형", routine.type, Get.width),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
        borderRadius: BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
            image: NetworkImage(routine.imageUrl), fit: BoxFit.cover),
      ),
      margin: EdgeInsets.all(0.022 * width),
      height: 0.26 * width,
      width: 0.26 * width,
    );
  }

  Column buildInfoColumn(String key, String value, double width) {
    return Column(
      children: [
        Text(key, style: TextStyle(fontSize: 0.022 * width, color: Colors.grey)),
        Text(value, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
