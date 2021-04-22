import 'package:flutter/material.dart';

class CircleButtonBox extends StatefulWidget {
  final String text;

  CircleButtonBox(this.text);

  @override
  _CircleButtonBoxState createState() => _CircleButtonBoxState();
}

class _CircleButtonBoxState extends State<CircleButtonBox> {
  bool isSelected = false;
  void toggle() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          widget.text,
          style: TextStyle(fontSize: 0.022 * height, color: isSelected ? Colors.white : Colors.black87),
        ),
        width: 0.24 * width,
        height: 0.24 * width,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? Colors.black54 : Colors.black12),
      ),
      onTap: toggle,
    );
  }
}
