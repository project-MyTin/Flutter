import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mytin/widgets/page_bottom_navigation_bar.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              buildMainPageHeader(height, width),
            ],
          ),
        ),
        bottomNavigationBar: PageBottomNavigationBar(1),
      ),
    );
  }

  Container buildMainPageHeader(double height, double width) {
    return Container(
      width: width,
      height: 0.4 * height,
      child: Column(
            children: [
              SizedBox(height: 0.09 * height),
              Text("안녕하세요!", style: TextStyle(color: Colors.white, fontSize: 0.03 * height)),
              SizedBox(height: 0.02 * height),
              Text("포근해지는 날씨를 따라서,", style: TextStyle(color: Colors.white, fontSize: 0.022 * height), textAlign: TextAlign.center,),
              Text("오늘도 새로운 루틴과 동작이 추가되었어요", style: TextStyle(color: Colors.white, fontSize: 0.022 * height), textAlign: TextAlign.center,),
              SizedBox(height: 0.03 * height),
              Text("한번 활기차게 운동해볼까요?", style: TextStyle(color: Colors.white, fontSize: 0.024 * height)),
            ],
          ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.indigo,
            Colors.deepPurple
          ]
        ),
      ),
    );
  }
}
