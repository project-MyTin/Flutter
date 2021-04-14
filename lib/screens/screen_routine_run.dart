import 'dart:async';
import 'package:mytin/dummies/routine_detail_dummy.dart';
import 'package:flutter/material.dart';

class RoutineRunPage extends StatefulWidget {
  RoutineRunPage({Key key}) : super(key: key);

  @override
  _RoutineRunPageState createState() => _RoutineRunPageState();
}

class _RoutineRunPageState extends State<RoutineRunPage> {
  int currentPart = 1;
  int allPart = routine.motions.length;
  int currentTime = routine.motions[0].time * routine.motions[0].count;
  int breakTime = 10 + 1;
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
            motionUrl = routine.motions[currentPart - 1].imageUrl;
            currentTime = routine.motions[currentPart - 1].time *
                routine.motions[currentPart - 1].count;
            currentBreakTime = breakTime;
          });
        } else {
          // 휴식 시간은 안 끝난 경우
          setState(() {
            isBreakTime = true;
            print(currentBreakTime--);
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
                        child: Image.network(motionUrl,
                            fit: BoxFit.cover,
                            width: 1 * width,
                            height: 0.55 * height),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: buildTimeProgressIndicator(
                            width,
                            height,
                            currentTime,
                            (routine.motions[currentPart - 1].time *
                                routine.motions[currentPart - 1].count),
                            Color.fromARGB(255, 100, 100, 100),
                            Colors.white),
                      ),
                    ],
                  ),
                  width: width,
                  height: 0.64 * height,
                ),
                SizedBox(height: 0.03 * height),
                Text(
                  routine.motions[currentPart - 1].name,
                  style: TextStyle(fontSize: 0.06 * width),
                ),
                Text(
                  routine.motions[currentPart - 1].count.toString() + "회",
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
                    onPressed: () {
                      setState(() {
                        currentBreakTime += 5;
                      });
                    },
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
                    onPressed: () {
                      setState(() {
                        currentBreakTime = 0;
                      });
                    },
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

  PreferredSize buildRoutineRunAppBar(double height) {
    return PreferredSize(
      preferredSize: Size.fromHeight(0.07 * height),
      child: AppBar(
        title: Text(
          routine.motions[currentPart - 1].name,
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
