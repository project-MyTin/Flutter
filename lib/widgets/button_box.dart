import 'package:flutter/material.dart';

class ButtonBox extends StatelessWidget {
  final String name;

  ButtonBox(this.name);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;

    return Container(
      margin: EdgeInsets.all(0.01 * width),
      padding: EdgeInsets.fromLTRB(
          0.05 * width, 0.02 * width, 0.05 * width, 0.02 * width),
      child: Text(name),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.6,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
    );
  }
}
