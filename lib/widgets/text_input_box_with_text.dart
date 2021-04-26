/*
 루틴 & 동작 생성시 사용되는 입력 폼 + 텍스트 라벨까지 추가한 위젯
 @title : 텍스트 제목
 @subTitle : 텍스트 부제목
 @numberType : 텍스트(입력 폼) 뒤에 붙는 단위 명
 (아래는 TextInputBox 에 쓰이는 속성과 동일)
 @hint : 입력 폼에 보여질 힌트 텍스트
 @text : 입력 폼에 채워져 있는 텍스트
 @type : 입력 폼에서 입력받는 값의 종류
 @line : 입력 폼의 크기(line)
 @inputFunc : 입력 폼에 값이 수정됬을 때(onChanged) 실행할 함수(이벤트 핸들러)
 */
import 'package:flutter/material.dart';
import 'package:mytin/widgets/text_input_box.dart';

class TextInputBoxWithText extends StatelessWidget {
  final String title, subTitle, hint, text, type, numberType;
  final int line;
  final double widthSize;
  final Function inputFunc;

  TextInputBoxWithText(
      {this.title,
      this.subTitle,
      this.hint,
      this.text,
      this.type,
      this.line,
      this.widthSize,
      this.inputFunc,
      this.numberType});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0.02 * height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 0.02 * height)),
              Text(subTitle,
                  style: TextStyle(fontSize: 0.015 * height, color: Colors.grey)),
            ],
          ),
        ),
        Row(
            children: [
              TextInputBox(
                hint: hint,
                text: text,
                inputFunc: inputFunc,
                line: line,
                widthSize: widthSize,
                type: type,
              ),
              Text("  ($numberType)", style: TextStyle(color: Colors.black54)),
            ],
          ),
      ],
    );
  }
}
