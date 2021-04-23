import 'package:flutter/material.dart';

class ButtonBox extends StatelessWidget {
  final String name;
  final bool isSelected;
  final Function function;

  ButtonBox(this.name, this.isSelected, this.function);

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
            name,
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
        onTap: () => function(name),
    );
  }
}
