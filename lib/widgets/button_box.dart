import 'package:flutter/material.dart';

class ButtonBox extends StatefulWidget {
  final String name;
  // final Function func;

  ButtonBox(this.name);

  @override
  _ButtonBoxState createState() => _ButtonBoxState();
}

class _ButtonBoxState extends State<ButtonBox> {
  bool isSelected = false;
  void toggle() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;

    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(0.01 * width),
        padding: EdgeInsets.fromLTRB(
            0.05 * width, 0.02 * width, 0.05 * width, 0.02 * width),
        child: Text(
          widget.name,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black87),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: isSelected ? Colors.black54 : Colors.white,
          boxShadow: [
            if (!isSelected)
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.6,
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
          ],
        ),
      ),
      onTap: toggle
    );
  }
}
