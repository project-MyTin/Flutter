import 'package:flutter/material.dart';

class AddFloatingButton extends StatelessWidget {
  final Function addFunc;

  AddFloatingButton(this.addFunc);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0.01 * height),
      child: SizedBox(
        child: FloatingActionButton(
          child: Icon(
            Icons.add_rounded,
            color: Colors.white,
            size: 0.09 * width,
          ),
          onPressed: () => addFunc(),
          backgroundColor: Color.fromARGB(255, 40, 40, 40),
        ),
        width: 0.15 * width,
        height: 0.15 * width,
      ),
    );
  }
}
