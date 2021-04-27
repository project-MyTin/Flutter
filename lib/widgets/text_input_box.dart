/*
 루틴 & 동작 생성시 사용되는 입력 폼
 @hint : 입력 폼에 보여질 힌트 텍스트
 @text : 입력 폼에 채워져 있는 텍스트
 @type : 입력 폼에서 입력받는 값의 종류
 @line : 입력 폼의 크기(line)
 @inputFunc : 입력 폼에 값이 수정됬을 때(onChanged) 실행할 함수(이벤트 핸들러)
 */
import 'package:flutter/material.dart';

class TextInputBox extends StatelessWidget {
  final String hint, text, type;
  final int line;
  final double widthSize;
  final Function inputFunc;

  TextInputBox(
      {this.hint,
      this.text,
      this.line,
      this.widthSize,
      this.inputFunc,
      this.type});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return Column(
      children: [
        SizedBox(height: 0.01 * height),
        SizedBox(
          child: TextFormField(
            keyboardType: (["time", "count", "breakTime"].contains(type))
                ? TextInputType.number
                : (type == "url") ? TextInputType.url : TextInputType.text,
            maxLines: line,
            decoration: InputDecoration(
              hintText: hint,
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey, width: 0.0),
              ),
              hintStyle:
                  TextStyle(fontSize: 0.02 * height, color: Colors.black26),
            ),
            initialValue: text,   // 처음 채우는 값
            textAlignVertical: TextAlignVertical.bottom,
            onChanged: (newText) => inputFunc(type, newText),
          ),
          height: 0.06 * height + 0.03 * (line - 1) * height,
          width: widthSize * width,
        ),
        SizedBox(height: 0.025 * height),
      ],
    );
  }
}
