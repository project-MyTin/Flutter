import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/bottom_page_controller.dart';
import 'package:mytin/dummies/routine_list_dummy.dart';
import 'package:mytin/screens/screen_routine_and_motion.dart';
import 'package:mytin/widgets/page_bottom_navigation_bar.dart';
import 'package:mytin/widgets/routine/routine_list_tile.dart';
import 'package:mytin/widgets/wave_wrapper.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;
    Get.put(BottomPageController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              buildMainPageHeader(height, width),
              buildWaveStack(height, width),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    0.05 * width, 0.04 * height, 0.06 * width, 0.015 * height),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("새로운 루틴", style: TextStyle(fontSize: 0.023 * height)),
                    GestureDetector(
                      child: Text("more +",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 0.021 * height,
                              fontWeight: FontWeight.bold)),
                      onTap: () => Get.to(RoutineAndMotionPage()),
                    )
                  ],
                ),
              ),
              for (int i = 0; i < routineList.length; i++)
                RoutineListTile(routineList[i]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PageBottomNavigationBar(),
    );
  }

  Stack buildWaveStack(double height, double width) {
    final List waveList = [
      [0.3, -50.0, 1, true],
      [0.2, -120.0, 3, true],
      [0.4, width - 50.0, 3, false],
      [1.0, 0.0, 1, true],
    ];

    return Stack(
      children: [
        for (List list in waveList)
          Container(
            child: Wave(
              colorList: [
                list[3]
                    ? Colors.cyanAccent.withOpacity(list[0])
                    : Colors.lightBlue.withOpacity(list[0]),
                Colors.lightBlue.withOpacity(list[0])
              ],
              startIndex: list[2],
              waveHeight: 40,
              waveWidth: 1,
              height: 0.08 * height,
              width: width,
            ),
            transform: Matrix4.translationValues(list[1], 0, 0),
          ),
      ],
    );
  }

  Container buildMainPageHeader(double height, double width) {
    return Container(
      width: width,
      height: 0.5 * height,
      child: Column(
        children: [
          SizedBox(height: 0.05 * height),
          SvgPicture.asset("images/undraw_fitness_tracker_3033.svg",
              height: 0.2 * height),
          SizedBox(height: 0.04 * height),
          Text("안녕하세요!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 0.03 * height,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 0.01 * height),
          Text(
            "포근해지는 날씨를 맞아,",
            style: TextStyle(color: Colors.white, fontSize: 0.02 * height),
            textAlign: TextAlign.center,
          ),
          Text(
            "오늘도 새로운 루틴과 동작이 추가되었어요",
            style: TextStyle(color: Colors.white, fontSize: 0.02 * height),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 0.02 * height),
          Text("이번에도 한번 힘내서 운동해볼까요?",
              style: TextStyle(color: Colors.white, fontSize: 0.022 * height)),
          SizedBox(height: 0.01 * height),
        ],
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.cyanAccent,
            Colors.lightBlue,
          ],
        ),
      ),
    );
  }
}
