import 'package:flutter/material.dart';

class RoutineListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width,
        height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("루틴 리스트 페이지"),
        // ),
        body: Column(
          children: <Widget>[

            Container(
              child: Text(""),
            ),
          ],
        ),
      ),
    );
  }
}

