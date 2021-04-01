import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mytin/models/motion_time.dart';


class RoutineRunPage extends StatefulWidget {
  RoutineRunPage({Key key}) : super(key: key);

  @override
  _RoutineRunPageState createState() => _RoutineRunPageState();
}

class _RoutineRunPageState extends State<RoutineRunPage> {
  static List<MotionTime> motions = [
    MotionTime.fromMap({
      "motionTime": 6,
      "motionUrl": "https://buddhayana2018504915002.files.wordpress.com/2018/11/417.jpg?w=500",
      "motionName": "산에서 명상"
    }),
    MotionTime.fromMap({
      "motionTime": 4,
      "motionUrl": "https://t1.daumcdn.net/cfile/tistory/252D9B3F549283D10D",
      "motionName": "흑백에서 명상"
    }),
    MotionTime.fromMap({
      "motionTime": 5,
      "motionUrl": "https://i.ytimg.com/vi/uPOarntFwCA/hqdefault.jpg",
      "motionName": "일어서서 명상"
    }),
    MotionTime.fromMap({
      "motionTime": 7,
      "motionUrl": "https://t1.daumcdn.net/cfile/blog/223DA54A55AD1B9B39",
      "motionName": "나무 등지고 명상"
    })
  ];
  int currentPart = 1,
      allPart = motions.length,
      currentTime = motions[0].motionTime;
  String motionUrl = "https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F99EF554E5AEE774505";
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
          currentTime = motions[currentPart - 1].motionTime;
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
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0.005 * width, 0.005 * height, 0.07 * height),
              child: Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  onPressed: () => print("페이지 나가기 함수"),
                  child: Text(
                    '루틴 종료하기',
                    style: TextStyle(
                        fontSize: 0.035 * width,
                        color: Colors.black
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.lightBlue;
                        return Colors.white;
                      },
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Text(
                '$currentPart번째 동작 / 총 $allPart개',
                style: TextStyle(
                  fontSize: 0.06 * width,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: EdgeInsets.fromLTRB(0, 0 * height, 0, 0.02 * height),
            ),
            Container(
              child: Image.network(motionUrl),
              width: 0.95 * width,
              height: 0.35 * height,
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
                      value: 1 - currentTime/motions[currentPart - 1].motionTime,
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
          ],
        ),
      ),
    );
  }
}