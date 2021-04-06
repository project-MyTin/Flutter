import 'package:flutter/material.dart';

class RoutineDetail extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width,
        height = screenSize.height;

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(""),
          ),
        )
    );
  }
}
