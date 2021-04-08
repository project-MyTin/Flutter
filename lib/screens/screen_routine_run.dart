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
      "motionUrl":
      "https://buddhayana2018504915002.files.wordpress.com/2018/11/417.jpg?w=500",
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
      "motionUrl": "https://www.sglba.org.au/wp-content/uploads/2017/05/PLACEHOLDER-Blog-600-x700-pixels.png",
      "motionName": "나무 등지고 명상",
      "motionCount": 3
    })
  ];

  int currentPart = 1;
  int allPart = motions.length;
  int currentTime = motions[0].motionTime * motions[0].motionCount;
  String motionUrl =
      "https://www.korea.kr/newsWeb/resources/attaches/namo/2010.10/26/8216/PYH2010101603890001300.jpg";
  Timer timer;

  void _motionTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (Timer t) {
      if (currentTime < 1) {
        if (currentPart == allPart) {
          currentPart = allPart;
          t.cancel();
          print("타이머 끝이여");
          return;
        }
        if (currentPart < allPart) {
          currentPart++;
        }
        setState(() {
          currentTime = motions[currentPart - 1].motionTime *
              motions[currentPart - 1].motionCount;
          motionUrl = motions[currentPart - 1].motionUrl;
        });
      } else {
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
    Size screenSize = MediaQuery
        .of(context)
        .size;
    double width = screenSize.width,
        height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
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
                    style: TextStyle(
                        fontSize: 0.015 * height, color: Colors.white),
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
                    // width: width,
                    // height: width * 66/60,
                    // color: Colors.blueGrey,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      child: SizedBox(
                        child: CircularProgressIndicator(
                          value: 1 -
                              currentTime /
                                  (motions[currentPart - 1].motionTime *
                                      motions[currentPart - 1].motionCount),
                          strokeWidth: 16,
                        ),
                        width: 0.4 * width,
                        height: 0.4 * width,
                      ),
                      width: 0.4 * width,
                      height: 0.4 * width,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
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
                            fontSize: 0.024 * height
                          ),
                        ),
                        Text(
                          currentTime.toString(),
                          style: TextStyle(
                            fontSize: 0.06 * height,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          height: 0.1 * width,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              width: width,
              height: 0.64 * height,
            ),
            SizedBox(
              height: 0.03 * height,
            ),
            Text(
              motions[currentPart - 1].motionName,
              style: TextStyle(fontSize: 0.06 * width),
            ),
            Text(
              motions[currentPart - 1].motionCount.toString() + "회",
              style: TextStyle(fontSize: 0.05 * width),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.grey,
          child: Row(
            children: <Widget>[
              Spacer(flex: 39),
              Text(
                currentPart.toString() + "/" + allPart.toString(),
                textAlign: TextAlign.center,
              ),
              Spacer(flex: 30),
              IconButton(
                onPressed: () =>
                    print("넘어가보자 가다가 힘들면 쉬었다 가더라도 손잡고 가보자 같이 가보자"),
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 0.06 * width,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
