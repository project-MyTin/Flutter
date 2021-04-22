import 'package:flutter/material.dart';

class TextInputBox extends StatelessWidget {
  final String text;
  final int line;

  TextInputBox(this.text, this.line);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return Column(
      children: [
        SizedBox(height: 0.01 * height),
        SizedBox(
          child: TextField(
            maxLines: line,
            decoration: InputDecoration(
              hintText: text,
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey, width: 0.0),
              ),
              hintStyle:
              TextStyle(fontSize: 0.02 * height, color: Colors.black26),
            ),
            textAlignVertical: TextAlignVertical.center,
          ),
          height: 0.06 * height + 0.025 * (line - 1) * height,
          width: 0.8 * width,
        ),
        SizedBox(height: 0.025 * height),
      ],
    );
  }
}
