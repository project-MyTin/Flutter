import 'package:flutter/material.dart';

class RoutineAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            RoutineAddHeader(height),

          ],
        ),
      ),
    );
  }
}


class RoutineAddHeader extends StatelessWidget {
  final double height;

  RoutineAddHeader(this.height);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {},
          ),
        ),
        Text(
          "루틴 등록하기",
          style: TextStyle(fontSize: 0.04 * height),
        ),
        Text(
          "원하는 동작을 추가해주세요",
          style: TextStyle(fontSize: 0.018 * height),
        )
      ],
    );
  }
}
