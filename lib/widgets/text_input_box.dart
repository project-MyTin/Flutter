import 'package:flutter/material.dart';

class TextInputBox extends StatelessWidget {
  final String hint, text, type;
  final int line;
  final Function function;

  TextInputBox(this.hint, this.text, this.line, this.function, this.type);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return Column(
      children: [
        SizedBox(height: 0.01 * height),
        SizedBox(
          child: TextFormField(
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
            textAlignVertical: TextAlignVertical.center,
            onChanged: (newText) => function(type, newText),
          ),
          height: 0.06 * height + 0.025 * (line - 1) * height,
          width: 0.8 * width,
        ),
        SizedBox(height: 0.025 * height),
      ],
    );
  }
}
