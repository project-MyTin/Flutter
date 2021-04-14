import 'package:get/get.dart';
import 'package:mytin/controllers/countdown_controller.dart';
import 'package:mytin/dummies/routine_detail_dummy.dart';
import 'package:flutter/material.dart';

class RoutineRunPage extends StatefulWidget {
  @override
  _RoutineRunPageState createState() => _RoutineRunPageState();
}

class _RoutineRunPageState extends State<RoutineRunPage> {
  CountdownController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        Get.put(CountdownController(routine.motions, routine.breakTime));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.shutdownCountdown();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return SafeArea(
      child: GetBuilder<CountdownController>(
        builder: (controller) => Scaffold(
          appBar: buildRoutineRunAppBar(
              controller.motionList[controller.index].name, height),
          body: Stack(
            children: [
              Column(
                children: <Widget>[
                  SizedBox(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topCenter,
                          child: Image.network(
                              controller.motionList[controller.index].imageUrl,
                              fit: BoxFit.cover,
                              width: 1 * width,
                              height: 0.55 * height),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: buildTimeProgressIndicator(
                            width,
                            height,
                            controller.currentTime,
                            controller.motionList[controller.index].count *
                                controller.motionList[controller.index].time,
                            Color.fromARGB(255, 100, 100, 100),
                            Colors.white,
                          ),
                        ),
                      ],
                    ),
                    width: width,
                    height: 0.64 * height,
                  ),
                  SizedBox(height: 0.03 * height),
                  Text(
                    controller.motionList[controller.index].name,
                    style: TextStyle(fontSize: 0.06 * width),
                  ),
                  Text(
                    controller.motionList[controller.index].count.toString() +
                        "회",
                    style: TextStyle(
                        fontSize: 0.05 * width,
                        color: Color.fromARGB(255, 100, 100, 100)),
                  ),
                  Spacer(),
                  buildRoutineRunBottomAppBar(controller.index + 1,
                      controller.motionCount, height, width),
                ],
              ),
              buildBreakTimeBody(controller.currentBreakTime,
                  controller.breakTime, controller.isBreakTime, height, width),
            ],
          ),
        ),
      ),
    );
  }

  Container buildBreakTimeBody(int currentBreakTime, int breakTime,
      bool isBreakTime, double height, double width) {
    if (isBreakTime) {
      return Container(
        color: Color.fromARGB(240, 40, 40, 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Break Time",
                style: TextStyle(
                    fontSize: 0.06 * width,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(isBreakTime ? 1 : 0)),
              ),
              SizedBox(height: 0.03 * height),
              buildTimeProgressIndicator(
                  width * 1.1,
                  height * 1.1,
                  currentBreakTime,
                  breakTime,
                  Colors.white,
                  Color.fromARGB(255, 40, 40, 40)),
              SizedBox(height: 0.04 * height),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _controller.addBreakTime(5),
                    child: Text("5초 연장하기"),
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.resolveWith(
                          (states) => Color.fromARGB(255, 40, 40, 40)),
                      shape: MaterialStateProperty.resolveWith((states) {
                        return RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                              color: Color.fromARGB(255, 40, 40, 40)),
                        );
                      }),
                    ),
                  ),
                  SizedBox(width: 0.08 * width),
                  TextButton(
                    onPressed: () => _controller.passBreakTime(),
                    child: Text("넘어가기"),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.resolveWith((states) {
                        return RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: Colors.grey),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Container buildRoutineRunBottomAppBar(
      int currentPart, int allPart, double height, double width) {
    return Container(
      color: Colors.grey,
      height: 0.06 * height,
      child: Row(
        children: <Widget>[
          Spacer(flex: 4),
          Text(
            currentPart.toString() + "/" + allPart.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 0.023 * height),
          ),
          Spacer(flex: 3),
          IconButton(
            onPressed: () => print("다음 파트로"),
            icon: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 0.06 * width,
            ),
          ),
        ],
      ),
    );
  }

  Container buildTimeProgressIndicator(double width, double height,
      int currentTime, int allTime, Color textColor, Color backgroundColor) {
    return Container(
      child: Stack(
        children: [
          SizedBox(
            child: CircularProgressIndicator(
              value: 1 - currentTime / allTime,
              strokeWidth: 18,
            ),
            width: 0.4 * width,
            height: 0.4 * width,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "time",
                  style: TextStyle(fontSize: 0.024 * height, color: textColor),
                ),
                Text(
                  currentTime.toString(),
                  style: TextStyle(
                    fontSize: 0.06 * height,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      width: 0.4 * width,
      height: 0.4 * width,
      decoration: BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
    );
  }

  PreferredSize buildRoutineRunAppBar(String title, double height) {
    return PreferredSize(
      preferredSize: Size.fromHeight(0.07 * height),
      child: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 0.024 * height, color: Colors.white),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(0.014 * height),
            child: TextButton(
              onPressed: () => print("종료하기"),
              child: Text(
                "   종료하기    ",
                style: TextStyle(fontSize: 0.015 * height, color: Colors.white),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.resolveWith((states) {
                  return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.white),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
