/*
 동작 조회하기 페이지(그리드 뷰)에 들어가는 커스텀 타일 위젯
 */
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mytin/models/motion_tile.dart';

class MotionGridTile extends StatelessWidget {
  final MotionTile motion;
  final Function clickFunc;
  final int index;
  final bool isClick;

  MotionGridTile(this.index, this.motion, this.clickFunc, this.isClick) : super(key: ValueKey(index));

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;

    return GestureDetector(
      onTap: () => clickFunc(index),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(motion.name,
                style: TextStyle(color: Colors.white, fontSize: 0.04 * width)),
            Text(motion.part,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 0.03 * width)),
            Expanded(child: Container()),
            buildDifficultyBox(width),
          ],
        ),
        padding: EdgeInsets.all(0.02 * width),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 1,
              spreadRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
          image: DecorationImage(
              image: NetworkImage(motion.imageUrl),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  isClick ? Colors.white.withOpacity(0.7) : Colors.black.withOpacity(0.3), BlendMode.darken)),
        ),
      ),
    );
  }

  Container buildDifficultyBox(double width) {
    return Container(
      child: Text(motion.difficulty,
          style: TextStyle(color: Colors.white, fontSize: 0.025 * width)),
      alignment: Alignment.center,
      height: 0.04 * width,
      width: 0.07 * width,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.all(Radius.circular(3)),
      ),
    );
  }
}
