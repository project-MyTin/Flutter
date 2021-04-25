/*
 원형의 버튼 박스를 만드는 위젯
 ex. 루틴 & 동작 생성하기 페이지에서 난이도 입력 버튼을 만들때 사용
 */
import 'package:flutter/material.dart';

class CircleButtonBox extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function function;

  CircleButtonBox(this.text, this.isSelected, this.function);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return GestureDetector(
        child: Container(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(fontSize: 0.022 * height, color: isSelected ? Colors.white : Colors.black87),
          ),
          width: 0.24 * width,
          height: 0.24 * width,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? Colors.black54 : Colors.black12),
        ),
      onTap: () => function(text),
    );
  }
}
