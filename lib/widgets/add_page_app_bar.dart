import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<String> subTexts;
  final bool isMotion;
  final ctr;
  @override
  final Size preferredSize;

  AddPageAppBar({Key key, this.subTexts, this.ctr, this.isMotion})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Column(
        children: [
          Text("${isMotion ? "동작" : "루틴"} ${ctr.isAdd ? "생성하기" : "수정하기"}"),
          Text(
            subTexts[ctr.part - 1],
            style: TextStyle(
              fontSize: 0.013 * Get.height,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      centerTitle: true,
      leading:
          IconButton(icon: Icon(Icons.arrow_back), onPressed: () => ctr.back()),
      actions: [
        ctr.part < (isMotion ? 3 : 5)
            ? TextButton(onPressed: () => ctr.next(), child: Text("다음"))
            : TextButton(
                onPressed: () => ctr.submit(),
                child: Text("전송", style: TextStyle(color: Colors.blue))),
      ],
    );
  }
}
