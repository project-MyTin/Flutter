/*
 버튼 역할을 하는 하단 앱 바를 만드는 위젯
 */
import 'package:flutter/material.dart';

class ButtonBottomAppBar extends StatelessWidget {
  final Function clickFunc;
  final String text;
  final bool isShow;

  ButtonBottomAppBar({this.clickFunc, this.isShow, this.text});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return Container(
      width: isShow ? width : 0,
      height: isShow ? 0.07 * height : 0,
      color: Colors.grey,
      child: TextButton(
        child: Text(text,
            style: TextStyle(color: Colors.white, fontSize: 0.02 * height)),
        onPressed: () => clickFunc(),
      ),
    );
  }
}
