import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytin/dummies/routine_detail_dummy.dart';
import 'package:mytin/models/routine_detail.dart';

class RoutineDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return SafeArea(
        child: Scaffold(
      appBar: buildRoutineDetailAppBar(),
      body: Center(
        child: SizedBox(
          width: 0.8 * width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.network(routine.imageUrl, fit: BoxFit.cover),
                height: 0.2 * height,
                width: 1 * width,
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0.01 * height),
              ),
              buildTextWithStyle(routine.publisher, Colors.grey, 0.02 * height),
              buildTextWithStyle(routine.name, Colors.black, 0.04 * height),
              buildTextWithStyle("루틴 난이도 : " + routine.difficulty, Colors.black,
                  0.02 * height),
              Padding(
                padding:
                    EdgeInsets.fromLTRB(0, 0.02 * height, 0, 0.04 * height),
                child: Text(
                  routine.description,
                  style:
                      TextStyle(color: Colors.grey, fontSize: 0.018 * height),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.access_time, size: 0.016 * height),
                  buildTextWithStyle(routine.time.toString() + "분", Colors.grey,
                      0.016 * height),
                  SizedBox(width: 0.05 * width),
                  buildTextWithStyle(
                      "준비물 : " + routine.materials[0].toString() + " 등",
                      Colors.grey,
                      0.016 * height),
                  // TODO : 준비물에서 넘치는 글자 해결해주기!
                ],
              ),
              buildMotionList(height),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildTextWithStyle(
                      "루틴 유형 : " + routine.type, Colors.black, 0.016 * height),
                  Row(
                    children: [
                      buildTextWithStyle(
                          (routine.authority == Authority.admin ? "공식" : "비공식"),
                          Colors.blue,
                          0.016 * height),
                      buildTextWithStyle(" 루틴", Colors.grey, 0.016 * height)
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildRoutineDetailBottomBar(),
    ));
  }

  Container buildMotionList(double height) {
    return Container(
              margin: EdgeInsets.fromLTRB(0, 0.01 * height, 0, 0.01 * height),
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Color.fromARGB(255, 200, 200, 200)),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              height: 0.2 * height,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  for (MotionElement motion in routine.motions)
                    MotionTile(motion) // 위젯에서 반복문 쓰기!
                ],
              ),
            );
  }

  Container buildRoutineDetailBottomBar() {
    return Container(
      color: Colors.grey,
      child: TextButton(
        child: Text(
          "시작하기",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => print("시작좀 하자!"),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith((Set states) => Colors.grey)),
      ),
    );
  }

  AppBar buildRoutineDetailAppBar() {
    return AppBar(
      title: Text(routine.name, style: TextStyle(color: Colors.white)),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
        onPressed: () => print("나 나갈래!"),
      ),
      actions: [
        IconButton(
            icon: Icon(Icons.delete, color: Colors.white),
            onPressed: () => print("지울래!")),
        IconButton(
            icon: Icon(Icons.edit, color: Colors.white),
            onPressed: () => print("수정할래!"))
      ],
    );
  }

  Text buildTextWithStyle(String text, Color textColor, double size) {
    return Text(
      text,
      style: TextStyle(color: textColor, fontSize: size),
    );
  }
}

class MotionTile extends StatelessWidget {
  MotionTile(this.motion);

  final MotionElement motion;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return Container(
      margin: EdgeInsets.all(0.005 * height),
      decoration: BoxDecoration(
          border:
          Border.all(color: Color.fromARGB(255, 220, 220, 220)),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: ListTile(
        leading: Image.network(
          motion.imageUrl,
          fit: BoxFit.cover,
          width: 0.12 * width,
          height: 0.12 * width,
        ),
        title: Text(motion.name),
        subtitle: Text(motion.part),
        trailing: Text(motion.count.toString() + "회"),
      ),
    );
  }
}
