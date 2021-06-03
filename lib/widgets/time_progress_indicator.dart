/*
 전체 시간(allTime)과 현재 시간(currentTime)을 입력받아,
 현재 시간 / 전체 시간 => 퍼센트로 구하여 현재 진행도를 표시하는 원형 고리 위젯
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/routine_run_controller.dart';

class TimeProgressIndicator extends StatefulWidget {
  final double width, height;
  final int currentTime, allTime;
  final Color textColor, backgroundColor, valueColor;

  TimeProgressIndicator({this.width, this.height, this.textColor, this.backgroundColor, this.currentTime, this.allTime, this.valueColor});

  @override
  _TimeProgressIndicatorState createState() => _TimeProgressIndicatorState();
}

class _TimeProgressIndicatorState extends State<TimeProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          SizedBox(
            child: GetBuilder<RoutineRunController>(
              builder: (controller) => CircularProgressIndicator(
                value: 1 - widget.currentTime / widget.allTime,
                valueColor: AlwaysStoppedAnimation(widget.valueColor),
                strokeWidth: 18,
              ),
            ),
            width: 0.4 * widget.width,
            height: 0.4 * widget.width,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "time",
                  style: TextStyle(
                      fontSize: 0.024 * widget.height, color: widget.textColor),
                ),
                GetBuilder<RoutineRunController>(
                  builder: (controller) => Text(
                    widget.currentTime.toString(),
                    style: TextStyle(
                      fontSize: 0.06 * widget.height,
                      fontWeight: FontWeight.bold,
                      color: widget.textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      width: 0.4 * widget.width,
      height: 0.4 * widget.width,
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: widget.backgroundColor),
    );
  }
}
