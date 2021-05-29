/*
 다음 페이지로 넘어가는 플로팅 버튼 위젯
 */
import 'package:flutter/material.dart';

class NextPageFloatingButton extends StatelessWidget {
  final Function nextPageFunc;

  NextPageFloatingButton(this.nextPageFunc);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return Container(
      padding: EdgeInsets.fromLTRB(0, 0.035 * height, 0.08 * width, 0),
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        onPressed: () => nextPageFunc(),
        child: Icon(Icons.arrow_forward_ios),
        foregroundColor: Colors.white,
      ),
    );
  }
}
