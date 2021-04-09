import 'dart:async';
import 'package:mytin/dummies/motion_time_dummy.dart';
import 'package:flutter/material.dart';
// import 'package:mytin/models/motion_time.dart';

class RoutineRunPage extends StatefulWidget {
  RoutineRunPage({Key key}) : super(key: key);

  @override
  _RoutineRunPageState createState() => _RoutineRunPageState();
}

class _RoutineRunPageState extends State<RoutineRunPage> {
  int currentPart = 1;
  int allPart = motions.length;
  int currentTime = motions[0].motionTime * motions[0].motionCount;
  int breakTime = 10;
  int currentBreakTime = 10;
  bool isBreakTime = false;
  String motionUrl =
      "https://www.korea.kr/newsWeb/resources/attaches/namo/2010.10/26/8216/PYH2010101603890001300.jpg";
  Timer timer;

  void _motionTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (Timer t) {
      if (currentTime < 1) {
        // 루틴 시간이 끝났을 경우(남은 휴식 시간이 0 이하 && 남은 루틴 시간이 0 이하)
        if (currentPart == allPart) {
          // 루틴 시간이 끝난 것이 마지막 파트인 경우 => 종료
          t.cancel();
        } else if (currentBreakTime < 1) {
          // 휴식 시간도 끝난 경우 => 다음 파트로
          setState(() {
            currentPart++;
            isBreakTime = false;
            motionUrl = motions[currentPart - 1].motionUrl;
            currentTime = motions[currentPart - 1].motionTime *
                motions[currentPart - 1].motionCount;
            currentBreakTime = breakTime;
          });
        } else {
          // 휴식 시간은 안 끝난 경우
          setState(() {
            isBreakTime = true;
            // print(currentBreakTime--);
          });
        }
      } else {
        // 루틴 시간이 안 끝난 경우
        setState(() {
          print(currentTime--);
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _motionTimer();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        appBar: buildRoutineRunAppBar(height),
        body: Stack(
          children: [
            Column(
              children: <Widget>[
                SizedBox(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topCenter,
                        child: Image.network(motionUrl),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: buildTimeProgressIndicator(width, height),
                      ),
                    ],
                  ),
                  width: width,
                  height: 0.64 * height,
                ),
                SizedBox(height: 0.03 * height),
                Text(
                  motions[currentPart - 1].motionName,
                  style: TextStyle(fontSize: 0.06 * width),
                ),
                Text(
                  motions[currentPart - 1].motionCount.toString() + "회",
                  style: TextStyle(
                      fontSize: 0.05 * width,
                      color: Color.fromARGB(255, 100, 100, 100)),
                ),
                Spacer(),
                buildRoutineRunBottomAppBar(height, width),
              ],
            ),
            buildBreakTimeBody(isBreakTime, height, width),
          ],
        ),
      ),
    );
  }

  Container buildBreakTimeBody(bool isBreakTime, double height, double width) {
    if (isBreakTime) {
      return Container(
        color: Color.fromARGB(230, 40, 40, 40),
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
              Container(
                child: Stack(
                  children: [
                    SizedBox(
                      child: CircularProgressIndicator(
                        value: 1 -
                            currentTime /
                                (motions[currentPart - 1].motionTime *
                                    motions[currentPart - 1].motionCount),
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
                            style: TextStyle(
                                fontSize: 0.024 * height, color: Colors.white),
                          ),
                          Text(
                            currentTime.toString(),
                            style: TextStyle(
                              fontSize: 0.06 * height,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                width: 0.4 * width,
                height: 0.4 * width,
                decoration: BoxDecoration(shape: BoxShape.circle),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Container buildRoutineRunBottomAppBar(double height, double width) {
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

  Container buildTimeProgressIndicator(double width, double height) {
    return Container(
      child: Stack(
        children: [
          SizedBox(
            child: CircularProgressIndicator(
              value: 1 -
                  currentTime /
                      (motions[currentPart - 1].motionTime *
                          motions[currentPart - 1].motionCount),
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
                  style: TextStyle(fontSize: 0.024 * height),
                ),
                Text(
                  currentTime.toString(),
                  style: TextStyle(
                      fontSize: 0.06 * height,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 100, 100, 100)),
                ),
              ],
            ),
          ),
        ],
      ),
      width: 0.4 * width,
      height: 0.4 * width,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
    );
  }

  PreferredSize buildRoutineRunAppBar(double height) {
    return PreferredSize(
      preferredSize: Size.fromHeight(0.07 * height),
      child: AppBar(
        title: Text(
          motions[currentPart - 1].motionName,
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
