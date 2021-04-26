import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/motion_add_controller.dart';
import 'package:mytin/models/motion_detail.dart';
import 'package:mytin/screens/motion/screen_motion_add.dart';
import 'package:mytin/widgets/button_bottom_app_bar.dart';

class MotionDetailDialog extends StatelessWidget {
  final MotionDetail motion;

  MotionDetailDialog(this.motion);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        child: Column(
          children: [
            Stack(
              children: [
                buildMotionDetailHeader(height, width),
                buildMotionDetailIcon(height, width),
              ],
            ),
            buildMotionDetailBody(width, height),
            Spacer(),
            Text("작성자 · " + motion.publisher,
                style: TextStyle(fontSize: 0.026 * width)),
            SizedBox(height: 0.005 * height),
            ButtonBottomAppBar(
                clickFunc: Get.back, isShow: true, isDialog: true, text: "닫기"),
          ],
        ),
        height: 0.65 * height,
        width: 0.8 * width,
      ),
      elevation: 20,
    );
  }

  Padding buildMotionDetailIcon(double height, double width) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0.225 * height, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildCircleBorderTextBox(motion.type, "유형", width),
          buildCircleBorderTextBox(motion.difficulty, "난이도", width),
          buildCircleBorderTextBox(motion.time.toString() + "초", "시간", width),
        ],
      ),
    );
  }

  Padding buildMotionDetailBody(double width, double height) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.06 * width, 0, 0.06 * width, 0),
      child: Column(
        children: [
          SizedBox(height: 0.04 * height),
          Text(motion.description,
              style: TextStyle(fontSize: 0.032 * width, color: Colors.grey)),
          SizedBox(height: 0.02 * height),
          Container(
            child: Text("참고 url : ", style: TextStyle(fontSize: 0.03 * width)),
            color: Colors.black.withOpacity(0.06),
            padding: EdgeInsets.all(0.01 * width),
            width: 0.65 * width,
          ),
          Container(
            child: Text(motion.referenceUrl,
                style:
                    TextStyle(fontSize: 0.028 * width, color: Colors.blueGrey)),
            color: Colors.black.withOpacity(0.06),
            padding: EdgeInsets.fromLTRB(
                0.01 * width, 0, 0.01 * width, 0.01 * width),
            width: 0.65 * width,
          ),
        ],
      ),
    );
  }

  Column buildCircleBorderTextBox(String value, String key, double width) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(value, style: TextStyle(fontSize: 0.032 * width)),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
                color: Colors.grey.withOpacity(0.5), width: 0.01 * width),
          ),
          height: 0.17 * width,
          width: 0.17 * width,
        ),
        SizedBox(height: 0.02 * width),
        Text(key, style: TextStyle(fontSize: 0.035 * width))
      ],
    );
  }

  Container buildMotionDetailHeader(double height, double width) {
    return Container(
      height: 0.26 * height,
      width: 0.8 * width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(motion.imageUrl),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.darken)),
      ),
      child: Column(
        children: [
          buildIconButtonRow(height),
          Spacer(flex: 5),
          Text(motion.name,
              style: TextStyle(color: Colors.white, fontSize: 0.032 * height)),
          SizedBox(height: 0.005 * height),
          Text(motion.part,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 0.02 * height)),
          Spacer(flex: 2),
        ],
      ),
    );
  }

  Row buildIconButtonRow(double height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          child: Padding(
            padding: EdgeInsets.all(0.01 * height),
            child: Icon(
              Icons.edit,
              color: Colors.white.withOpacity(0.5),
              size: 0.03 * height,
            ),
          ),
          onTap: () {
            Get.put(MotionAddController.edit(motion.id));
            Get.to(() => MotionAddPage());
          },
        ),
        Padding(
          padding: EdgeInsets.all(0.01 * height),
          child: Icon(
            Icons.delete,
            color: Colors.white.withOpacity(0.5),
            size: 0.03 * height,
          ),
        ),
      ],
    );
  }
}
