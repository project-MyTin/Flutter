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
                    Icon(
                      Icons.keyboard_backspace,
                      color: Colors.white,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Routine",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 0.08 * width
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () => print("누름"),
                            child: Text("내 루틴 등록하기")
                        ),
                      ],
                    ),
                    Text(
                      "Share your routine with people",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 0.04 * width
                      ),
                    ),
                  ],
                ),
                color: Colors.lightBlue,
              ),
            ),
            ListView.separated(
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    title: Text(index.toString()),
                  );
                },
                separatorBuilder: (context, index) {
                  if (index == 0) return SizedBox.shrink();
                  return const Divider();
                },
                itemCount: 2,
            )
          ],
        ),
      ),
    );
  }
}

