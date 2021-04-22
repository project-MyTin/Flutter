import 'package:get/get.dart';
import 'package:mytin/controllers/routine_run_controller.dart';
import 'package:mytin/dummies/routine_detail_dummy.dart';
import 'package:flutter/material.dart';
import 'package:mytin/widgets/break_time_body.dart';
import 'package:mytin/widgets/time_progress_indicator.dart';

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
                  buildRoutineRunBody(controller, width, height),
                  SizedBox(height: 0.03 * height),
                  buildMotionInformation(controller, width),
                  Spacer(),
                  buildRoutineRunBottomAppBar(controller, height, width),
                ],
              ),
              if (controller.isBreakTime) BreakTimeBody(),
            ],
          ),
        ),
      ),
    );
  }

  Column buildMotionInformation(CountdownController controller, double width) {
    return Column(
      children: [
        Text(
          controller.motionList[controller.index].name,
          style: TextStyle(fontSize: 0.06 * width),
        ),
        Text(
          controller.motionList[controller.index].count.toString() + "회",
          style: TextStyle(
              fontSize: 0.05 * width,
              color: Color.fromARGB(255, 100, 100, 100)),
        ),
      ],
    );
  }

  SizedBox buildRoutineRunBody(
      CountdownController controller, double width, double height) {
    return SizedBox(
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
            child: TimeProgressIndicator(
              width: width,
              height: height,
              currentTime: controller.currentTime,
              allTime: controller.motionList[controller.index].time *
                  controller.motionList[controller.index].count,
              textColor: Color.fromARGB(255, 100, 100, 100),
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
      width: width,
      height: 0.64 * height,
    );
  }

  Container buildRoutineRunBottomAppBar(
      CountdownController controller, double height, double width) {
    return Container(
      color: Colors.grey,
      height: 0.06 * height,
      child: Row(
        children: <Widget>[
          Spacer(flex: 4),
          Text(
            (controller.index + 1).toString() +
                "/" +
                controller.motionList.length.toString(),
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
