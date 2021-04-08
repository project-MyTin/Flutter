import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mytin/models/motion_time.dart';


class RoutineRunPage extends StatefulWidget {
  RoutineRunPage({Key key}) : super(key: key);

  @override
  _RoutineRunPageState createState() => _RoutineRunPageState();
}

class _RoutineRunPageState extends State<RoutineRunPage> {

  // 더미 데이터
  static List<MotionTime> motions = [
    MotionTime.fromMap({
      "motionTime": 2,
      "motionUrl": "https://buddhayana2018504915002.files.wordpress.com/2018/11/417.jpg?w=500",
      "motionName": "산에서 명상",
      "motionCount": 3
    }),
    MotionTime.fromMap({
      "motionTime": 4,
      "motionUrl": "https://t1.daumcdn.net/cfile/tistory/252D9B3F549283D10D",
      "motionName": "흑백에서 명상",
      "motionCount": 2
    }),
    MotionTime.fromMap({
      "motionTime": 3,
      "motionUrl": "https://i.ytimg.com/vi/uPOarntFwCA/hqdefault.jpg",
      "motionName": "일어서서 명상",
      "motionCount": 2
    }),
    MotionTime.fromMap({
      "motionTime": 3,
      "motionUrl": "https://t1.daumcdn.net/cfile/blog/223DA54A55AD1B9B39",
      "motionName": "나무 등지고 명상",
      "motionCount": 3
    })
  ];

  int currentPart = 1;
  int allPart = motions.length;
  int currentTime = motions[0].motionTime * motions[0].motionCount;
  String motionUrl = "https://www.korea.kr/newsWeb/resources/attaches/namo/2010.10/26/8216/PYH2010101603890001300.jpg";
  Timer timer;

  void _motionTimer() {
    const oneSec = Duration(seconds:1);
    timer = Timer.periodic(oneSec, (Timer t){
      if(currentTime < 1) {
        if(currentPart == allPart) {
          currentPart = allPart;
          t.cancel();
          print("타이머 끝이여");
          return;
        }
        if(currentPart < allPart) {
          currentPart++;
        }
        setState(() {
          currentTime = motions[currentPart - 1].motionTime * motions[currentPart - 1].motionCount;
          motionUrl = motions[currentPart - 1].motionUrl;
        });
      }else {
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
    double width = screenSize.width,
          height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.07 * height),
          child: AppBar(
            title: Text(
              motions[currentPart - 1].motionName,
              style: TextStyle(
                fontSize: 0.024 * height,
                color: Colors.white
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.all(0.014 * height),
                child: TextButton(
                  onPressed: () => print("종료하기"),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0.03 * width, 0, 0.03 * width, 0),
                    child: Text(
                      "종료하기",
                      style: TextStyle(
                        fontSize: 0.015 * height,
                        color: Colors.white
                      ),
                    ),
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
        ),
        body: Column(
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
                    child: Container(
                      child: SizedBox(
                        child: CircularProgressIndicator(
                          value:  1 - currentTime
                              / (motions[currentPart - 1].motionTime * motions[currentPart - 1].motionCount),
                          strokeWidth: 16,
                        ),
                        width: 0.4 * width,
                        height: 0.4 * width,
                      ),
                      width: 0.4 * width,
                      height: 0.4 * width,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                            "time",
                          style: TextStyle(
                          ),
                        ),
                        Text(
                            currentTime.toString()
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              width: width,
              height: 0.5 * height,
            ),
            Container(
              child: Text(
                "남은시간",
                style: TextStyle(
                    fontSize: 0.05 * width
                ),
              ),
              padding: EdgeInsets.fromLTRB(0, 0.02 * height, 0, 0 * height),
            ),
            Padding(
              padding: EdgeInsets.all(0.04 * width),
              child: Text(
                (currentTime~/60).toString() + ' : ' + (currentTime%60).toString(),
                style: TextStyle(
                  fontSize: 0.15 * width,
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                print("다음으로 넘어가기!");
                timer.cancel();
                setState(() {
                  currentPart = currentPart < allPart? currentPart+1 : currentPart;
                  currentTime = motions[currentPart - 1].motionTime;
                  motionUrl = motions[currentPart - 1].motionUrl;
                });
                _motionTimer();
              },
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 0.06 * height,
                    width: 0.6 * width,
                    child: LinearProgressIndicator(
                      value: 1 - currentTime
                          / (motions[currentPart - 1].motionTime * motions[currentPart - 1].motionCount),
                    ),
                  ),
                  Text(
                    "다음으로 넘어가기",
                    style: TextStyle(
                        fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Text(currentPart.toString() + '/' + allPart.toString()),
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}