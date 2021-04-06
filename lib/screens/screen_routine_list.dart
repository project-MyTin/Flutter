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
            SizedBox(
              width: width,
              height: height * 0.2,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.keyboard_backspace),
                    Row(
                      children: <Widget>[
                        Text("Routine"),
                        ElevatedButton(
                            onPressed: () => print("누름"),
                            child: Text("내 루틴 등록하기")
                        ),
                      ],
                    ),
                  ],
                ),
                color: Colors.lightBlue,
              ),
            ),
            Text("ㅎㅎ"),
          ],
        ),
      ),
    );
  }
}

