/*
 루틴 생성하기 & 자세히 보기에서 루틴에 해당하는 동작들의 리스트 뷰에 들어가는 커스텀 타일 위젯
 */
import 'package:flutter/material.dart';
import 'package:mytin/models/routine_detail.dart';

class MotionListTile extends StatelessWidget {
  MotionListTile(this.index, this.motion, this.height, this.deleteFunc)
      : super(key: ValueKey(index));

  final int index;
  final double height;
  final Function deleteFunc;
  final MotionElement motion;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(index),
      child: Row(
        children: [
          Container(
            height: height * 0.08,
            width: height * 0.08,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                    image: NetworkImage(motion.imageUrl), fit: BoxFit.cover)),
          ),
          SizedBox(width: 0.012 * height),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(motion.name, style: TextStyle(fontSize: 0.022 * height)),
              SizedBox(height: 0.005 * height),
              Text(motion.part, style: TextStyle(fontSize: 0.014 * height)),
            ],
          ),
          Spacer(),
          Text(motion.time.toString() + "초",
              style: TextStyle(fontSize: 0.02 * height)),
          Text(" X " + motion.count.toString() + "회",
              style: TextStyle(color: Colors.grey, fontSize: 0.014 * height)),
          if (deleteFunc != null)
            GestureDetector(
              child: Padding(
                padding:
                    EdgeInsets.fromLTRB(0.01 * height, 0, 0.005 * height, 0),
                child: Icon(Icons.delete, color: Colors.black.withOpacity(0.7)),
              ),
              onTap: () => deleteFunc(index),
            ),
        ],
      ),
      margin: EdgeInsets.only(bottom: height * 0.01),
      padding: EdgeInsets.all(0.01 * height),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
              spreadRadius: 0.5,
              offset: Offset(0, 2),
              color: Colors.grey.withOpacity(0.5))
        ],
      ),
    );
  }
}
