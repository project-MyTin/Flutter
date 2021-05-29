/*
 동작 조회하기 페이지(그리드 뷰)에 들어가는 커스텀 타일 위젯
 */
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/routine_add_controller.dart';
import 'package:mytin/models/motion_tile.dart';

class MotionSelectTile extends StatelessWidget {
  final MotionTile motion;
  final int index;

  MotionSelectTile(this.index, this.motion) : super(key: ValueKey(index));

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RoutineAddController>(
      builder: (ctr) => GestureDetector(
          onTap: () => ctr.select(index),
          child: Column(
            children: [
              Container(
                height: Get.height * 0.135,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.teal,
                        spreadRadius: ctr.selectIndex == index ? 2 : 0)
                  ],
                  image: DecorationImage(
                    image: NetworkImage(motion.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.008),
              Text(
                motion.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: Get.height * 0.018,
                    color: ctr.selectIndex == index
                        ? Colors.teal
                        : Colors.black.withOpacity(0.6)),
              ),
            ],
          )),
    );
  }
}
