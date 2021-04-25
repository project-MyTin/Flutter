/*
 루틴 & 동작 생성하기 페이지에서 등록하기 & 수정하기 하단 앱 바를 만드는 위젯
 */
import 'package:flutter/material.dart';

class SubmitBottomAppBar extends StatelessWidget {
  final Function submitFunc;
  final bool isShow, isAdd;

  SubmitBottomAppBar({this.submitFunc, this.isShow, this.isAdd});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return Container(
        width: isShow ? width : 0,
        height: isShow ? 0.07 * height : 0,
        color: Colors.grey,
        child: TextButton(
          child: Text(
            isAdd ? "등록 하기" : "수정 하기",
            style: TextStyle(color: Colors.white, fontSize: 0.02 * height),
          ),
          onPressed: () => submitFunc(),
        ),
      );
  }
}
