/*
 루틴 생성하기 & 자세히 보기에서 루틴에 해당하는 동작들의 리스트 뷰에 들어가는 커스텀 타일 위젯
 */
import 'package:flutter/material.dart';
import 'package:mytin/models/routine_detail.dart';
import 'package:mytin/widgets/image_circular.dart';

class MotionListTile extends StatelessWidget {
  MotionListTile(this.index, this.motion, this.height) : super(key: ValueKey(index));

  final int index;
  final double height;
  final MotionElement motion;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(index),
      child: ListTile(
        leading: ImageCircular(url: motion.imageUrl, diameter: 0.06 * height),
        title: Text(motion.name),
        subtitle: Text(motion.part),
        trailing: Text(motion.count.toString() + "회"),
      ),
      margin: EdgeInsets.all(0.005 * height),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color.fromARGB(255, 220, 220, 220)),
          borderRadius: BorderRadius.all(Radius.circular(15))),
    );
  }
}
